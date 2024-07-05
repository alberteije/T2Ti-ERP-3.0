{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [NFSE_CABECALHO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.COM                                          
                                                                                
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
*******************************************************************************}
unit NfseCabecalhoService;

interface

uses
  NfseCabecalho, NfseDetalhe, NfseIntermediario, Cliente, OsAbertura, Pessoa,
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils,
  Biblioteca,

  ACBrDFeSSL, pnfsNFSe, pcnConversao, pnfsConversao, ACBrNFSeDANFSeRLClass, ACBrNFSe;

type

  TNfseCabecalhoService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaNfseCabecalho: TObjectList<TNfseCabecalho>); overload;
    class procedure AnexarObjetosVinculados(ANfseCabecalho: TNfseCabecalho); overload;
    class procedure InserirObjetosFilhos(ANfseCabecalho: TNfseCabecalho);
    class procedure ExcluirObjetosFilhos(ANfseCabecalho: TNfseCabecalho);

    class procedure ConfigurarNfse;
  public
    class function ConsultarLista: TObjectList<TNfseCabecalho>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TNfseCabecalho>;
    class function ConsultarObjeto(AId: Integer): TNfseCabecalho;
    class procedure Inserir(ANfseCabecalho: TNfseCabecalho);
    class function Alterar(ANfseCabecalho: TNfseCabecalho): Integer;
    class function Excluir(ANfseCabecalho: TNfseCabecalho): Integer;

    class procedure CalcularTotais(ANfseCabecalho: TNfseCabecalho);
    class function TransmitirNfse(ANfseCabecalho: TNfseCabecalho): string;
  end;

var
  ACBrNFSe: TACBrNFSe;
  ACBrNFSeDANFSeRL: TACBrNFSeDANFSeRL;
  sql: string;


implementation

{ TNfseCabecalhoService }

class procedure TNfseCabecalhoService.AnexarObjetosVinculados(ANfseCabecalho: TNfseCabecalho);
begin
  // NfseDetalhe
  sql := 'SELECT * FROM NFSE_DETALHE WHERE ID_NFSE_CABECALHO = ' + ANfseCabecalho.Id.ToString;
  ANfseCabecalho.ListaNfseDetalhe := GetQuery(sql).AsObjectList<TNfseDetalhe>;

  // NfseIntermediario
  sql := 'SELECT * FROM NFSE_INTERMEDIARIO WHERE ID_NFSE_CABECALHO = ' + ANfseCabecalho.Id.ToString;
  ANfseCabecalho.NfseIntermediario := GetQuery(sql).AsObject<TNfseIntermediario>;

  // Cliente
  sql := 'SELECT * FROM CLIENTE WHERE ID = ' + ANfseCabecalho.IdCliente.ToString;
  ANfseCabecalho.Cliente := GetQuery(sql).AsObject<TCliente>;

  // Pessoa - inserido manualmente
  // retornar view PESSOA_CLIENTE
//  sql := 'SELECT * FROM PESSOA WHERE ID = ' + ANfseCabecalho.Cliente.IdPessoa.ToString;
//  ANfseCabecalho.Cliente.Pessoa := GetQuery(sql).AsObject<TPessoa>;

  // OsAbertura
  sql := 'SELECT * FROM OS_ABERTURA WHERE ID = ' + ANfseCabecalho.IdOsAbertura.ToString;
  ANfseCabecalho.OsAbertura := GetQuery(sql).AsObject<TOsAbertura>;

end;

class procedure TNfseCabecalhoService.AnexarObjetosVinculados(AListaNfseCabecalho: TObjectList<TNfseCabecalho>);
var
  NfseCabecalho: TNfseCabecalho;
begin
  for NfseCabecalho in AListaNfseCabecalho do
  begin
    AnexarObjetosVinculados(NfseCabecalho);
  end;
end;

class function TNfseCabecalhoService.ConsultarLista: TObjectList<TNfseCabecalho>;
begin
  sql := 'SELECT * FROM NFSE_CABECALHO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TNfseCabecalho>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TNfseCabecalhoService.ConsultarListaFiltro(AWhere: string): TObjectList<TNfseCabecalho>;
begin
  sql := 'SELECT * FROM NFSE_CABECALHO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TNfseCabecalho>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TNfseCabecalhoService.ConsultarObjeto(AId: Integer): TNfseCabecalho;
begin
  sql := 'SELECT * FROM NFSE_CABECALHO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TNfseCabecalho>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TNfseCabecalhoService.Inserir(ANfseCabecalho: TNfseCabecalho);
begin
  ANfseCabecalho.ValidarInsercao;
  ANfseCabecalho.Id := InserirBase(ANfseCabecalho, 'NFSE_CABECALHO');
  InserirObjetosFilhos(ANfseCabecalho);
end;

class function TNfseCabecalhoService.Alterar(ANfseCabecalho: TNfseCabecalho): Integer;
begin
  ANfseCabecalho.ValidarAlteracao;
  Result := AlterarBase(ANfseCabecalho, 'NFSE_CABECALHO');
  ExcluirObjetosFilhos(ANfseCabecalho);
  InserirObjetosFilhos(ANfseCabecalho);
end;

class procedure TNfseCabecalhoService.InserirObjetosFilhos(ANfseCabecalho: TNfseCabecalho);
var
  NfseDetalhe: TNfseDetalhe;
begin
  // NfseDetalhe
  for NfseDetalhe in ANfseCabecalho.ListaNfseDetalhe do
  begin
    NfseDetalhe.IdNfseCabecalho := ANfseCabecalho.Id;
    InserirBase(NfseDetalhe, 'NFSE_DETALHE');
  end;

  // NfseIntermediario
  ANfseCabecalho.NfseIntermediario.IdNfseCabecalho := ANfseCabecalho.Id;
  InserirBase(ANfseCabecalho.NfseIntermediario, 'NFSE_INTERMEDIARIO');

end;

class function TNfseCabecalhoService.Excluir(ANfseCabecalho: TNfseCabecalho): Integer;
begin
  ANfseCabecalho.ValidarExclusao;
  ExcluirObjetosFilhos(ANfseCabecalho);
  Result := ExcluirBase(ANfseCabecalho.Id, 'NFSE_CABECALHO');
end;

class procedure TNfseCabecalhoService.ExcluirObjetosFilhos(ANfseCabecalho: TNfseCabecalho);
begin
  ExcluirFilho(ANfseCabecalho.Id, 'NFSE_DETALHE', 'ID_NFSE_CABECALHO');
  ExcluirFilho(ANfseCabecalho.Id, 'NFSE_INTERMEDIARIO', 'ID_NFSE_CABECALHO');
end;

{$Region 'Métodos da NFS-e'}
class procedure TNfseCabecalhoService.ConfigurarNfse;
var
  PathMensal: String;
begin
  // Configuração - Certificado
// {$IFDEF ACBrNFSeOpenSSL}
//   ACBrNFSe.Configuracoes.Certificados.Certificado := edtCaminho.Text;
//   ACBrNFSe.Configuracoes.Certificados.Senha       := edtSenha.Text;
// {$ELSE}
   ACBrNFSe.Configuracoes.Certificados.NumeroSerie := '0ac34c7ac4e504c341e066c4';
// {$ENDIF}

// ACBrNFSe.Configuracoes.Certificados.VerificarValidade := True;

  ACBrNFSe.SSL.DescarregarCertificado;

  // Configuração - Arquivos
  ACBrNFSe.Configuracoes.Arquivos.AdicionarLiteral := True;
  ACBrNFSe.Configuracoes.Arquivos.EmissaoPathNFSe := True;
  ACBrNFSe.Configuracoes.Arquivos.SepararPorMes := True;
  ACBrNFSe.Configuracoes.Arquivos.SepararPorCNPJ := False;
  ACBrNFSe.Configuracoes.Arquivos.PathGer := 'c:\T2Ti\NFSe';
  // ACBrNFSe.Configuracoes.Arquivos.PathNFSe := edtPathLogs.Text;
  ACBrNFSe.Configuracoes.Arquivos.PathSchemas := 'C:\ACBr\Exemplos\ACBrDFe\ACBrNFSe\Schemas\BHISS';
  ACBrNFSe.Configuracoes.Arquivos.NomeLongoNFSe := True;
  PathMensal := ACBrNFSe.Configuracoes.Arquivos.GetPathGer(0);
  ACBrNFSe.Configuracoes.Arquivos.PathCan := PathMensal;
  ACBrNFSe.Configuracoes.Arquivos.PathSalvar := PathMensal;
  ACBrNFSe.Configuracoes.Arquivos.Salvar := True;

  // Configuração - Geral
  ACBrNFSe.Configuracoes.Geral.SSLLib := libWinCrypt;
  ACBrNFSe.Configuracoes.Geral.SSLCryptLib := cryWinCrypt;
  ACBrNFSe.Configuracoes.Geral.SSLHttpLib := httpWinHttp;
  ACBrNFSe.Configuracoes.Geral.SSLXmlSignLib := xsMsXml;

  ACBrNFSe.Configuracoes.Geral.Salvar := true;
  ACBrNFSe.Configuracoes.Geral.PathIniCidades := 'C:\ACBr\Exemplos\ACBrDFe\ACBrNFSe\ArqINI';
  ACBrNFSe.Configuracoes.Geral.PathIniProvedor := 'C:\ACBr\Exemplos\ACBrDFe\ACBrNFSe\ArqINI';
  ACBrNFSe.Configuracoes.Geral.CodigoMunicipio := StrToIntDef('3106200', 0); // Belo Horizonte
  ACBrNFSe.Configuracoes.Geral.SenhaWeb := '1108983677';
  ACBrNFSe.Configuracoes.Geral.UserWeb := '10127260010';

  // Configuração - Geral - Emitente
  ACBrNFSe.Configuracoes.Geral.Emitente.CNPJ := '10793118000178';
  ACBrNFSe.Configuracoes.Geral.Emitente.InscMun := '10127260010'; // Inscrição Municipal da T2Ti criada em Belo Horizonte apenas para testes
  ACBrNFSe.Configuracoes.Geral.Emitente.RazSocial := 'T2Ti Tecnologia da Informação LTDA';
  ACBrNFSe.Configuracoes.Geral.Emitente.WebUser := '10127260010';
  ACBrNFSe.Configuracoes.Geral.Emitente.WebSenha := '1108983677';
  ACBrNFSe.Configuracoes.Geral.Emitente.WebFraseSecr := '';

  // Configuração - WebServices
  ACBrNFSe.Configuracoes.WebServices.Salvar := true;
  ACBrNFSe.Configuracoes.WebServices.Ambiente := taHomologacao;
  ACBrNFSe.Configuracoes.WebServices.Visualizar := true;
  ACBrNFSe.Configuracoes.WebServices.ProxyHost := '';
  ACBrNFSe.Configuracoes.WebServices.ProxyPort := '';
  ACBrNFSe.Configuracoes.WebServices.ProxyUser := '';
  ACBrNFSe.Configuracoes.WebServices.ProxyPass := '';
  ACBrNFSe.Configuracoes.WebServices.UF := 'MG';

  ACBrNFSe.Configuracoes.Geral.SetConfigMunicipio;

  ACBrNFSe.DANFSE := ACBrNFSeDANFSeRL;
  if ACBrNFSe.DANFSe <> nil then
  begin
    ACBrNFSe.DANFSe.Logo := 'C:\T2Ti\Imagens\logo.jpg';
    ACBrNFSe.DANFSe.PrestLogo := 'C:\T2Ti\Imagens\logo.jpg';
    ACBrNFSe.DANFSe.Prefeitura := 'PREFEITURA DE BELO HORIZONTE';
    ACBrNFSe.DANFSe.PathPDF := PathMensal;

    //  TTipoDANFSE = ( tpPadrao, tpIssDSF, tpFiorilli );
    ACBrNFSe.DANFSe.TipoDANFSE := tpPadrao;
  end;

  (*
  ACBrNFSe.MAIL.Host     := edtSmtpHost.Text;
  ACBrNFSe.MAIL.Port     := edtSmtpPort.Text;
  ACBrNFSe.MAIL.Username := edtSmtpUser.Text;
  ACBrNFSe.MAIL.Password := edtSmtpPass.Text;
  ACBrNFSe.MAIL.From     := edtEmailRemetente.Text;
  ACBrNFSe.MAIL.FromName := edtEmitRazao.Text;
  ACBrNFSe.MAIL.SetTLS   := cbEmailTLS.Checked;
  ACBrNFSe.MAIL.SetSSL   := cbEmailSSL.Checked;
  ACBrNFSe.MAIL.UseThread   := False;
  ACBrNFSe.MAIL.ReadingConfirmation := False;
  *)
end;

class procedure TNfseCabecalhoService.CalcularTotais(ANfseCabecalho: TNfseCabecalho);
var
  NfseDetalhe: TNfseDetalhe;
begin
  for NfseDetalhe in ANfseCabecalho.ListaNfseDetalhe do
  begin
   NfseDetalhe.ValorBaseCalculo := NfseDetalhe.ValorServicos -
                                   NfseDetalhe.ValorDeducoes -
                                   NfseDetalhe.ValorDescontoIncondicionado;

    NfseDetalhe.ValorLiquido := NfseDetalhe.ValorServicos -
                                NfseDetalhe.ValorPis -
                                NfseDetalhe.ValorCofins -
                                NfseDetalhe.ValorInss -
                                NfseDetalhe.ValorIr -
                                NfseDetalhe.ValorCsll -
                                NfseDetalhe.OutrasRetencoes -
                                NfseDetalhe.ValorIssRetido -
                                NfseDetalhe.ValorDescontoIncondicionado -
                                NfseDetalhe.ValorDescontoCondicionado;
    NfseDetalhe.ValorIss := ArredondaTruncaValor('A', NfseDetalhe.ValorBaseCalculo * NfseDetalhe.Aliquota / 100, 2);
  end;
end;

class function TNfseCabecalhoService.TransmitirNfse(ANfseCabecalho: TNfseCabecalho): string;
var
  ValorISS: Double;
begin
  ACBrNFSe := TACBrNFSe.Create(nil);
  ACBrNFSeDANFSeRL := TACBrNFSeDANFSeRL.Create(nil);
  try
    ConfigurarNfse;

    with ACBrNFSe do
    begin
      NotasFiscais.NumeroLote := '28';
      NotasFiscais.Transacao := True;

      with NotasFiscais.Add.NFSe do
      begin
        Numero := '28';
        IdentificacaoRps.Numero := FormatFloat('#########0', 28);

        // Para o provedor ISS.NET em ambiente de Homologação mudar a série para '8'
        IdentificacaoRps.Serie := 'UNICA';

        // TnfseTipoRPS = ( trRPS, trNFConjugada, trCupom );
        IdentificacaoRps.Tipo := trRPS;

        DataEmissao := Now;//EditDataEmissaoRPS.Date;

        (*
        TnfseNaturezaOperacao = ( no1, no2, no3, no4, no5, no6, no7,
                                  no50, no51, no52, no53, no54, no55, no56, no57, no58, no59,
                                  no60, no61, no62, no63, no64, no65, no66, no67, no68, no69,
                                  no70, no71, no72, no78, no79,
                                  no101, no111, no121, no201, no301,
                                  no501, no511, no541, no551, no601, no701 );
        *)
        NaturezaOperacao := no1;

        // TnfseRegimeEspecialTributacao = ( retNenhum, retMicroempresaMunicipal, retEstimativa, retSociedadeProfissionais, retCooperativa, retMicroempresarioIndividual, retMicroempresarioEmpresaPP );
        //     RegimeEspecialTributacao := retNenhum;
        RegimeEspecialTributacao := retEstimativa;

        // TnfseSimNao = ( snSim, snNao );
        OptanteSimplesNacional := snNao;

        // TnfseSimNao = ( snSim, snNao );
        IncentivadorCultural := snNao;

        // TnfseSimNao = ( snSim, snNao );
        // snSim = Ambiente de Produção
        // snNao = Ambiente de Homologação
        Producao := snNao;

        // TnfseStatusRPS = ( srNormal, srCancelado );
        Status := srNormal;

        // Somente Os provedores Betha, FISSLex e SimplISS permitem incluir no RPS
        // a TAG: OutrasInformacoes os demais essa TAG é gerada e preenchida pelo
        // WebService do provedor.

        /// EXERCICIO
        ///  Verifique a viabilidade de utilizar esse campo da tabela nfse_cabecalho
        OutrasInformacoes := 'Outras Informações T2Ti';

        // Usado quando o RPS for substituir outro
        //     RpsSubstituido.Numero := FormatFloat('#########0', i);
        //     RpsSubstituido.Serie  := 'UNICA';
        // TnfseTipoRPS = ( trRPS, trNFConjugada, trCupom );
        ///     RpsSubstituido.Tipo   := trRPS;

        Servico.Valores.ValorServicos := 10;//CDSNFSeDetalhe.FieldByName('VALOR_SERVICOS').AsFloat;
        Servico.Valores.ValorDeducoes := 0;//CDSNFSeDetalhe.FieldByName('VALOR_DEDUCOES').AsFloat;
        Servico.Valores.ValorPis := 0;//CDSNFSeDetalhe.FieldByName('VALOR_PIS').AsFloat;
        Servico.Valores.ValorCofins := 0;// CDSNFSeDetalhe.FieldByName('VALOR_COFINS').AsFloat;
        Servico.Valores.ValorInss := 0;//CDSNFSeDetalhe.FieldByName('VALOR_INSS').AsFloat;
        Servico.Valores.ValorIr := 0;//CDSNFSeDetalhe.FieldByName('VALOR_IR').AsFloat;
        Servico.Valores.ValorCsll := 0;//CDSNFSeDetalhe.FieldByName('VALOR_CSLL').AsFloat;

        // TnfseSituacaoTributaria = ( stRetencao, stNormal, stSubstituicao );
        // stRetencao = snSim
        // stNormal   = snNao

        // Neste exemplo não temos ISS Retido ( stNormal = Não )
        // Logo o valor do ISS Retido é igual a zero.
        /// EXERCICIO
        ///  Verifique o campo ISS_RETIDO da tabela nfse_detalhe
        Servico.Valores.IssRetido := stNormal;
        Servico.Valores.ValorIssRetido := 0;//CDSNFSeDetalhe.FieldByName('VALOR_ISS_RETIDO').AsFloat;

        Servico.Valores.OutrasRetencoes := 0;//CDSNFSeDetalhe.FieldByName('OUTRAS_RETENCOES').AsFloat;
        Servico.Valores.DescontoIncondicionado := 0;//CDSNFSeDetalhe.FieldByName('VALOR_DESCONTO_INCONDICIONADO').AsFloat;
        Servico.Valores.DescontoCondicionado := 0;//CDSNFSeDetalhe.FieldByName('VALOR_DESCONTO_CONDICIONADO').AsFloat;

        Servico.Valores.BaseCalculo := Servico.Valores.ValorServicos -
                                       Servico.Valores.ValorDeducoes -
                                       Servico.Valores.DescontoIncondicionado;

        // No caso do provedor Ginfes devemos informar a aliquota já dividida por 100
        // para outros provedores devemos informar por exemplo 3, mas ao fazer o calculo
        // do valor do ISS devemos dividir por 100
        Servico.Valores.Aliquota := 2;//CDSNFSeDetalhe.FieldByName('ALIQUOTA').AsFloat;

        // Valor do ISS calculado multiplicando-se a base de calculo pela aliquota
        ValorISS := Servico.Valores.BaseCalculo * Servico.Valores.Aliquota / 100;

        Servico.Valores.ValorIss := ArredondaTruncaValor('A', ValorISS, 2);

        Servico.Valores.ValorLiquidoNfse := Servico.Valores.ValorServicos -
                                            Servico.Valores.ValorPis -
                                            Servico.Valores.ValorCofins -
                                            Servico.Valores.ValorInss -
                                            Servico.Valores.ValorIr -
                                            Servico.Valores.ValorCsll -
                                            Servico.Valores.OutrasRetencoes -
                                            Servico.Valores.ValorIssRetido -
                                            Servico.Valores.DescontoIncondicionado -
                                            Servico.Valores.DescontoCondicionado;

        // TnfseResponsavelRetencao = ( ptTomador, rtPrestador );
        Servico.ResponsavelRetencao := ptTomador;

        Servico.ItemListaServico := '01.01';

        // Para o provedor ISS.NET em ambiente de Homologação
        // o Codigo CNAE tem que ser '6511102'
        // Servico.CodigoCnae := '123'; // Informação Opcional
        Servico.CodigoTributacaoMunicipio := '010100188';
        Servico.Discriminacao := '01.01 - Analise e Desenvolvimento de Sistemas';//;CDSNFSeDetalhe.FieldByName('DISCRIMINACAO').AsString;

        // Para o provedor ISS.NET em ambiente de Homologação
        // o Codigo do Municipio tem que ser '999'

        Servico.CodigoMunicipio := '3106200';

        // Informar A Exigibilidade ISS para fintelISS [1/2/3/4/5/6/7]
        Servico.ExigibilidadeISS := exiExigivel;

        // Informar para Saatri
        Servico.CodigoPais := 1058; // Brasil
        Servico.MunicipioIncidencia := StrToIntDef('3106200', 0);

       // Somente o provedor SimplISS permite infomar mais de 1 serviço
        with Servico.ItemServico.Add do
        begin
          Descricao := '01.01 - Analise e Desenvolvimento de Sistemas';//CDSNFSeDetalhe.FieldByName('DISCRIMINACAO').AsString;
          Quantidade := 1;
          ValorUnitario := 10;//CDSNFSeDetalhe.FieldByName('VALOR_SERVICOS').AsFloat;
         end;

        Prestador.Cnpj := '10793118000178';
        Prestador.InscricaoMunicipal := '10127260010'; // Inscrição Municipal da T2Ti criada em Belo Horizonte apenas para testes

        // Para o provedor ISSDigital deve-se informar também:
        Prestador.Senha := 'senha';
        Prestador.FraseSecreta := 'frase secreta';
        Prestador.cUF := 33;

        PrestadorServico.Endereco.CodigoMunicipio := '3106200';
        PrestadorServico.RazaoSocial := 'T2Ti Tecnologia da Informação LTDA';

        Tomador.IdentificacaoTomador.CpfCnpj := '12210013372';
        //     Tomador.IdentificacaoTomador.InscricaoMunicipal := '10127260010';

        Tomador.RazaoSocial := 'TESTE PESSOA FISICA';

        Tomador.Endereco.Endereco := 'RUA PRINCIPAL';
        Tomador.Endereco.Numero := '100';
        Tomador.Endereco.Complemento := 'APTO 11';
        Tomador.Endereco.Bairro := 'CENTRO';
        Tomador.Endereco.CodigoMunicipio := '3106200';
        Tomador.Endereco.UF := 'MG';
        Tomador.Endereco.CodigoPais := 1058; // Brasil
        Tomador.Endereco.CEP := '71939-720';
        //Provedor Equiplano é obrigatório o pais e IE
        Tomador.Endereco.xPais := 'BRASIL';
        Tomador.IdentificacaoTomador.InscricaoEstadual := '123456';

        Tomador.Contato.Telefone := '1122223333';
        Tomador.Contato.Email := 'nome@provedor.com.br';

        // Usado quando houver um intermediario na prestação do serviço
        //     IntermediarioServico.RazaoSocial        := 'razao';
        //     IntermediarioServico.CpfCnpj            := '00000000000';
        //     IntermediarioServico.InscricaoMunicipal := '12547478';


        // Usado quando o serviço for uma obra
        //     ConstrucaoCivil.CodigoObra := '88888';
        //     ConstrucaoCivil.Art        := '433';

      end;
    end;
    ACBrNFSe.Enviar(1);
    ACBrNFSe.NotasFiscais.ImprimirPDF;
  finally
    ACBrNFSe.Free;
    ACBrNFSeDANFSeRL.Free;
  end;
end;
{$EndRegion 'métodos da NFS-e'}

end.
