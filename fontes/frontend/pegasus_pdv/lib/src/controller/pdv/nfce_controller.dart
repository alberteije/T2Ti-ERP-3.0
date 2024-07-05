/*
Title: T2Ti ERP 3.0
Description: Controller utilizado para a NFC-e
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2021 T2Ti.COM                                          
                                                                                
Permission is hereby granted, free of charge, to any person                     
obtaining a copy of this software and associated documentation                  
files (the "Software"), to deal in the Software without                         
restriction, including without limitation the rights to use,                    
copy, modify, merge, publish, distribute, sublicense, and/or sell               
copies of the Software, and to permit persons to whom the                       
Software is furnished to do so, subject to the following                        
conditions:                                                                     
                                                                                
The above copyright notice and this permission notice shall be                  
included in all copies or substantial portions of the Software.                 
                                                                                
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,                 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES                 
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND                        
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT                     
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,                    
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING                    
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR                   
OTHER DEALINGS IN THE SOFTWARE.                                                 
                                                                                
       The author may be contacted at:                                          
           t2ti.com@gmail.com                                                   
                                                                                
@author Albert Eije (alberteije@gmail.com)                    
@version 1.0.0
*******************************************************************************/
import 'dart:async';
import 'dart:math';
import 'package:drift/drift.dart';
import 'package:pegasus_pdv/src/database/database.dart';
import 'package:pegasus_pdv/src/database/database_classes.dart';
import 'package:pegasus_pdv/src/infra/infra.dart';
import 'package:ini/ini.dart';

class NfceController {
  static NfeCabecalhoMontado? nfeCabecalhoMontado;
  static late Config config; // para trabalhar com o conteúdo INI que retorna no ACBrMonitor
  static String? _numeroMontado;
  static String? _codigoNumericoMontado;
  static int? _idNotaRecuperada;

  static Future<String> montarNfce() async {
    String nfceFormatoIni = '';
    nfceFormatoIni = montarTagInfNFe() +
        montarTagIdentificacao() +
        montarTagEmitente() +
        montarTagDestinatario() +
        montarTagProduto() +
        montarTagTotal() +
        montarTagTransportador() +
        montarTagPagamento() +
        montarTagResponsavelTecnico() +
        montarTagDadosAdicionais();
    return Future.value(nfceFormatoIni);
  }

  static Future<String> montarNfeDevolucao(String chaveAcessoNfceOriginal) async {
    String nfeFormatoIni = '';
    nfeFormatoIni = montarTagInfNFe() +
        montarTagIdentificacao() +
        montarTagEmitente() +
        montarTagDestinatario() +
        montarTagProduto() +
        montarTagTotal() +
        montarTagTransportador() +
        montarTagPagamento() +
        montarTagResponsavelTecnico() +
        montarTagDadosAdicionais() +
        montarTagDocumentoFiscalReferenciado(chaveAcessoNfceOriginal);
    return Future.value(nfeFormatoIni);
  }

  static Future<bool> gerarDadosNfceContingencia({String? chaveAcesso}) async {
    // atualizar a nota atual como off-line para posterior inutilização do número
    nfeCabecalhoMontado!.nfeCabecalho = nfeCabecalhoMontado!.nfeCabecalho!.copyWith(
      dataEntradaContingencia: Value(DateTime.now()),
      justificativaContingencia: const Value('PROBLEMAS COM ACESSO AO WEBSERVICE'),
    );
    chaveAcesso ??= gerarChaveAcesso(); // se a chave for nula, no caso da contingência, gera a chave localmente.
    await atualizarDadosNfce(chaveAcesso: chaveAcesso, statusNota: '9');

    // cria outra nota para emissão off-line
    Sessao.numeroNfce = await Sessao.db.nfeNumeroDao.consultarObjeto(1);
    final novoNumero = Sessao.numeroNfce!.numero! + 1;
    _numeroMontado = novoNumero.toString().padLeft(9, '0');
    _codigoNumericoMontado = '9${novoNumero.toString().padLeft(7, '0')}';

    nfeCabecalhoMontado!.nfeCabecalho = _clonarNfceCabecalho();

    Sessao.ultimoIniNfceEnviado = await montarNfce();

    final retorno = await _atualizarNota();
    return retorno;
  }

  static String gerarChaveAcesso() {
    // (02) cUF – Esse é o código do estado onde a empresa que vai emitir a NF-e está localizada.
    // (04) AAMM –  representa o mês e o ano da emissão da NF-e;
    // (14) CNPJ – CNPJ do emitente;
    // (02) mod – é a identificação do modelo do documento fiscal;
    // (03) Série – Série do Documento Fiscal;
    // (09) nNF – Número da Nota Fiscal Eletrônica;
    // (01) tpEmis – tipo de emissão do documento;
    // (08) cNF – código numérico da Chave de Acesso;
    // (01) cDV – Dígito Verificador da Chave de Acesso.

    final chaveSemDigito =
        // ignore: prefer_interpolation_to_compose_strings
        Biblioteca.retornarCodigoIbgeUf(Sessao.empresa!.uf!).toString() +
            Biblioteca.formatarDataAAMM(nfeCabecalhoMontado!.nfeCabecalho!.dataHoraEmissao!) +
            Sessao.empresa!.cnpj! +
            '65' +
            Sessao.numeroNfce!.serie!.padLeft(3, '0') +
            nfeCabecalhoMontado!.nfeCabecalho!.numero! +
            "1" +
            nfeCabecalhoMontado!.nfeCabecalho!.codigoNumerico!;

    final digito = Biblioteca.calcularModulo11(chaveSemDigito, 1, 9, true);
    return chaveSemDigito + digito;
  }

  static void instanciarNfceMontado() {
    nfeCabecalhoMontado = NfeCabecalhoMontado(
      nfeCabecalho: const NfeCabecalho(id: null),
      nfeDestinatario: const NfeDestinatario(id: null),
      listaNfeDetalheMontado: [],
      listaNfeInformacaoPagamento: [],
    );
  }

  static Future<bool> gerarDadosNfce() async {
    instanciarNfceMontado();

    // verfifica se já existe nfce vinculada à venda
    final cabecalho = await Sessao.db.nfeCabecalhoDao.consultarNotaPorVenda(Sessao.vendaAtual!.id!);

    if (cabecalho == null) {
      Sessao.numeroNfce = await Sessao.db.nfeNumeroDao.consultarObjeto(1);
      final novoNumero = Sessao.numeroNfce!.numero! + 1;
      _numeroMontado = novoNumero.toString().padLeft(9, '0');
      // Para evitar acessos indevidos, o código numérico deve ser aleatorio e diferente do número da nota.
      //_codigoNumericoMontado = '9' + novoNumero.toString().padLeft(7, '0');
      _codigoNumericoMontado = Random().nextInt(99999999).toString().padLeft(8, '0');
    } else {
      _numeroMontado = cabecalho.numero;
      _codigoNumericoMontado = cabecalho.codigoNumerico;
      _idNotaRecuperada = cabecalho.id;
    }

    // IDENTIFICACAO
    nfeCabecalhoMontado!.nfeCabecalho = nfeCabecalhoMontado!.nfeCabecalho!.copyWith(
      idPdvVendaCabecalho: Value(Sessao.vendaAtual!.id),
      numero: Value(_numeroMontado), // nNF -
      codigoNumerico: Value(_codigoNumericoMontado), // cNF
      serie: Value(Sessao.numeroNfce!.serie), // serie -
      naturezaOperacao: const Value('VENDA'), // natOp - venda
      codigoModelo: const Value('65'), // mod=65 - NFC-e
      dataHoraEmissao: Value(DateTime.now()), // dhEmi
      tipoOperacao: const Value('1'), // tpNF - 1=saída
      consumidorOperacao: const Value('1'), // indFinal - 1=consumidor final
      consumidorPresenca: const Value('1'), // indPres - 1=operação presencial
      localDestino: const Value('1'), // idDest - 1=operação interna
      formatoImpressaoDanfe: Value(Sessao.configuracaoNfce!.formatoImpressaoDanfe.toString()), // tpimp - 4=DANCE NFC-e 5=DANFE NFC-e em mensagem eletrônica
      ambiente: Value(Sessao.configuracaoNfce!.webserviceAmbiente.toString()), // tpAmb - 1=produção 2=homologação
      valorTotal: Value(Sessao.vendaAtual!.valorFinal), // vNF
      baseCalculoIcms: Value(Sessao.empresa!.crt!.substring(0, 1) == '1' ? 0 : Sessao.vendaAtual!.valorBaseIcms), // vBC
      valorTotalProdutos: Value(Sessao.vendaAtual!.valorVenda), // vProd
      valorDesconto: Value(Sessao.vendaAtual!.valorDesconto), // vDesc
      valorPis: const Value(0), // vPIS
      valorCofins: const Value(0), // vCOFINS
      ufEmitente: Value(Sessao.empresa!.codigoIbgeUf), // cUF
      codigoMunicipio: Value(Sessao.empresa!.codigoIbgeCidade), // cMunFG
      statusNota: Value(cabecalho == null ? '0' : cabecalho.statusNota), // "0-Em Edição"-"1-Salva"-"2-Validada"-"3-Assinada"-"4-Autorizada"-"5-Inutilizada"
    );

    // EMITENTE - Não precisa preencher a tabela, pegamos tudo da EMPRESA

    // DESTINATARIO
    Cliente? cliente;
    if (Sessao.vendaAtual!.idCliente != null) {
      cliente = await Sessao.db.clienteDao.consultarObjeto(Sessao.vendaAtual!.idCliente!);
    }
    nfeCabecalhoMontado!.nfeDestinatario = nfeCabecalhoMontado!.nfeDestinatario!.copyWith(
      cpf: Value((Sessao.vendaAtual!.cpfCnpjCliente ?? '')), // CNPJCPF
      nome: Value((Sessao.vendaAtual!.nomeCliente ?? '')), // xNome
      // inscricaoEstadual: (cliente?.inscricaoEstadual ?? ''),                            // ie
      email: Value((cliente?.email ?? '')), // email
      logradouro: Value((cliente?.logradouro ?? '')), // xLgr
      numero: Value((cliente?.numero ?? '')), // nro
      complemento: Value((cliente?.complemento ?? '')), // xCpl
      bairro: Value((cliente?.bairro ?? '')), // xBairro
      codigoMunicipio: Value((cliente?.codigoIbgeCidade ?? 0)), // cMun
      nomeMunicipio: Value((cliente?.cidade ?? '')), // xMun
      uf: Value((cliente?.uf ?? '')), // UF
      cep: Value(cliente?.cep ?? ''), // CEP
      telefone: Value((cliente?.telefone ?? '')), // fone
      codigoPais: const Value(1058), // cPais PEGAR DO CADASTRO DO DESTINATARIO
      nomePais: const Value('BRASIL'), // xPais PEGAR DO CADASTRO DO DESTINATARIO
    );

    // PRODUTO
    for (var vendaDetalhe in Sessao.listaVendaAtualDetalhe) {
      final produtoMontado = await Sessao.db.produtoDao.consultarObjetoMontado(pId: vendaDetalhe.produto!.id);
      final tributacao = await Sessao.db.tributConfiguraOfGtDao.consultarObjetoMontado(Sessao.configuracaoPdv!.idTributOperacaoFiscalPadrao!, produtoMontado!.tributGrupoTributario!.id!);

      // DETALHE
      NfeDetalheMontado nfceDetalheMontado = NfeDetalheMontado();
      NfeDetalhe nfceDetalhe = NfeDetalhe(
        id: null,
        cfop: tributacao?.tributIcmsUf!.cfop, // cfop
        codigoProduto: produtoMontado.produto!.id.toString(), // cProd
        nomeProduto: produtoMontado.produto!.nome, // xProd
        ncm: (produtoMontado.produto!.codigoNcm ?? '00000000'), // NCM
        gtin: produtoMontado.produto!.gtin ?? 'SEM GTIN', // cEAN
        gtinUnidadeTributavel: produtoMontado.produto!.gtin ?? 'SEM GTIN', // cEANTrib
        unidadeComercial: produtoMontado.produtoUnidade!.sigla, // uCom
        unidadeTributavel: produtoMontado.produtoUnidade!.sigla, // uTrib
        quantidadeComercial: vendaDetalhe.pdvVendaDetalhe!.quantidade, // qCom
        quantidadeTributavel: vendaDetalhe.pdvVendaDetalhe!.quantidade, // qTrib
        valorUnitarioComercial: vendaDetalhe.pdvVendaDetalhe!.valorUnitario, // vUnCom
        valorUnitarioTributavel: vendaDetalhe.pdvVendaDetalhe!.valorUnitario, // vUnTrib
        valorDesconto: vendaDetalhe.pdvVendaDetalhe!.valorDesconto, // vDesc
        valorSubtotal: Biblioteca.multiplicarMonetario(
            //
            vendaDetalhe.pdvVendaDetalhe!.valorUnitario,
            vendaDetalhe.pdvVendaDetalhe!.quantidade),
        valorBrutoProduto: Biblioteca.multiplicarMonetario(vendaDetalhe.pdvVendaDetalhe!.valorUnitario, vendaDetalhe.pdvVendaDetalhe!.quantidade),
        valorTotal: Biblioteca.multiplicarMonetario(
                //
                vendaDetalhe.pdvVendaDetalhe!.valorUnitario,
                vendaDetalhe.pdvVendaDetalhe!.quantidade) -
            (vendaDetalhe.pdvVendaDetalhe!.valorDesconto ?? 0),
        entraTotal: '1', // indTot
        valorTotalTributos: vendaDetalhe.pdvVendaDetalhe!.valorImpostoMunicipal! + vendaDetalhe.pdvVendaDetalhe!.valorImpostoEstadual! + vendaDetalhe.pdvVendaDetalhe!.valorImpostoFederal!,
      );
      nfceDetalheMontado.nfeDetalhe = nfceDetalhe;

      // ICMS
      NfeDetalheImpostoIcms nfceDetalheImpostoIcms = NfeDetalheImpostoIcms(
        id: null,
        csosn: tributacao?.tributIcmsUf!.csosn, // CSOSN
        cstIcms: tributacao?.tributIcmsUf!.cst, // CST
        origemMercadoria: tributacao?.tributGrupoTributario!.origemMercadoria, // orig
        modalidadeBcIcms: tributacao?.tributIcmsUf!.modalidadeBc, // modBC
        valorBcIcms: Sessao.empresa!.crt!.substring(0, 1) == '1' ? 0 : vendaDetalhe.pdvVendaDetalhe!.valorTotal, // vBC
        aliquotaIcms: tributacao?.tributIcmsUf!.aliquota, // pICMS
        valorIcms: Biblioteca.multiplicarMonetario(
            // vICMS
            vendaDetalhe.pdvVendaDetalhe!.valorTotal,
            (tributacao?.tributIcmsUf!.aliquota ?? 0) / 100),
      );
      nfceDetalheMontado.nfeDetalheImpostoIcms = nfceDetalheImpostoIcms;

      // PIS
      NfeDetalheImpostoPis nfceDetalheImpostoPis = NfeDetalheImpostoPis(
        id: null,
        cstPis: tributacao?.tributPis!.cstPis, // CST
        valorBaseCalculoPis: 0, // vBC
        aliquotaPisPercentual: 0, // pPIS
        valorPis: 0, // vPIS
      );
      nfceDetalheMontado.nfeDetalheImpostoPis = nfceDetalheImpostoPis;

      // COFINS
      NfeDetalheImpostoCofins nfceDetalheImpostoCofins = NfeDetalheImpostoCofins(
        id: null,
        cstCofins: tributacao?.tributCofins!.cstCofins, // CST
        baseCalculoCofins: 0, // vBC
        aliquotaCofinsPercentual: 0, // pCOFINS
        valorCofins: 0, // vCOFINS
      );
      nfceDetalheMontado.nfeDetalheImpostoCofins = nfceDetalheImpostoCofins;

      // atualiza o cabeçalho
      nfeCabecalhoMontado!.nfeCabecalho = nfeCabecalhoMontado!.nfeCabecalho!.copyWith(
        valorIcms: Value((nfeCabecalhoMontado!.nfeCabecalho!.valorIcms ?? 0) + nfceDetalheImpostoIcms.valorIcms!), // vICMS
        idTributOperacaoFiscal: Value(tributacao?.tributOperacaoFiscal!.id),
        valorTotalTributos: Value((nfeCabecalhoMontado!.nfeCabecalho!.valorTotalTributos ?? 0) + nfceDetalheMontado.nfeDetalhe!.valorTotalTributos!),
      );

      nfeCabecalhoMontado!.listaNfeDetalheMontado!.add(nfceDetalheMontado);
    }

    // PAGAMENTO
    for (var pagamento in Sessao.listaDadosPagamento) {
      final tipoFiltrado = Sessao.listaTipoPagamento!.where(((tipo) => tipo.id == pagamento.idPdvTipoPagamento)).toList();
      final codigoPagamentoNfce = (tipoFiltrado[0].codigoPagamentoNfce ?? '01');
      NfeInformacaoPagamento nfceInformacaoPagamento = NfeInformacaoPagamento(
        id: null,
        indicadorPagamento: Sessao.listaParcelamento.isNotEmpty ? '1' : '0', // indPag - 0= Pagamento à Vista 1= Pagamento à Prazo
        meioPagamento: codigoPagamentoNfce, // tPag
        valor: pagamento.valor, // vPag
        troco: codigoPagamentoNfce == '01' ? Sessao.vendaAtual!.valorTroco : 0, // vTroco
      );
      nfeCabecalhoMontado!.listaNfeInformacaoPagamento!.add(nfceInformacaoPagamento);
    }

    final retorno = await _atualizarNota();
    return retorno;
  }

  static Future<bool> _atualizarNota() async {
    Sessao.ultimaChaveDeAcesso = gerarChaveAcesso();
    nfeCabecalhoMontado!.nfeCabecalho = nfeCabecalhoMontado!.nfeCabecalho!.copyWith(
      chaveAcesso: Value(Sessao.ultimaChaveDeAcesso),
    );

    int? idNfceCabecalho;
    if (nfeCabecalhoMontado!.nfeCabecalho!.statusNota == '0') {
      idNfceCabecalho = await Sessao.db.nfeCabecalhoDao.inserirSemLista(nfeCabecalhoMontado!); // só insere a nota se o seu status for '0'
      Sessao.numeroNfce = await Sessao.db.nfeNumeroDao.consultarObjeto(1);
    } else {
      idNfceCabecalho = _idNotaRecuperada; // venda está sendo recuperada e já existe uma nota armazenada no banco
    }
    if (idNfceCabecalho != null) {
      // inseriu ou está recuperando uma venda
      nfeCabecalhoMontado!.nfeCabecalho = nfeCabecalhoMontado!.nfeCabecalho!.copyWith(
        id: Value(idNfceCabecalho),
        statusNota: const Value('1'), // nota salva
      );
      await Sessao.db.nfeCabecalhoDao.alterarSemLista(nfeCabecalhoMontado!, atualizaFilhos: true);
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  static Future<NfeCabecalhoMontado?> getDetalhesNfce(int idVenda) async {
    final cabecalho = await Sessao.db.nfeCabecalhoDao.consultarNotaPorVenda(idVenda, status: "4");
    final nfceAutorizada = await Sessao.db.nfeCabecalhoDao.consultarObjetoMontado("id", cabecalho!.id!.toString());
    return nfceAutorizada!;
  }

  static Future<bool> gerarDadosNfeDevolucaoMercadoria(int idVenda, List<int> idItensDevolver) async {
    instanciarNfceMontado();

    // verfifica se já existe nfce vinculada à venda
    final cabecalho = await Sessao.db.nfeCabecalhoDao.consultarNotaPorVenda(idVenda, status: "4");

    if (cabecalho == null) {
      return false;
    } else {
      Sessao.numeroNfce = await Sessao.db.nfeNumeroDao.consultarObjeto(1);
      final novoNumero = Sessao.numeroNfce!.numero! + 1;
      _numeroMontado = novoNumero.toString().padLeft(9, '0');
      _codigoNumericoMontado = Random().nextInt(99999999).toString().padLeft(8, '0');
      //_idNotaRecuperada = cabecalho.id;
    }

    // IDENTIFICACAO
    nfeCabecalhoMontado!.nfeCabecalho = nfeCabecalhoMontado!.nfeCabecalho!.copyWith(
      idPdvVendaCabecalho: Value(idVenda),
      numero: Value(_numeroMontado), // nNF -
      codigoNumerico: Value(_codigoNumericoMontado), // cNF
      serie: Value(Sessao.numeroNfce!.serie), // serie -
      naturezaOperacao: const Value('DEVOLUCAO DE MERCADORIA'), // natOp - DEVOLUCAO DE MERCADORIA
      codigoModelo: const Value('55'), // mod=55 - NF-e
      dataHoraEmissao: Value(DateTime.now()), // dhEmi
      tipoOperacao: const Value('0'), // tpNF - 0=entrada
      finalidadeEmissao: const Value('4'), // finNFe - 4 (Devolução de Mercadoria)
      consumidorOperacao: const Value('1'), // indFinal - 1=consumidor final
      consumidorPresenca: const Value('1'), // indPres - 1=operação presencial
      localDestino: const Value('1'), // idDest - 1=operação interna
      formatoImpressaoDanfe: const Value("1"), // tpimp - 1=Retrato
      ambiente: Value(cabecalho.ambiente), // tpAmb - 1=produção 2=homologação
      valorTotal: const Value(0), // vNF
      baseCalculoIcms: const Value(0), // vBC
      valorTotalProdutos: const Value(0), // vProd
      valorDesconto: const Value(0), // vDesc
      valorPis: const Value(0), // vPIS
      valorCofins: const Value(0), // vCOFINS
      ufEmitente: Value(Sessao.empresa!.codigoIbgeUf), // cUF
      codigoMunicipio: Value(Sessao.empresa!.codigoIbgeCidade), // cMunFG
      statusNota: const Value('0'), // "0-Em Edição"-"1-Salva"-"2-Validada"-"3-Assinada"-"4-Autorizada"-"5-Inutilizada"
    );

    // EMITENTE - Não precisa preencher a tabela, pegamos tudo da EMPRESA

    // DESTINATARIO (No caso de uma devolucao o destinatario é a propria empresa)
    nfeCabecalhoMontado!.nfeDestinatario = nfeCabecalhoMontado!.nfeDestinatario!.copyWith(
      cnpj: Value(Sessao.empresa!.cnpj),
      nome: Value(Sessao.empresa!.razaoSocial), // xNome
      inscricaoEstadual: Value(Sessao.empresa!.inscricaoEstadual), // ie
      email: Value(Sessao.empresa!.email), // email
      logradouro: Value(Sessao.empresa!.logradouro), // xLgr
      numero: Value(Sessao.empresa!.numero), // nro
      complemento: Value(Sessao.empresa!.complemento), // xCpl
      bairro: Value(Sessao.empresa!.bairro), // xBairro
      codigoMunicipio: Value(Sessao.empresa!.codigoIbgeCidade), // cMun
      nomeMunicipio: Value(Sessao.empresa!.cidade), // xMun
      uf: Value(Sessao.empresa!.uf), // UF
      cep: Value(Sessao.empresa!.cep!.replaceAll('-', '')), // CEP
      telefone: Value(Sessao.empresa!.fone), // fone
      codigoPais: const Value(1058), // cPais
      nomePais: const Value('BRASIL'), // xPais
    );

    // PRODUTO
    final nfceAutorizada = await Sessao.db.nfeCabecalhoDao.consultarObjetoMontado("id", cabecalho.id!.toString());

    for (var vendaDetalhe in nfceAutorizada!.listaNfeDetalheMontado!) {
      if (idItensDevolver.contains(vendaDetalhe.nfeDetalhe!.id)) {
        NfeDetalhe itemDevolucao = NfeDetalhe(
          id: null,
          idNfeCabecalho: vendaDetalhe.nfeDetalhe!.idNfeCabecalho,
          numeroItem: vendaDetalhe.nfeDetalhe!.numeroItem,
          codigoProduto: vendaDetalhe.nfeDetalhe!.codigoProduto,
          gtin: vendaDetalhe.nfeDetalhe!.gtin,
          nomeProduto: vendaDetalhe.nfeDetalhe!.nomeProduto,
          ncm: vendaDetalhe.nfeDetalhe!.ncm,
          nve: vendaDetalhe.nfeDetalhe!.nve,
          cest: vendaDetalhe.nfeDetalhe!.cest,
          indicadorEscalaRelevante: vendaDetalhe.nfeDetalhe!.indicadorEscalaRelevante,
          cnpjFabricante: vendaDetalhe.nfeDetalhe!.cnpjFabricante,
          codigoBeneficioFiscal: vendaDetalhe.nfeDetalhe!.codigoBeneficioFiscal,
          exTipi: vendaDetalhe.nfeDetalhe!.exTipi,
          // Exercício: Qual CFOP de devolução deve ser utilizado? Consulte um contador para obter essa informação.
          cfop: vendaDetalhe.nfeDetalhe!.cfop == 5102 ? 1202 : 1201,
          unidadeComercial: vendaDetalhe.nfeDetalhe!.unidadeComercial,
          quantidadeComercial: vendaDetalhe.nfeDetalhe!.quantidadeComercial,
          numeroPedidoCompra: vendaDetalhe.nfeDetalhe!.numeroPedidoCompra,
          itemPedidoCompra: vendaDetalhe.nfeDetalhe!.itemPedidoCompra,
          numeroFci: vendaDetalhe.nfeDetalhe!.numeroFci,
          numeroRecopi: vendaDetalhe.nfeDetalhe!.numeroRecopi,
          valorUnitarioComercial: vendaDetalhe.nfeDetalhe!.valorUnitarioComercial,
          valorBrutoProduto: vendaDetalhe.nfeDetalhe!.valorBrutoProduto,
          gtinUnidadeTributavel: vendaDetalhe.nfeDetalhe!.gtinUnidadeTributavel,
          unidadeTributavel: vendaDetalhe.nfeDetalhe!.unidadeTributavel,
          quantidadeTributavel: vendaDetalhe.nfeDetalhe!.quantidadeTributavel,
          valorUnitarioTributavel: vendaDetalhe.nfeDetalhe!.valorUnitarioTributavel,
          valorFrete: vendaDetalhe.nfeDetalhe!.valorFrete,
          valorSeguro: vendaDetalhe.nfeDetalhe!.valorSeguro,
          valorDesconto: vendaDetalhe.nfeDetalhe!.valorDesconto,
          valorOutrasDespesas: vendaDetalhe.nfeDetalhe!.valorOutrasDespesas,
          entraTotal: vendaDetalhe.nfeDetalhe!.entraTotal,
          valorTotalTributos: vendaDetalhe.nfeDetalhe!.valorTotalTributos,
          percentualDevolvido: 100,
          valorIpiDevolvido: vendaDetalhe.nfeDetalhe!.valorIpiDevolvido,
          informacoesAdicionais: vendaDetalhe.nfeDetalhe!.informacoesAdicionais,
          valorSubtotal: vendaDetalhe.nfeDetalhe!.valorSubtotal,
          valorTotal: vendaDetalhe.nfeDetalhe!.valorTotal,
        );

        NfeDetalheImpostoIcms icms = NfeDetalheImpostoIcms(
            id: null,
            idNfeDetalhe: vendaDetalhe.nfeDetalheImpostoIcms!.idNfeDetalhe,
            origemMercadoria: vendaDetalhe.nfeDetalheImpostoIcms!.origemMercadoria,
            cstIcms: vendaDetalhe.nfeDetalheImpostoIcms!.cstIcms,
            csosn: vendaDetalhe.nfeDetalheImpostoIcms!.csosn,
            modalidadeBcIcms: vendaDetalhe.nfeDetalheImpostoIcms!.modalidadeBcIcms,
            percentualReducaoBcIcms: vendaDetalhe.nfeDetalheImpostoIcms!.percentualReducaoBcIcms,
            valorBcIcms: vendaDetalhe.nfeDetalheImpostoIcms!.valorBcIcms,
            aliquotaIcms: vendaDetalhe.nfeDetalheImpostoIcms!.aliquotaIcms,
            valorIcmsOperacao: vendaDetalhe.nfeDetalheImpostoIcms!.valorIcmsOperacao,
            percentualDiferimento: vendaDetalhe.nfeDetalheImpostoIcms!.percentualDiferimento,
            valorIcmsDiferido: vendaDetalhe.nfeDetalheImpostoIcms!.valorIcmsDiferido,
            valorIcms: vendaDetalhe.nfeDetalheImpostoIcms!.valorIcms,
            baseCalculoFcp: vendaDetalhe.nfeDetalheImpostoIcms!.baseCalculoFcp,
            percentualFcp: vendaDetalhe.nfeDetalheImpostoIcms!.percentualFcp,
            valorFcp: vendaDetalhe.nfeDetalheImpostoIcms!.valorFcp,
            modalidadeBcIcmsSt: vendaDetalhe.nfeDetalheImpostoIcms!.modalidadeBcIcmsSt,
            percentualMvaIcmsSt: vendaDetalhe.nfeDetalheImpostoIcms!.percentualMvaIcmsSt,
            percentualReducaoBcIcmsSt: vendaDetalhe.nfeDetalheImpostoIcms!.percentualReducaoBcIcmsSt,
            valorBaseCalculoIcmsSt: vendaDetalhe.nfeDetalheImpostoIcms!.valorBaseCalculoIcmsSt,
            aliquotaIcmsSt: vendaDetalhe.nfeDetalheImpostoIcms!.aliquotaIcmsSt,
            valorIcmsSt: vendaDetalhe.nfeDetalheImpostoIcms!.valorIcmsSt,
            baseCalculoFcpSt: vendaDetalhe.nfeDetalheImpostoIcms!.baseCalculoFcpSt,
            percentualFcpSt: vendaDetalhe.nfeDetalheImpostoIcms!.percentualFcpSt,
            valorFcpSt: vendaDetalhe.nfeDetalheImpostoIcms!.valorFcpSt,
            ufSt: vendaDetalhe.nfeDetalheImpostoIcms!.ufSt,
            percentualBcOperacaoPropria: vendaDetalhe.nfeDetalheImpostoIcms!.percentualBcOperacaoPropria,
            valorBcIcmsStRetido: vendaDetalhe.nfeDetalheImpostoIcms!.valorBcIcmsStRetido,
            aliquotaSuportadaConsumidor: vendaDetalhe.nfeDetalheImpostoIcms!.aliquotaSuportadaConsumidor,
            valorIcmsSubstituto: vendaDetalhe.nfeDetalheImpostoIcms!.valorIcmsSubstituto,
            valorIcmsStRetido: vendaDetalhe.nfeDetalheImpostoIcms!.valorIcmsStRetido,
            baseCalculoFcpStRetido: vendaDetalhe.nfeDetalheImpostoIcms!.baseCalculoFcpStRetido,
            percentualFcpStRetido: vendaDetalhe.nfeDetalheImpostoIcms!.percentualFcpStRetido,
            valorFcpStRetido: vendaDetalhe.nfeDetalheImpostoIcms!.valorFcpStRetido,
            motivoDesoneracaoIcms: vendaDetalhe.nfeDetalheImpostoIcms!.motivoDesoneracaoIcms,
            valorIcmsDesonerado: vendaDetalhe.nfeDetalheImpostoIcms!.valorIcmsDesonerado,
            aliquotaCreditoIcmsSn: vendaDetalhe.nfeDetalheImpostoIcms!.aliquotaCreditoIcmsSn,
            valorCreditoIcmsSn: vendaDetalhe.nfeDetalheImpostoIcms!.valorCreditoIcmsSn,
            valorBcIcmsStDestino: vendaDetalhe.nfeDetalheImpostoIcms!.valorBcIcmsStDestino,
            valorIcmsStDestino: vendaDetalhe.nfeDetalheImpostoIcms!.valorIcmsStDestino,
            percentualReducaoBcEfetivo: vendaDetalhe.nfeDetalheImpostoIcms!.percentualReducaoBcEfetivo,
            valorBcEfetivo: vendaDetalhe.nfeDetalheImpostoIcms!.valorBcEfetivo,
            aliquotaIcmsEfetivo: vendaDetalhe.nfeDetalheImpostoIcms!.aliquotaIcmsEfetivo,
            valorIcmsEfetivo: vendaDetalhe.nfeDetalheImpostoIcms!.valorIcmsEfetivo);

        NfeDetalheImpostoCofins cofins = NfeDetalheImpostoCofins(
            id: null,
            idNfeDetalhe: vendaDetalhe.nfeDetalheImpostoCofins!.idNfeDetalhe,
            cstCofins: vendaDetalhe.nfeDetalheImpostoCofins!.cstCofins,
            baseCalculoCofins: vendaDetalhe.nfeDetalheImpostoCofins!.baseCalculoCofins,
            aliquotaCofinsPercentual: vendaDetalhe.nfeDetalheImpostoCofins!.aliquotaCofinsPercentual,
            quantidadeVendida: vendaDetalhe.nfeDetalheImpostoCofins!.quantidadeVendida,
            aliquotaCofinsReais: vendaDetalhe.nfeDetalheImpostoCofins!.aliquotaCofinsReais,
            valorCofins: vendaDetalhe.nfeDetalheImpostoCofins!.valorCofins);
        NfeDetalheImpostoPis pis = NfeDetalheImpostoPis(
            id: null,
            idNfeDetalhe: vendaDetalhe.nfeDetalheImpostoPis!.idNfeDetalhe,
            cstPis: vendaDetalhe.nfeDetalheImpostoPis!.cstPis,
            valorBaseCalculoPis: vendaDetalhe.nfeDetalheImpostoPis!.valorBaseCalculoPis,
            aliquotaPisPercentual: vendaDetalhe.nfeDetalheImpostoPis!.aliquotaPisPercentual,
            valorPis: vendaDetalhe.nfeDetalheImpostoPis!.valorPis,
            quantidadeVendida: vendaDetalhe.nfeDetalheImpostoPis!.quantidadeVendida,
            aliquotaPisReais: vendaDetalhe.nfeDetalheImpostoPis!.aliquotaPisReais);
        NfeDetalheMontado detalheMontado = NfeDetalheMontado(nfeDetalhe: itemDevolucao, nfeDetalheImpostoIcms: icms, nfeDetalheImpostoCofins: cofins, nfeDetalheImpostoPis: pis);

        // atualiza o cabeçalho
        nfeCabecalhoMontado!.nfeCabecalho = nfeCabecalhoMontado!.nfeCabecalho!.copyWith(
            valorTotalProdutos: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorTotalProdutos! + vendaDetalhe.nfeDetalhe!.valorTotal!),
            valorTotal: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorTotalProdutos! + vendaDetalhe.nfeDetalhe!.valorTotal!),
            valorIcms: Value((nfeCabecalhoMontado!.nfeCabecalho!.valorIcms ?? 0) + vendaDetalhe.nfeDetalheImpostoIcms!.valorIcms!),
            baseCalculoIcms: Value(nfeCabecalhoMontado!.nfeCabecalho!.baseCalculoIcms! + vendaDetalhe.nfeDetalheImpostoIcms!.valorBcIcms!),
            valorTotalTributos: Value((nfeCabecalhoMontado!.nfeCabecalho!.valorTotalTributos ?? 0) + vendaDetalhe.nfeDetalhe!.valorTotalTributos!),
            valorDesconto: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorDesconto! + vendaDetalhe.nfeDetalhe!.valorDesconto!));

        nfeCabecalhoMontado!.listaNfeDetalheMontado!.add(detalheMontado);
      }
    }

    // PAGAMENTO
    NfeInformacaoPagamento nfceInformacaoPagamento = const NfeInformacaoPagamento(
      id: null,
      indicadorPagamento: '0', // indPag - 0= Pagamento à Vista 1= Pagamento à Prazo
      meioPagamento: '90', // tPag - 90(Sem Pagamento)
      valor: 0, // vPag
      troco: 0, // vTroco
    );
    nfeCabecalhoMontado!.listaNfeInformacaoPagamento!.add(nfceInformacaoPagamento);

    final retorno = await _atualizarNota();
    return retorno;
  }

  static String montarTagInfNFe() {
    return ' [infNFe]\n'
        ' versao=4.00\n'
        ' \n';
  }

  static String montarTagIdentificacao() {
    return
        // ignore: prefer_interpolation_to_compose_strings
        ' [Identificacao]\n'
                ' nNF=' +
            nfeCabecalhoMontado!.nfeCabecalho!.numero! +
            '\n'
                ' cNF=' +
            nfeCabecalhoMontado!.nfeCabecalho!.codigoNumerico! +
            '\n'
                ' serie=' +
            nfeCabecalhoMontado!.nfeCabecalho!.serie! +
            '\n'
                ' natOp=' +
            nfeCabecalhoMontado!.nfeCabecalho!.naturezaOperacao! +
            '\n'
                ' finNFe=' +
            (nfeCabecalhoMontado!.nfeCabecalho!.finalidadeEmissao ?? '1') +
            '\n'
                ' mod=' +
            nfeCabecalhoMontado!.nfeCabecalho!.codigoModelo! +
            '\n'
                ' dhEmi=' +
            Biblioteca.formatarDataHora(nfeCabecalhoMontado!.nfeCabecalho!.dataHoraEmissao) +
            '\n'
                ' tpNF=' +
            nfeCabecalhoMontado!.nfeCabecalho!.tipoOperacao! +
            '\n'
                ' indFinal=' +
            nfeCabecalhoMontado!.nfeCabecalho!.consumidorOperacao! +
            '\n'
                ' indPres=' +
            nfeCabecalhoMontado!.nfeCabecalho!.consumidorPresenca! +
            '\n'
                ' idDest=' +
            nfeCabecalhoMontado!.nfeCabecalho!.localDestino! +
            '\n'
                ' tpimp=' +
            nfeCabecalhoMontado!.nfeCabecalho!.formatoImpressaoDanfe! +
            '\n'
                ' tpAmb=' +
            nfeCabecalhoMontado!.nfeCabecalho!.ambiente! +
            '\n'
                ' dhCont=' +
            (nfeCabecalhoMontado!.nfeCabecalho!.dataEntradaContingencia == null ? '' : Biblioteca.formatarDataHora(nfeCabecalhoMontado!.nfeCabecalho!.dataEntradaContingencia)) +
            '\n'
                ' xJust=' +
            (nfeCabecalhoMontado!.nfeCabecalho!.justificativaContingencia ?? '') +
            '\n'
                ' \n';
  }

  static String montarTagEmitente() {
    return
        // ignore: prefer_interpolation_to_compose_strings
        ' [Emitente]\n'
                ' CNPJCPF=' +
            Sessao.empresa!.cnpj! +
            '\n'
                ' xNome=' +
            Sessao.empresa!.razaoSocial! +
            '\n'
                ' xFant=' +
            (Sessao.empresa!.nomeFantasia ?? '') +
            '\n'
                ' IE=' +
            Sessao.empresa!.inscricaoEstadual! +
            '\n'
                ' CRT=' +
            Sessao.empresa!.crt!.substring(0, 1) +
            '\n'
                ' xLgr=' +
            Sessao.empresa!.logradouro! +
            '\n'
                ' nro=' +
            Sessao.empresa!.numero! +
            '\n'
                ' xCpl=' +
            (Sessao.empresa!.complemento ?? '') +
            '\n'
                ' xBairro=' +
            Sessao.empresa!.bairro! +
            '\n'
                ' cMun=' +
            Sessao.empresa!.codigoIbgeCidade.toString() +
            '\n'
                ' xMun=' +
            Sessao.empresa!.cidade! +
            '\n'
                ' UF=' +
            Sessao.empresa!.uf! +
            '\n'
                ' CEP=' +
            Sessao.empresa!.cep! +
            '\n'
                ' cUF=' +
            Sessao.empresa!.codigoIbgeUf.toString() +
            '\n'
                ' cMunFG=\n'
                ' cPais=1058\n'
                ' xPais=BRASIL\n'
                ' \n';
  }

  static String montarTagDestinatario() {
    if (nfeCabecalhoMontado!.nfeDestinatario != null) {
      return
          // ignore: prefer_interpolation_to_compose_strings
          ' [Destinatario]\n'
                  ' CNPJCPF=' +
              ((nfeCabecalhoMontado!.nfeDestinatario!.cpf ?? nfeCabecalhoMontado!.nfeDestinatario!.cnpj) ?? '') +
              '\n'
                  ' IE=' +
              (nfeCabecalhoMontado!.nfeDestinatario!.inscricaoEstadual ?? '') +
              '\n'
                  ' xNome=' +
              (nfeCabecalhoMontado!.nfeDestinatario!.nome ?? '') +
              '\n'
                  ' indIEDest=9\n'
                  ' email=' +
              (nfeCabecalhoMontado!.nfeDestinatario!.email ?? '') +
              '\n'
                  ' xLgr=' +
              (nfeCabecalhoMontado!.nfeDestinatario!.logradouro ?? '') +
              '\n'
                  ' nro=' +
              (nfeCabecalhoMontado!.nfeDestinatario!.numero ?? '') +
              '\n'
                  ' xCpl=' +
              (nfeCabecalhoMontado!.nfeDestinatario!.complemento ?? '') +
              '\n'
                  ' xBairro=' +
              (nfeCabecalhoMontado!.nfeDestinatario!.bairro ?? '') +
              '\n'
                  ' cMun=' +
              (nfeCabecalhoMontado!.nfeDestinatario!.codigoMunicipio.toString()) +
              '\n'
                  ' xMun=' +
              (nfeCabecalhoMontado!.nfeDestinatario!.nomeMunicipio ?? '') +
              '\n'
                  ' UF=' +
              (nfeCabecalhoMontado!.nfeDestinatario!.uf ?? '') +
              '\n'
                  ' CEP=' +
              (nfeCabecalhoMontado!.nfeDestinatario!.cep ?? '') +
              '\n'
                  ' cPais=' +
              (nfeCabecalhoMontado!.nfeDestinatario!.codigoPais?.toString() ?? '') +
              '\n'
                  ' xPais=' +
              (nfeCabecalhoMontado!.nfeDestinatario!.nomePais ?? '') +
              '\n'
                  ' Fone=' +
              (nfeCabecalhoMontado!.nfeDestinatario!.telefone ?? '') +
              '\n'
                  ' \n';
    } else {
      return '';
    }
  }

  static String montarTagProduto() {
    String tagProduto = '';
    int contador = 0;
    for (var detalhe in nfeCabecalhoMontado!.listaNfeDetalheMontado!) {
      // ignore: prefer_interpolation_to_compose_strings
      tagProduto = tagProduto +
          '\n'
              ' [Produto' +
          (++contador).toString().padLeft(3, '0') +
          ']\n'
              ' CFOP=' +
          detalhe.nfeDetalhe!.cfop.toString() +
          '\n'
              ' cProd=' +
          detalhe.nfeDetalhe!.codigoProduto! +
          '\n'
              ' cEAN=' +
          detalhe.nfeDetalhe!.gtin! +
          '\n'
              ' cEANTrib=' +
          detalhe.nfeDetalhe!.gtinUnidadeTributavel! +
          '\n'
              ' xProd=' +
          detalhe.nfeDetalhe!.nomeProduto! +
          '\n'
              ' ncm=' +
          detalhe.nfeDetalhe!.ncm! +
          '\n'
              ' uCom=' +
          detalhe.nfeDetalhe!.unidadeComercial! +
          '\n'
              ' uTrib=' +
          detalhe.nfeDetalhe!.unidadeTributavel! +
          '\n'
              ' qCom=' +
          detalhe.nfeDetalhe!.quantidadeComercial.toString() +
          '\n'
              ' qTrib=' +
          detalhe.nfeDetalhe!.quantidadeTributavel.toString() +
          '\n'
              ' vUnCom=' +
          detalhe.nfeDetalhe!.valorUnitarioComercial.toString() +
          '\n'
              ' vUnTrib=' +
          detalhe.nfeDetalhe!.valorUnitarioTributavel.toString() +
          '\n'
              ' vProd=' +
          detalhe.nfeDetalhe!.valorSubtotal.toString() +
          '\n'
              ' vDesc=' +
          (detalhe.nfeDetalhe!.valorDesconto?.toString() ?? '0') +
          '\n'
              ' indTot=' +
          detalhe.nfeDetalhe!.entraTotal! +
          '\n'
              ' vTotTrib=' +
          (detalhe.nfeDetalhe!.valorTotalTributos.toString()) +
          '\n'
              ' \n'
              ' [ICMS' +
          (contador).toString().padLeft(3, '0') +
          ']\n' +
          (Sessao.empresa!.crt!.substring(0, 1) == '1' ? ' CSOSN=' + detalhe.nfeDetalheImpostoIcms!.csosn! + '\n' : ' CST=' + detalhe.nfeDetalheImpostoIcms!.cstIcms! + '\n') +
          ' orig=' +
          detalhe.nfeDetalheImpostoIcms!.origemMercadoria! +
          '\n'
              ' modBC=' +
          (detalhe.nfeDetalheImpostoIcms!.modalidadeBcIcms ?? '') +
          '\n'
              ' vBC=' +
          (detalhe.nfeDetalheImpostoIcms!.valorBcIcms?.toString() ?? '0') +
          '\n'
              ' pICMS=' +
          (detalhe.nfeDetalheImpostoIcms!.aliquotaIcms?.toString() ?? '0') +
          '\n'
              ' vICMS=' +
          (detalhe.nfeDetalheImpostoIcms!.valorIcms?.toString() ?? '0') +
          '\n'
              ' \n'
              ' [PIS' +
          (contador).toString().padLeft(3, '0') +
          ']\n'
              ' CST=' +
          detalhe.nfeDetalheImpostoPis!.cstPis! +
          '\n'
              ' vBC=' +
          detalhe.nfeDetalheImpostoPis!.valorBaseCalculoPis.toString() +
          '\n'
              ' pPIS=' +
          detalhe.nfeDetalheImpostoPis!.aliquotaPisPercentual.toString() +
          '\n'
              ' vPIS=' +
          detalhe.nfeDetalheImpostoPis!.valorPis.toString() +
          '\n'
              ' \n'
              ' [COFINS' +
          (contador).toString().padLeft(3, '0') +
          ']\n'
              ' CST=' +
          detalhe.nfeDetalheImpostoCofins!.cstCofins! +
          '\n'
              ' vBC=' +
          detalhe.nfeDetalheImpostoCofins!.baseCalculoCofins.toString() +
          '\n'
              ' pCOFINS=' +
          detalhe.nfeDetalheImpostoCofins!.aliquotaCofinsPercentual.toString() +
          '\n'
              ' vCOFINS=' +
          detalhe.nfeDetalheImpostoCofins!.valorCofins.toString() +
          '\n'
              ' \n';
    }

    return tagProduto;
  }

  static String montarTagTotal() {
    return
        // ignore: prefer_interpolation_to_compose_strings
        ' [Total]\n'
                ' vNF=' +
            nfeCabecalhoMontado!.nfeCabecalho!.valorTotal.toString() +
            '\n'
                ' vBC=' +
            nfeCabecalhoMontado!.nfeCabecalho!.baseCalculoIcms.toString() +
            '\n'
                ' vICMS=' +
            nfeCabecalhoMontado!.nfeCabecalho!.valorIcms.toString() +
            '\n'
                ' vProd=' +
            nfeCabecalhoMontado!.nfeCabecalho!.valorTotalProdutos.toString() +
            '\n'
                ' vDesc=' +
            nfeCabecalhoMontado!.nfeCabecalho!.valorDesconto.toString() +
            '\n'
                ' vPIS=' +
            nfeCabecalhoMontado!.nfeCabecalho!.valorPis.toString() +
            '\n'
                ' vCOFINS=' +
            nfeCabecalhoMontado!.nfeCabecalho!.valorCofins.toString() +
            '\n'
                ' vTotTrib=' +
            (nfeCabecalhoMontado!.nfeCabecalho!.valorTotalTributos?.toString() ?? 0 as String) +
            '\n'
                ' \n';
  }

  static String montarTagTransportador() {
    return ' [Transportador]\n'
        ' modFrete=9\n'
        ' \n';
  }

  static String montarTagPagamento() {
    String tagPagamento = '';
    int contador = 0;
    for (var pagamento in nfeCabecalhoMontado!.listaNfeInformacaoPagamento!) {
      // ignore: prefer_interpolation_to_compose_strings
      tagPagamento = tagPagamento +
          '\n'
              ' [PAG' +
          (++contador).toString().padLeft(3, '0') +
          ']\n'
              ' tpag=' +
          pagamento.meioPagamento! +
          '\n'
              ' vPag=' +
          pagamento.valor.toString() +
          '\n'
              ' indPag=' +
          pagamento.indicadorPagamento! +
          '\n'
              ' vTroco=' +
          pagamento.troco.toString() +
          '\n'
              ' \n';
    }
    return tagPagamento;
  }

  static String montarTagResponsavelTecnico() {
    return
        // ignore: prefer_interpolation_to_compose_strings
        ' [INFRESPTEC]\n'
                ' CNPJ=' +
            (Sessao.configuracaoNfce!.respTecCnpj ?? '') +
            '\n'
                ' xContato=' +
            (Sessao.configuracaoNfce!.respTecContato ?? '') +
            '\n'
                ' email=' +
            (Sessao.configuracaoNfce!.respTecEmail ?? '') +
            '\n'
                ' fone=' +
            (Sessao.configuracaoNfce!.respTecFone ?? '') +
            '\n'
                ' idcsrt=' +
            (Sessao.configuracaoNfce!.respTecIdCsrt ?? '') +
            '\n'
                ' csrt=' +
            (Sessao.configuracaoNfce!.respTecHashCsrt ?? '') +
            '\n'
                '\n';
  }

  static String montarTagDadosAdicionais() {
    return
        // ignore: prefer_interpolation_to_compose_strings
        ' [DadosAdicionais]\n'
                ' infCpl=NUMERO DA VENDA: ' +
            Sessao.vendaAtual!.id.toString() +
            '\n'
                ' \n';
  }

  static String montarTagDocumentoFiscalReferenciado(String chaveAcesso) {
    return
        // ignore: prefer_interpolation_to_compose_strings
        ' [NFRef001]\n'
                ' refNFe=' +
            chaveAcesso +
            '\n'
                ' \n';
  }

  static Future<String> verificarSeAptoParaEmitirNfce() async {
    String retorno = '';

    // verifica se a operação fiscal padrão foi informada
    if (Sessao.configuracaoPdv == null || Sessao.configuracaoPdv!.idTributOperacaoFiscalPadrao == null) {
      retorno = 'Por favor, informe a operação fiscal padrão na tela de Configurações do PDV.';
    }

    // verifica se o tipo de impressão do danfe foi cadastrado nas configurações
    if (Sessao.configuracaoNfce == null ||
        Sessao.configuracaoNfce!.caminhoSalvarPdf == null ||
        Sessao.configuracaoNfce!.caminhoSalvarXml == null ||
        Sessao.configuracaoNfce!.formatoImpressaoDanfe == null ||
        Sessao.configuracaoNfce!.webserviceAmbiente == null) {
      retorno = 'Por favor, cadastre os dados necessários na tela de Configurações da NFC-e.';
    }
    // verifica se a numeração e série foram cadastradas pelo usuário
    else if (Sessao.numeroNfce == null || Sessao.numeroNfce!.numero == null || Sessao.numeroNfce!.serie == null) {
      retorno = 'Por favor, informe os dados de numeração e série da NFC-e na tela de Configurações da NFC-e.';
    }

    // conferir todos os campos obrigatórios cadastrados para a empresa
    else if (Sessao.empresa!.codigoIbgeCidade == null ||
        Sessao.empresa!.codigoIbgeUf == null ||
        (Sessao.empresa!.razaoSocial == null || Sessao.empresa!.razaoSocial == '') ||
        (Sessao.empresa!.inscricaoEstadual == null || Sessao.empresa!.inscricaoEstadual == '') ||
        (Sessao.empresa!.crt == null || Sessao.empresa!.crt == '') ||
        (Sessao.empresa!.logradouro == null || Sessao.empresa!.logradouro == '') ||
        (Sessao.empresa!.numero == null || Sessao.empresa!.numero == '') ||
        (Sessao.empresa!.bairro == null || Sessao.empresa!.bairro == '') ||
        (Sessao.empresa!.cidade == null || Sessao.empresa!.cidade == '') ||
        (Sessao.empresa!.uf == null || Sessao.empresa!.uf == '') ||
        (Sessao.empresa!.cep == null || Sessao.empresa!.cep == '') ||
        (Sessao.empresa!.cnpj == null || Sessao.empresa!.cnpj == '')) {
      retorno = 'Por favor, informe todos os dados obrigatórios no cadastro da Empresa para a emissão da NFC-e.';
    }

    // verifica se tem produto sem grupo tributario
    final listaProduto = await Sessao.db.produtoDao.consultarProdutoSemGrupoTributario();
    if (listaProduto!.isNotEmpty) {
      retorno = 'Por favor, vincule os grupos tributários aos produtos.';
    }

    return retorno;
  }

  static Future<bool> atualizarDadosNfce({String? chaveAcesso, String? statusNota, String? motivoCancelamento, bool atualizaFilhos = false}) async {
    nfeCabecalhoMontado!.nfeCabecalho = NfceController.nfeCabecalhoMontado!.nfeCabecalho!.copyWith(
      chaveAcesso: Value(chaveAcesso),
      statusNota: Value(statusNota),
      informacoesAddContribuinte: Value(motivoCancelamento),
    );
    final retorno = await Sessao.db.nfeCabecalhoDao.alterarSemLista(NfceController.nfeCabecalhoMontado!, atualizaFilhos: atualizaFilhos);
    return retorno;
  }

  static Future<int> marcaItemDevolvido(List<int> listaIdNfeDetalhe) async {
    return Sessao.db.nfeCabecalhoDao.marcaItemDevolvido(listaIdNfeDetalhe);
  }

  static String? retornarChaveDoIni(String conteudoIni) {
    conteudoIni = removerPrimeiraLinhaDoIni(conteudoIni);
    config = Config.fromString(conteudoIni);
    final chaveNota =
        'NFe${int.tryParse(NfceController.nfeCabecalhoMontado!.nfeCabecalho!.numero!)}'; // faz o parse para tirar os zeros a esquerda do número que foi armazenado no banco de dados como String
    return config.get(chaveNota, 'chDFe');
  }

  static String? retornarMotivoRejeicao(String conteudoIni) {
    String? retorno = '';
    if (!conteudoIni.contains("[")) {
      // desceu conteúdo que não está no formato INI - a rejeição voltou em texto puro
      retorno = conteudoIni;
    } else {
      conteudoIni = removerPrimeiraLinhaDoIni(conteudoIni);
      config = Config.fromString(conteudoIni);
      if (conteudoIni.contains('Envio')) {
        retorno = config.get('Envio', 'Msg');
      } else if (conteudoIni.contains('Cancelamento')) {
        if (conteudoIni.contains('XMotivo')) {
          retorno = config.get('Cancelamento', 'XMotivo');
        } else if (conteudoIni.contains('xMotivo')) {
          retorno = config.get('Cancelamento', 'xMotivo');
        }
      } else {
        retorno = 'Rejeição não identificada';
      }
    }
    return retorno;
  }

  static String removerPrimeiraLinhaDoIni(String conteudoIni) {
    return conteudoIni.substring(conteudoIni.indexOf("["), conteudoIni.length);
  }

  static String retornarChaveDoCaminhoXml(String caminhoXml) {
    final posicaoFinal = caminhoXml.indexOf('-');
    final posicaoInicial = posicaoFinal - 44; //44 é o tamanho da chave da NF-e
    final chaveNota = caminhoXml.substring(posicaoInicial, posicaoFinal);
    return chaveNota;
  }

  // static void enviarComandoInutilizacaoNumero(
  //   {required Socket socket, required String cnpj, required String justificativa, required String ano, required String modelo, required String serie,
  //   required String numeroInicial, required String numeroFinal}
  // ) {
  //   socket.write('NFE.InutilizarNFe('
  //       +cnpj +', '
  //       +justificativa+', '
  //       +ano+', '
  //       +modelo+', '
  //       +serie+', '
  //       +numeroInicial+', '
  //       +numeroFinal+
  //     ')\r\n.\r\n');
  // }

  static bool ufPermiteContingenciaOffLine(String? uf) {
    switch (uf) {
      case 'AC':
        return true; // http://www.legis.ac.gov.br/detalhar/4285
      case 'AL':
        return true; // http://www.sefaz.al.gov.br/nfce/nfce-documentacao
      case 'AP':
        return true; // https://www.legisweb.com.br/legislacao/?id=279851
      case 'AM':
        return true; // https://online.sefaz.am.gov.br/silt/Normas/Legisla%C3%A7%C3%A3o%20Estadual/Decreto%20Estadual/Ano%202014/Arquivo/DE%2034459_14.htm
      case 'BA':
        return true; // https://www.sefaz.ba.gov.br/scripts/default/nfiscalconsumidor.asp / https://www.sefaz.ba.gov.br/especiais/_perguntas_respostas_NFCe.pdf
      case 'CE':
        return false; // https://www.legisweb.com.br/legislacao/?id=320010
      case 'DF':
        return true; // http://www.fazenda.df.gov.br/aplicacoes/legislacao/legislacao/TelaSaidaDocumento.cfm?txtNumero=387&txtAno=2019&txtTipo=7&txtParte=.
      case 'ES':
        return true; // https://internet.sefaz.es.gov.br/faleconosco/index.php?carregar=421
      case 'GO':
        return true; // https://www.economia.go.gov.br/acesso-a-informacao/241-documentos-fiscais/nfc-e/5377-perguntas-e-respostas.html
      case 'MA':
        return true; // https://sistemas1.sefaz.ma.gov.br/portalsefaz/files?codigo=9313
      case 'MT':
        return true; // http://app1.sefaz.mt.gov.br/0325677500623408/07FA81BED2760C6B84256710004D3940/F3C3E6446030BC2E84257B3300641650
      case 'MS':
        return true; // http://www.nfce.ms.gov.br/wp-content/uploads/2018/06/Cartilha-NFC-e_v2.0_06_2018_publicada.pdf
      case 'MG':
        return true; // http://www.sped.fazenda.mg.gov.br/spedmg/nfce/Perguntas-Frequentes/respostas_iii/index.html
      case 'PA':
        return true; // https://www.legisweb.com.br/legislacao/?id=272878
      case 'PB':
        return true; // https://www.sefaz.pb.gov.br/info/documentos-fiscais/nfc-e
      case 'PR':
        return true; // http://www.sped.fazenda.pr.gov.br/modules/conteudo/conteudo.php?conteudo=99
      case 'PE':
        return true; // https://www.sefaz.pe.gov.br/Servicos/Nota-Fiscal-de-Consumidor-Eletronica/Paginas/contingencia.aspx
      case 'PI':
        return true; // https://portal.sefaz.pi.gov.br/documentoseletronicos/portal/nfce/faq.php
      case 'RJ':
        return true; // http://www.fazenda.rj.gov.br/sefaz/content/conn/UCMServer/path/Contribution%20Folders/site_fazenda/informacao/sistemaseletronicos/dfe/manuais/DF-e_NFC-e.pdf?lve
      case 'RN':
        return true; // http://www.set.rn.gov.br/contentProducao/aplicacao/set_v2/nfce/gerados/contingencia.asp
      case 'RS':
        return true; // https://www.sefaz.rs.gov.br/Site/MontaDuvidas.aspx?al=l_nfe_faq_nfce
      case 'RO':
        return true; // http://www.informanet.com.br/Prodinfo/boletim/2019/ro/icms_ro_17_2019.html
      case 'RR':
        return true; // https://www.legisweb.com.br/legislacao/?id=265212
      case 'SC':
        return true; // https://blog.tecnospeed.com.br/nfc-e-santa-catarina/
      case 'SP':
        return false; // http://www.nfce.fazenda.sp.gov.br/NFCePortal/Paginas/DuvidasFrequentes.aspx
      case 'SE':
        return true; // https://www.legisweb.com.br/legislacao/?id=336177
      case 'TO':
        return true; // https://www.to.gov.br/sefaz/nfc-e/2jj2gm7nnuog
      default:
        return false;
    }
  }

  static bool ufPermiteSistemaNfce(String? uf) {
    switch (uf) {
      case 'AC':
        return true; // http://sefaznet.ac.gov.br/nfce/projetonfce.xhtml
      case 'AL':
        return true; // http://www.sefaz.al.gov.br/nfce
      case 'AP':
        return true; // https://www.sefaz.ap.gov.br/detalhes/9
      case 'AM':
        return true; // http://portalnfce.sefaz.am.gov.br/empresario/como-aderir-a-nfc-e/
      case 'BA':
        return true; // https://www.sefaz.ba.gov.br/especiais/como_se_tornar_emissor_nfce.html
      case 'CE':
        return false; // necessário realizar cadastro da SH [tem que usar um software integrador fiscal] - https://www.projetoacbr.com.br/forum/topic/58762-passos-para-cadastramento-de-software-house-e-configura%C3%A7%C3%B5es-sefaz-cear%C3%A1/
      case 'DF':
        return true; // https://www.receita.fazenda.df.gov.br/aplicacoes/CartaServicos/servico.cfm?codTipoPessoa=7&codServico=770&codSubCategoria=216
      case 'ES':
        return false; // necessário realizar credenciamento da SH - https://internet.sefaz.es.gov.br/informacoes/nfcEletronica/desenvolvedores.php
      case 'GO':
        return true; // https://www.economia.go.gov.br/receita-estadual/documentos-fiscais/nfce.html
      case 'MA':
        return true; // https://sistemas1.sefaz.ma.gov.br/portalsefaz/jsp/pagina/pagina.jsf?codigo=1693
      case 'MT':
        return true; // https://www.sefaz.mt.gov.br/portal/nfce/
      case 'MS':
        return true; // http://www.faleconosco.ms.gov.br/faq/#/detalhamentoAssunto/7/318
      case 'MG':
        return true; // http://www.sped.fazenda.mg.gov.br/spedmg/nfce/Perguntas-Frequentes/respostas_vi/index.html#f10
      case 'PA':
        return false; // necessário realizar cadastro do sofware - http://nfce.sefa.pa.gov.br/
      case 'PB':
        return true; // https://www.sefaz.pb.gov.br/info/documentos-fiscais/nfc-e#credenciamento
      case 'PR':
        return false; // necessário realizar credenciamento da SH - http://www.sped.fazenda.pr.gov.br/modules/conteudo/conteudo.php?conteudo=98
      case 'PE':
        return true; // https://www.sefaz.pe.gov.br/Servicos/Nota-Fiscal-de-Consumidor-Eletronica/Paginas/Credenciamento-de-Contribuintes.aspx
      case 'PI':
        return true; // https://portal.sefaz.pi.gov.br/documentoseletronicos/portal/nfce/faq.php
      case 'RJ':
        return true; // http://www.fazenda.rj.gov.br/sefaz/content/conn/UCMServer/path/Contribution%20Folders/site_fazenda/informacao/sistemaseletronicos/dfe/manuais/DF-e_NFC-e.pdf
      case 'RN':
        return true; // https://www.set.rn.gov.br/contentProducao/aplicacao/set_v2/nfce/gerados/credenciamentos.asp
      case 'RS':
        return true; // https://www.sefaz.rs.gov.br/Site/MontaDuvidas.aspx?al=l_nfe_faq_nfce
      case 'RO':
        return true; // http://www.informanet.com.br/Prodinfo/boletim/2019/ro/icms_ro_17_2019.html
      case 'RR':
        return true; // https://www.sefaz.rr.gov.br/nfc-e
      case 'SC':
        return false; // MONSTRO: PAF-NFC-e - https://www.sef.sc.gov.br/servicos/servico/136/NFC-e_-_Nota_Fiscal_de_Consumidor_Eletr%C3%B4nica
      case 'SP':
        return true; // http://www.nfce.fazenda.sp.gov.br/NFCePortal/Paginas/DuvidasFrequentes.aspx
      case 'SE':
        return true; // http://www.nfce.se.gov.br/portal/portalNoticias.jsp?jsp=barra-menu/conhecaNFCe/perguntasFrequentes.htm
      case 'TO':
        return true; // http://www.sefaz.to.gov.br/nfce/
      default:
        return false;
    }
  }

  static NfeCabecalho _clonarNfceCabecalho() {
    NfeCabecalho retorno = const NfeCabecalho(id: null);
    retorno = retorno.copyWith(
      idTributOperacaoFiscal: Value(nfeCabecalhoMontado!.nfeCabecalho!.idTributOperacaoFiscal),
      idPdvVendaCabecalho: Value(nfeCabecalhoMontado!.nfeCabecalho!.idPdvVendaCabecalho),
      ufEmitente: Value(nfeCabecalhoMontado!.nfeCabecalho!.ufEmitente),
      codigoNumerico: Value(_codigoNumericoMontado),
      naturezaOperacao: Value(nfeCabecalhoMontado!.nfeCabecalho!.naturezaOperacao),
      codigoModelo: Value(nfeCabecalhoMontado!.nfeCabecalho!.codigoModelo),
      serie: Value(nfeCabecalhoMontado!.nfeCabecalho!.serie),
      numero: Value(_numeroMontado),
      dataHoraEmissao: Value(nfeCabecalhoMontado!.nfeCabecalho!.dataHoraEmissao),
      dataHoraEntradaSaida: Value(nfeCabecalhoMontado!.nfeCabecalho!.dataHoraEntradaSaida),
      tipoOperacao: Value(nfeCabecalhoMontado!.nfeCabecalho!.tipoOperacao),
      localDestino: Value(nfeCabecalhoMontado!.nfeCabecalho!.localDestino),
      codigoMunicipio: Value(nfeCabecalhoMontado!.nfeCabecalho!.codigoMunicipio),
      formatoImpressaoDanfe: Value(nfeCabecalhoMontado!.nfeCabecalho!.formatoImpressaoDanfe),
      tipoEmissao: Value(nfeCabecalhoMontado!.nfeCabecalho!.tipoEmissao),
      chaveAcesso: Value(nfeCabecalhoMontado!.nfeCabecalho!.chaveAcesso),
      digitoChaveAcesso: Value(nfeCabecalhoMontado!.nfeCabecalho!.digitoChaveAcesso),
      ambiente: Value(nfeCabecalhoMontado!.nfeCabecalho!.ambiente),
      finalidadeEmissao: Value(nfeCabecalhoMontado!.nfeCabecalho!.finalidadeEmissao),
      consumidorOperacao: Value(nfeCabecalhoMontado!.nfeCabecalho!.consumidorOperacao),
      consumidorPresenca: Value(nfeCabecalhoMontado!.nfeCabecalho!.consumidorPresenca),
      processoEmissao: Value(nfeCabecalhoMontado!.nfeCabecalho!.processoEmissao),
      versaoProcessoEmissao: Value(nfeCabecalhoMontado!.nfeCabecalho!.versaoProcessoEmissao),
      dataEntradaContingencia: Value(nfeCabecalhoMontado!.nfeCabecalho!.dataEntradaContingencia),
      justificativaContingencia: Value(nfeCabecalhoMontado!.nfeCabecalho!.justificativaContingencia),
      baseCalculoIcms: Value(nfeCabecalhoMontado!.nfeCabecalho!.baseCalculoIcms),
      valorIcms: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorIcms),
      valorIcmsDesonerado: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorIcmsDesonerado),
      totalIcmsFcpUfDestino: Value(nfeCabecalhoMontado!.nfeCabecalho!.totalIcmsFcpUfDestino),
      totalIcmsInterestadualUfDestino: Value(nfeCabecalhoMontado!.nfeCabecalho!.totalIcmsInterestadualUfDestino),
      totalIcmsInterestadualUfRemetente: Value(nfeCabecalhoMontado!.nfeCabecalho!.totalIcmsInterestadualUfRemetente),
      valorTotalFcp: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorTotalFcp),
      baseCalculoIcmsSt: Value(nfeCabecalhoMontado!.nfeCabecalho!.baseCalculoIcmsSt),
      valorIcmsSt: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorIcmsSt),
      valorTotalFcpSt: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorTotalFcpSt),
      valorTotalFcpStRetido: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorTotalFcpStRetido),
      valorTotalProdutos: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorTotalProdutos),
      valorFrete: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorFrete),
      valorSeguro: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorSeguro),
      valorDesconto: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorDesconto),
      valorImpostoImportacao: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorImpostoImportacao),
      valorIpi: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorIpi),
      valorIpiDevolvido: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorIpiDevolvido),
      valorPis: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorPis),
      valorCofins: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorCofins),
      valorDespesasAcessorias: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorDespesasAcessorias),
      valorTotal: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorTotal),
      valorTotalTributos: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorTotalTributos),
      valorServicos: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorServicos),
      baseCalculoIssqn: Value(nfeCabecalhoMontado!.nfeCabecalho!.baseCalculoIssqn),
      valorIssqn: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorIssqn),
      valorPisIssqn: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorPisIssqn),
      valorCofinsIssqn: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorCofinsIssqn),
      dataPrestacaoServico: Value(nfeCabecalhoMontado!.nfeCabecalho!.dataPrestacaoServico),
      valorDeducaoIssqn: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorDeducaoIssqn),
      outrasRetencoesIssqn: Value(nfeCabecalhoMontado!.nfeCabecalho!.outrasRetencoesIssqn),
      descontoIncondicionadoIssqn: Value(nfeCabecalhoMontado!.nfeCabecalho!.descontoIncondicionadoIssqn),
      descontoCondicionadoIssqn: Value(nfeCabecalhoMontado!.nfeCabecalho!.descontoCondicionadoIssqn),
      totalRetencaoIssqn: Value(nfeCabecalhoMontado!.nfeCabecalho!.totalRetencaoIssqn),
      regimeEspecialTributacao: Value(nfeCabecalhoMontado!.nfeCabecalho!.regimeEspecialTributacao),
      valorRetidoPis: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorRetidoPis),
      valorRetidoCofins: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorRetidoCofins),
      valorRetidoCsll: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorRetidoCsll),
      baseCalculoIrrf: Value(nfeCabecalhoMontado!.nfeCabecalho!.baseCalculoIrrf),
      valorRetidoIrrf: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorRetidoIrrf),
      baseCalculoPrevidencia: Value(nfeCabecalhoMontado!.nfeCabecalho!.baseCalculoPrevidencia),
      valorRetidoPrevidencia: Value(nfeCabecalhoMontado!.nfeCabecalho!.valorRetidoPrevidencia),
      informacoesAddFisco: Value(nfeCabecalhoMontado!.nfeCabecalho!.informacoesAddFisco),
      informacoesAddContribuinte: Value(nfeCabecalhoMontado!.nfeCabecalho!.informacoesAddContribuinte),
      comexUfEmbarque: Value(nfeCabecalhoMontado!.nfeCabecalho!.comexUfEmbarque),
      comexLocalEmbarque: Value(nfeCabecalhoMontado!.nfeCabecalho!.comexLocalEmbarque),
      comexLocalDespacho: Value(nfeCabecalhoMontado!.nfeCabecalho!.comexLocalDespacho),
      compraNotaEmpenho: Value(nfeCabecalhoMontado!.nfeCabecalho!.compraNotaEmpenho),
      compraPedido: Value(nfeCabecalhoMontado!.nfeCabecalho!.compraPedido),
      compraContrato: Value(nfeCabecalhoMontado!.nfeCabecalho!.compraContrato),
      qrcode: Value(nfeCabecalhoMontado!.nfeCabecalho!.qrcode),
      urlChave: Value(nfeCabecalhoMontado!.nfeCabecalho!.urlChave),
      statusNota: const Value('0'),
    );
    return retorno;
  }
}
