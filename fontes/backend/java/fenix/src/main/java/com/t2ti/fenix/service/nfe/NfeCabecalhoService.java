/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [NFE_CABECALHO] 
                                                                                
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
*******************************************************************************/
package com.t2ti.fenix.service.nfe;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.MathContext;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.apache.commons.io.IOUtils;
import org.ini4j.InvalidFileFormatException;
import org.ini4j.Wini;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.t2ti.fenix.model.administrativo.Empresa;
import com.t2ti.fenix.model.nfe.NfeCabecalho;
import com.t2ti.fenix.model.nfe.NfeDetalhe;
import com.t2ti.fenix.model.nfe.NfeNumero;
import com.t2ti.fenix.model.transiente.CalculoNFe;
import com.t2ti.fenix.model.transiente.Filtro;
import com.t2ti.fenix.repository.nfe.NfeCabecalhoRepository;
import com.t2ti.fenix.service.administrativo.EmpresaService;
import com.t2ti.fenix.service.estoque.ControleEstoqueService;
import com.t2ti.fenix.util.Biblioteca;

@Service
public class NfeCabecalhoService {
	
	@Autowired
	private NfeCabecalhoRepository repository;
	
	@Autowired
	private EmpresaService empresaService;

	@Autowired
	private NfeNumeroService nfeNumeroService;
	
	@Autowired
	private ControleEstoqueService controleEstoqueService;
	
	@PersistenceContext
    private EntityManager entityManager;	
	
	private String caminhoComCnpj = "C:\\ACBrMonitor\\10793118000178\\";	
	
	public List<NfeCabecalho> consultarLista() {
		return repository.findAll();
	}

	@SuppressWarnings("unchecked")
	public List<NfeCabecalho> consultarLista(Filtro filtro) {
		String sql = "select * from NFE_CABECALHO where " + filtro.getWhere();
		Query query = entityManager.createNativeQuery(sql, NfeCabecalho.class);
		return query.getResultList();
		
	}
	
	public NfeCabecalho consultarObjeto(Integer id) {
		return repository.findById(id).get();
	}
	
	public NfeCabecalho salvar(NfeCabecalho objeto) throws Exception {
		calcularTotais(objeto);
		NfeNumero nfeNumero = nfeNumeroService.consultarObjeto(1);
		objeto.setNumero(String.format("%09d", nfeNumero.getNumero()));
		String codigoNumerico = String.format("%07d", nfeNumero.getNumero());
		objeto.setCodigoNumerico("9" + codigoNumerico);
		objeto.setSerie(nfeNumero.getSerie());
		objeto.setVersaoProcessoEmissao("100");
		
		nfeNumero.setNumero(nfeNumero.getNumero() + 1);
		nfeNumeroService.salvar(nfeNumero);
		
		NfeCabecalho retorno = repository.save(objeto);
		
		for (NfeDetalhe detalhe : objeto.getListaNfeDetalhe()) {
			if (objeto.getTipoOperacao().equals("0")) { // entrada
				controleEstoqueService.atualizarEstoque(detalhe.getProduto(), detalhe.getProduto().getQuantidadeEstoque(), "I");
			} else {
				controleEstoqueService.atualizarEstoque(detalhe.getProduto(), detalhe.getProduto().getQuantidadeEstoque(), "D");				
			}
		}		
		return retorno;
	}
		
	public void excluir(Integer id) {
		NfeCabecalho objeto = consultarObjeto(id);
		repository.delete(objeto);
	}

	public void calcularTotais(NfeCabecalho pNfeCabecalho)
	{
		BigDecimal TotalProdutos, ValorFrete, ValorSeguro, ValorOutrasDespesas, Desconto, BaseCalculoIcms, ValorIcms, BaseCalculoIcmsSt, ValorIcmsSt, ValorIpi, ValorPis, ValorCofins, ValorNotaFiscal;
		BigDecimal TotalServicos, BaseCalculoIssqn, ValorIssqn, ValorPisIssqn, ValorCofinsIssqn;
		// 
		TotalProdutos = BigDecimal.ZERO;
		ValorFrete = BigDecimal.ZERO;
		ValorSeguro = BigDecimal.ZERO;
		ValorOutrasDespesas = BigDecimal.ZERO;
		Desconto = BigDecimal.ZERO;
		BaseCalculoIcms = BigDecimal.ZERO;
		ValorIcms = BigDecimal.ZERO;
		BaseCalculoIcmsSt = BigDecimal.ZERO;
		ValorIcmsSt = BigDecimal.ZERO;
		ValorIpi = BigDecimal.ZERO;
		ValorPis = BigDecimal.ZERO;
		ValorCofins = BigDecimal.ZERO;
		// 
		TotalServicos = BigDecimal.ZERO;
		BaseCalculoIssqn = BigDecimal.ZERO;
		ValorIssqn = BigDecimal.ZERO;
		ValorPisIssqn = BigDecimal.ZERO;
		ValorCofinsIssqn = BigDecimal.ZERO;

		//  Pega a empresa
		Empresa empresa = empresaService.consultarObjeto(1); //  É possível pegar os dados da NfeEmitente, dependendo da estratégia definida pelo desenvolvedor

		//  Se houver CFOP cadastrado na Operação Fiscal, a nota é de serviços
		if (pNfeCabecalho.getTributOperacaoFiscal().getCfop() > 0)
		{				
			for(NfeDetalhe nfeDetalhe : pNfeCabecalho.getListaNfeDetalhe()){
				TotalServicos = Biblioteca.soma(TotalServicos, nfeDetalhe.getValorTotal());
				ValorFrete = Biblioteca.soma(ValorFrete, nfeDetalhe.getValorFrete());
				ValorSeguro = Biblioteca.soma(ValorSeguro, nfeDetalhe.getValorSeguro());
				ValorOutrasDespesas = Biblioteca.soma(ValorOutrasDespesas, nfeDetalhe.getValorOutrasDespesas());
				Desconto = Biblioteca.soma(Desconto, nfeDetalhe.getValorDesconto());
				BaseCalculoIssqn = Biblioteca.soma(BaseCalculoIssqn, nfeDetalhe.getNfeDetalheImpostoIssqn().getBaseCalculoIssqn());
				ValorIssqn = Biblioteca.soma(ValorIssqn, nfeDetalhe.getNfeDetalheImpostoIssqn().getValorIssqn());
				ValorPisIssqn = Biblioteca.soma(ValorPisIssqn, nfeDetalhe.getNfeDetalheImpostoPis().getValorPis());
				ValorCofinsIssqn = ValorCofinsIssqn 
						.add(ValorPisIssqn, MathContext.DECIMAL64)
						.add(nfeDetalhe.getNfeDetalheImpostoCofins().getValorCofins(), MathContext.DECIMAL64);
			}
			// 
			ValorNotaFiscal = TotalServicos
							.add(ValorPis, MathContext.DECIMAL64)
							.add(ValorCofins, MathContext.DECIMAL64)
							.add(ValorOutrasDespesas, MathContext.DECIMAL64)
							.subtract(Desconto, MathContext.DECIMAL64);
					
			pNfeCabecalho.setValorServicos(TotalServicos);
		}			
		else
		{
			CalculoNFe calculoNFe = new CalculoNFe();
			if (!empresa.getCrt().equals(""))
				calculoNFe.setCrtEmissor(Integer.parseInt(empresa.getCrt()));
			calculoNFe.setUfEmissor(empresa.getCodigoIbgeUf());
			if (!pNfeCabecalho.getNfeDestinatario().getCnpj().equals(""))
				calculoNFe.setTipoCliente("J");
			else
				calculoNFe.setTipoCliente("F");
			calculoNFe.setUfCliente(pNfeCabecalho.getNfeDestinatario().getUf());

			for(NfeDetalhe nfeDetalhe : pNfeCabecalho.getListaNfeDetalhe())
			{
				ProcessarCalculosNoItem(calculoNFe, nfeDetalhe);

				TotalProdutos = nfeDetalhe.getValorTotal() == null ? BigDecimal.ZERO : nfeDetalhe.getValorTotal();
				ValorFrete = nfeDetalhe.getValorFrete() == null ? BigDecimal.ZERO : nfeDetalhe.getValorFrete();
				ValorSeguro = nfeDetalhe.getValorSeguro() == null ? BigDecimal.ZERO : nfeDetalhe.getValorSeguro();
				ValorOutrasDespesas = nfeDetalhe.getValorOutrasDespesas() == null ? BigDecimal.ZERO : nfeDetalhe.getValorOutrasDespesas();
				Desconto = nfeDetalhe.getValorDesconto() == null ? BigDecimal.ZERO : nfeDetalhe.getValorDesconto();
				BaseCalculoIcms = nfeDetalhe.getNfeDetalheImpostoIcms().getValorBcIcms() == null ? BigDecimal.ZERO : nfeDetalhe.getNfeDetalheImpostoIcms().getValorBcIcms();
				ValorIcms = nfeDetalhe.getNfeDetalheImpostoIcms().getValorIcms() == null ? BigDecimal.ZERO : nfeDetalhe.getNfeDetalheImpostoIcms().getValorIcms();
				BaseCalculoIcmsSt = nfeDetalhe.getNfeDetalheImpostoIcms().getValorBaseCalculoIcmsSt() == null ? BigDecimal.ZERO : nfeDetalhe.getNfeDetalheImpostoIcms().getValorBaseCalculoIcmsSt();
				ValorIcmsSt = nfeDetalhe.getNfeDetalheImpostoIcms().getValorIcmsSt() == null ? BigDecimal.ZERO : nfeDetalhe.getNfeDetalheImpostoIcms().getValorIcmsSt();
				ValorIpi = nfeDetalhe.getNfeDetalheImpostoIpi().getValorIpi() == null ? BigDecimal.ZERO : nfeDetalhe.getNfeDetalheImpostoIpi().getValorIpi();
				ValorPis = nfeDetalhe.getNfeDetalheImpostoPis().getValorPis() == null ? BigDecimal.ZERO : nfeDetalhe.getNfeDetalheImpostoPis().getValorPis();
				ValorCofins = nfeDetalhe.getNfeDetalheImpostoCofins().getValorCofins() == null ? BigDecimal.ZERO : nfeDetalhe.getNfeDetalheImpostoCofins().getValorCofins();
			}
			// 
			ValorNotaFiscal = TotalProdutos
					.add(ValorIcmsSt, MathContext.DECIMAL64)
					.add(ValorPis, MathContext.DECIMAL64)
					.add(ValorCofins, MathContext.DECIMAL64)
					.add(ValorIpi, MathContext.DECIMAL64)
					.add(ValorOutrasDespesas, MathContext.DECIMAL64)
					.subtract(Desconto, MathContext.DECIMAL64); 
		}

		pNfeCabecalho.setValorTotalProdutos(TotalProdutos);
		pNfeCabecalho.setValorFrete(ValorFrete);
		pNfeCabecalho.setValorSeguro(ValorSeguro);
		pNfeCabecalho.setValorDespesasAcessorias(ValorOutrasDespesas);
		pNfeCabecalho.setValorDesconto(Desconto);
		pNfeCabecalho.setBaseCalculoIcms(BaseCalculoIcms);
		pNfeCabecalho.setValorIcms(ValorIcms);
		pNfeCabecalho.setBaseCalculoIcmsSt(BaseCalculoIcmsSt);
		pNfeCabecalho.setValorIcmsSt(ValorIcmsSt);
		pNfeCabecalho.setValorIpi(ValorIpi);
		pNfeCabecalho.setValorPis(ValorPis);
		pNfeCabecalho.setValorCofins(ValorCofins);
		// 
		pNfeCabecalho.setBaseCalculoIssqn(BaseCalculoIssqn);
		pNfeCabecalho.setValorIssqn(ValorIssqn);
		pNfeCabecalho.setValorPisIssqn(ValorPisIssqn);
		pNfeCabecalho.setValorCofinsIssqn(ValorCofinsIssqn);
		// 
		pNfeCabecalho.setValorTotal(ValorNotaFiscal);
	}

	private void ProcessarCalculosNoItem(CalculoNFe calculoNFe, NfeDetalhe pNfeDetalhe)
	{
		calculoNFe.setValorBrutoProdutos(pNfeDetalhe.getValorBrutoProduto());
		calculoNFe.setValorFrete(pNfeDetalhe.getValorFrete());
		calculoNFe.setValorSeguro(pNfeDetalhe.getValorSeguro());
		calculoNFe.setValorOutrasDespesas(pNfeDetalhe.getValorOutrasDespesas());
		calculoNFe.setValorDesconto(pNfeDetalhe.getValorDesconto());
		calculoNFe.setCstIcms(pNfeDetalhe.getNfeDetalheImpostoIcms().getCstIcms());
		calculoNFe.setCsosn(pNfeDetalhe.getNfeDetalheImpostoIcms().getCsosn());
		calculoNFe.setModalidadeBcIcms(pNfeDetalhe.getNfeDetalheImpostoIcms().getModalidadeBcIcms());
		calculoNFe.setTaxaReducaoBcIcms(pNfeDetalhe.getNfeDetalheImpostoIcms().getPercentualReducaoBcIcms());
		calculoNFe.setAliquotaIcms(pNfeDetalhe.getNfeDetalheImpostoIcms().getAliquotaIcms());
		calculoNFe.setAliquotaIcmsInter(pNfeDetalhe.getNfeDetalheImpostoIcms().getAliquotaIcms());
		calculoNFe.setModalidadeBcIcmsSt(pNfeDetalhe.getNfeDetalheImpostoIcms().getModalidadeBcIcmsSt());
		calculoNFe.setPercentualMvaIcmsSt(pNfeDetalhe.getNfeDetalheImpostoIcms().getPercentualMvaIcmsSt());
		calculoNFe.setReducaoBcIcmsSt(pNfeDetalhe.getNfeDetalheImpostoIcms().getPercentualReducaoBcIcmsSt());
		calculoNFe.setAliquotaIcmsSt(pNfeDetalhe.getNfeDetalheImpostoIcms().getAliquotaIcmsSt());
		calculoNFe.setAliquotaCreditoIcmsSn(pNfeDetalhe.getNfeDetalheImpostoIcms().getAliquotaCreditoIcmsSn());
		calculoNFe.setCstIpi(pNfeDetalhe.getNfeDetalheImpostoIpi().getCstIpi());
		calculoNFe.setAliquotaIpi(pNfeDetalhe.getNfeDetalheImpostoIpi().getAliquotaIpi());
		calculoNFe.setCstPis(pNfeDetalhe.getNfeDetalheImpostoPis().getCstPis());
		calculoNFe.setAliquotaPis(pNfeDetalhe.getNfeDetalheImpostoPis().getAliquotaPisPercentual());
		calculoNFe.setAliquotaPisReais(pNfeDetalhe.getNfeDetalheImpostoPis().getAliquotaPisReais());
		calculoNFe.setCstCofins(pNfeDetalhe.getNfeDetalheImpostoCofins().getCstCofins());
		calculoNFe.setAliquotaCofins(pNfeDetalhe.getNfeDetalheImpostoCofins().getAliquotaCofinsPercentual());
		calculoNFe.setAliquotaCofinsReais(pNfeDetalhe.getNfeDetalheImpostoCofins().getAliquotaCofinsReais());

		calculoNFe = NfeCalculoService.Calcular(calculoNFe);

		//  Valores ICMS 
		pNfeDetalhe.getNfeDetalheImpostoIcms().setValorBcIcms(calculoNFe.getBaseCalculoIcms());
		pNfeDetalhe.getNfeDetalheImpostoIcms().setPercentualReducaoBcIcmsSt(calculoNFe.getReducaoBcIcmsSt());
		pNfeDetalhe.getNfeDetalheImpostoIcms().setValorIcms(calculoNFe.getValorIcms());
		//  valores de ICMS ST
		pNfeDetalhe.getNfeDetalheImpostoIcms().setValorBaseCalculoIcmsSt(calculoNFe.getBaseCalculoIcmsSt());
		pNfeDetalhe.getNfeDetalheImpostoIcms().setValorIcmsSt(calculoNFe.getValorIcmsSt());
		//  credito de icmssn
		pNfeDetalhe.getNfeDetalheImpostoIcms().setValorCreditoIcmsSn(calculoNFe.getValorCreditoIcmsSn());

		//  Valores IPI 
		pNfeDetalhe.getNfeDetalheImpostoIpi().setValorBaseCalculoIpi(calculoNFe.getBaseCalculoIpi());
		pNfeDetalhe.getNfeDetalheImpostoIpi().setValorIpi(calculoNFe.getValorIpi());

		//  Valores PIS 
		pNfeDetalhe.getNfeDetalheImpostoPis().setValorBaseCalculoPis(calculoNFe.getBaseCalculoPis());
		pNfeDetalhe.getNfeDetalheImpostoPis().setValorPis(calculoNFe.getValorPis());

		//  Valores COFINS 
		pNfeDetalhe.getNfeDetalheImpostoCofins().setBaseCalculoCofins(calculoNFe.getBaseCalculoCofins());
		pNfeDetalhe.getNfeDetalheImpostoCofins().setValorCofins(calculoNFe.getValorCofins());
	}

	public String transmitirNFe(NfeCabecalho pNfeCabecalho) throws IOException, InterruptedException
	{
		//  primeiro passo - gerar o arquivo INI com a NF-e
		String caminhoArquivoIni = gerarArquivoIniNFe(pNfeCabecalho);
		// chama o método para criar a nota
		criarNFe(caminhoArquivoIni);
		// pega o caminho do XML criado
		String caminhoArquivoXml = pegarRetornoSaida("ARQUIVO-XML");
		if (caminhoArquivoXml.contains("ERRO")) {
			return caminhoArquivoXml;
		}
		
		// chama o método para criar e enviar a nota
		enviarNFe(caminhoArquivoXml);
		String retorno = pegarRetornoSaida("Envio");
		if (!retorno.contains("ERRO")) {
			// chama o método para gerar o PDF
		    imprimirDanfe(caminhoArquivoXml);
		    // captura o retorno do arquivo SAI
		    retorno = pegarRetornoSaida("ARQUIVO-PDF");
		    
		    // se chegou aqui, atualiza a chave de acesso e o status da nota
		    pNfeCabecalho.setStatusNota("4");
		    String chave = Biblioteca.reverseString(retorno);
		    chave = chave.substring(chave.indexOf("-")+1, chave.length());
		    chave = chave.substring(0, chave.indexOf("\\"));
		    chave = Biblioteca.reverseString(chave);
		    pNfeCabecalho.setChaveAcesso(chave);
		    pNfeCabecalho.setDigitoChaveAcesso(chave.substring(chave.length()-1));
		    repository.save(pNfeCabecalho);
		}		
		return retorno;
	}
	
	public String gerarPdfDanfe(String chave) throws IOException, InterruptedException {
		// pega o caminho do arquivo XML da nota em contingência
		String caminhoArquivoXml = caminhoComCnpj + "LOG_NFe\\" + chave + "-nfe.xml";
		// chama o método para gerar o PDF
		imprimirDanfe(caminhoArquivoXml);
		// captura o retorno do arquivo SAI
		return pegarRetornoSaida("ARQUIVO-PDF");	
	}
	
	public void criarNFe(String caminhoArquivoIni) throws IOException, InterruptedException {
		apagarArquivoSaida();
		gerarArquivoEntrada("NFE.CriarNFe(" + caminhoArquivoIni + ")"); 
		aguardarArquivoSaida();
	}
	
	public void enviarNFe(String caminhoArquivoXml) throws IOException, InterruptedException {
		apagarArquivoSaida();
		gerarArquivoEntrada("NFE.EnviarNFe(" + caminhoArquivoXml + ", 001, , , , 1, , )"); 
		aguardarArquivoSaida();
	}
	
	public void imprimirDanfe(String caminhoArquivoXml) throws IOException, InterruptedException {
		apagarArquivoSaida();
		gerarArquivoEntrada("NFE.ImprimirDANFEPDF(" + caminhoArquivoXml + ", , , 1,)"); 
		aguardarArquivoSaida();
	}
	
	private void gerarArquivoEntrada(String comando) throws IOException
	{
		FileWriter ArquivoEntrada = new FileWriter(caminhoComCnpj + "ent.txt");
		PrintWriter gravarArquivo = new PrintWriter(ArquivoEntrada);
		gravarArquivo.printf(comando);
		ArquivoEntrada.close();
	}
	
	private String pegarRetornoSaida(String operacao) throws IOException {
		String retorno = "";
		Wini arquivoSaida = new Wini(new File(caminhoComCnpj + "sai.txt"));

		// carrega o conteúdo completo do arquivo
		FileInputStream arquivoCompleto = new FileInputStream(caminhoComCnpj + "sai.txt"); 
		Scanner scanner = new Scanner(arquivoCompleto);		

		String codigoStatus = arquivoSaida.get(operacao, "CStat");
		String motivo = arquivoSaida.get(operacao, "XMotivo");
		
		String caminhoArquivoXml = "";
		
		try {			
			if (operacao.equals("ARQUIVO-XML")) {
	            caminhoArquivoXml = scanner.nextLine();
	            caminhoArquivoXml = caminhoArquivoXml.replaceAll("OK: ", "");
	            caminhoArquivoXml = caminhoArquivoXml.trim();
	            return caminhoArquivoXml; 
			} else if (operacao.equals("ARQUIVO-PDF")) {
				retorno = IOUtils.toString(arquivoCompleto, StandardCharsets.UTF_8.name());
				return retorno.replaceAll("OK: Arquivo criado em: ", "").trim();					
			} else if (operacao.equals("Envio")) {
				retorno = motivo;
			} else if (operacao.equals("Cancelamento")) {
				retorno = motivo;
			} else if (operacao.equals("Consulta")) {
				retorno = motivo;
			} else if (operacao.equals("Inutilizacao")) {
				return IOUtils.toString(arquivoCompleto, StandardCharsets.UTF_8.name());
			}
			
			List<String> listaStatus = Arrays.asList("", "100" , "102", "135"); // se o status não for um dos que estiverem nessa lista, vamos retornar um erro.
			
			if (!listaStatus.contains(codigoStatus)) {
				return "[ERRO] - [" + codigoStatus + "] " + motivo;
			}
		} finally {
			scanner.close(); 
		}
		return retorno;
	}
	
	private boolean apagarArquivoSaida() {
		File file = new File(caminhoComCnpj + "sai.txt"); 
		return file.delete();		
	}
	
	private boolean aguardarArquivoSaida() throws InterruptedException {
		int tempoEspera = 0;
		
		File file = new File(caminhoComCnpj + "sai.txt"); 
		while (!file.exists()) {
			Thread.sleep(1000);
			tempoEspera++;
			
			if (tempoEspera > 30) {
				return false;
			}
		}
		
		return true;
	}	
	
	
	
	private String gerarArquivoIniNFe(NfeCabecalho pNfeCabecalho) throws InvalidFileFormatException, IOException
	{
		String nomeArquivo = "c:\\t2ti\\nfe\\ini\\" + pNfeCabecalho.getNumero() + ".ini"; 
		
		File f = new File(nomeArquivo);
		try {
			f.createNewFile();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Wini NFeIni = new Wini(new File(nomeArquivo));
		String IncrementoBloco;
		//  Pega a empresa
		Empresa empresa = empresaService.consultarObjeto(1); //  É possível pegar os dados da NfeEmitente, dependendo da estratégia definida pelo desenvolvedor

		try
		{
			// *******************************************************************************************
			//   [infNFe]
			// *******************************************************************************************
			NFeIni.put("infNFe", "versao", "4.00");

			// *******************************************************************************************
			//   [Identificacao]
			// *******************************************************************************************
			NFeIni.put("Identificacao", "cNF", pNfeCabecalho.getCodigoNumerico());
			NFeIni.put("Identificacao", "natOp", pNfeCabecalho.getNaturezaOperacao());
			NFeIni.put("Identificacao", "mod", "55");
			NFeIni.put("Identificacao", "serie", pNfeCabecalho.getSerie());
			NFeIni.put("Identificacao", "nNF", pNfeCabecalho.getNumero());
			NFeIni.put("Identificacao", "dhEmi", Biblioteca.formataDataHora(pNfeCabecalho.getDataHoraEmissao()));
			NFeIni.put("Identificacao", "dhSaiEnt", "");
			NFeIni.put("Identificacao", "tpNF", pNfeCabecalho.getTipoOperacao());    // 0=Entrada; 1=Saída
			NFeIni.put("Identificacao", "idDest", pNfeCabecalho.getLocalDestino());  //  1=Operação interna; 2=Operação interestadual; 3=Operação com exterior.
			NFeIni.put("Identificacao", "tpImp", pNfeCabecalho.getFormatoImpressaoDanfe());
			NFeIni.put("Identificacao", "tpEmis", pNfeCabecalho.getTipoEmissao());
			NFeIni.put("Identificacao", "finNFe", pNfeCabecalho.getFinalidadeEmissao());
			NFeIni.put("Identificacao", "indFinal", pNfeCabecalho.getConsumidorOperacao()); // 0=Normal; 1=Consumidor final;
			NFeIni.put("Identificacao", "indPres", pNfeCabecalho.getConsumidorPresenca());
			NFeIni.put("Identificacao", "procEmi", pNfeCabecalho.getProcessoEmissao());
			NFeIni.put("Identificacao", "verProc", pNfeCabecalho.getVersaoProcessoEmissao());
			NFeIni.put("Identificacao", "dhCont", "");
			NFeIni.put("Identificacao", "xJust", "");
			NFeIni.put("Identificacao", "tpAmb", "2"); //  altera para '1' quando em produção ou trazer de tabela ADM

			// *******************************************************************************************
			//   [Emitente]
			// *******************************************************************************************
			NFeIni.put("Emitente", "CNPJCPF", empresa.getCnpj());
			NFeIni.put("Emitente", "xNome", empresa.getRazaoSocial());
			NFeIni.put("Emitente", "xFant", empresa.getNomeFantasia());
			NFeIni.put("Emitente", "IE", empresa.getInscricaoEstadual());
			NFeIni.put("Emitente", "IEST", "");
			NFeIni.put("Emitente", "IM", empresa.getInscricaoMunicipal());
			NFeIni.put("Emitente", "CNAE", empresa.getCodigoCnaePrincipal());
			NFeIni.put("Emitente", "CRT", empresa.getCrt());
			NFeIni.put("Emitente", "xLgr", empresa.getEnderecoPrincipal().getLogradouro());
			NFeIni.put("Emitente", "nro", empresa.getEnderecoPrincipal().getNumero());
			NFeIni.put("Emitente", "xCpl", empresa.getEnderecoPrincipal().getComplemento());
			NFeIni.put("Emitente", "xBairro", empresa.getEnderecoPrincipal().getBairro());
			NFeIni.put("Emitente", "cMun", empresa.getCodigoIbgeCidade().toString());
			NFeIni.put("Emitente", "xMun", empresa.getEnderecoPrincipal().getCidade());
			NFeIni.put("Emitente", "UF", empresa.getEnderecoPrincipal().getUf());
			NFeIni.put("Emitente", "CEP", empresa.getEnderecoPrincipal().getCep());
			NFeIni.put("Emitente", "cPais", "1058");
			NFeIni.put("Emitente", "xPais", "BRASIL");
			NFeIni.put("Emitente", "Fone", "");
			NFeIni.put("Emitente", "cUF", empresa.getCodigoIbgeUf().toString());
			NFeIni.put("Emitente", "cMunFG", "");

			// *******************************************************************************************
			//   [Destinatario]
			// *******************************************************************************************
			if (!pNfeCabecalho.getNfeDestinatario().getCnpj().equals(""))
				NFeIni.put("Destinatario", "CNPJCPF", pNfeCabecalho.getNfeDestinatario().getCnpj());
			else
				NFeIni.put("Destinatario", "CNPJCPF", pNfeCabecalho.getNfeDestinatario().getCpf());
			NFeIni.put("Destinatario", "xNome", pNfeCabecalho.getNfeDestinatario().getNome());
			NFeIni.put("Destinatario", "indIEDest", pNfeCabecalho.getNfeDestinatario().getIndicadorIe());
			NFeIni.put("Destinatario", "IE", pNfeCabecalho.getNfeDestinatario().getInscricaoEstadual());
			NFeIni.put("Destinatario", "email", pNfeCabecalho.getNfeDestinatario().getEmail());
			NFeIni.put("Destinatario", "xLgr", pNfeCabecalho.getNfeDestinatario().getLogradouro());
			NFeIni.put("Destinatario", "nro", pNfeCabecalho.getNfeDestinatario().getNumero());
			NFeIni.put("Destinatario", "xCpl", pNfeCabecalho.getNfeDestinatario().getComplemento());
			NFeIni.put("Destinatario", "xBairro", pNfeCabecalho.getNfeDestinatario().getBairro());
			NFeIni.put("Destinatario", "cMun", pNfeCabecalho.getNfeDestinatario().getCodigoMunicipio().toString());
			NFeIni.put("Destinatario", "xMun", pNfeCabecalho.getNfeDestinatario().getNomeMunicipio());
			NFeIni.put("Destinatario", "UF", pNfeCabecalho.getNfeDestinatario().getUf());
			NFeIni.put("Destinatario", "CEP", pNfeCabecalho.getNfeDestinatario().getCep());
			NFeIni.put("Destinatario", "cPais", pNfeCabecalho.getNfeDestinatario().getCodigoPais().toString());
			NFeIni.put("Destinatario", "xPais", pNfeCabecalho.getNfeDestinatario().getNomePais());
			NFeIni.put("Destinatario", "Fone", "");

			// *******************************************************************************************
			//   Detalhes - Produtos e Impostos
			// *******************************************************************************************
			Integer I = 0;
			for(NfeDetalhe nfeDetalhe : pNfeCabecalho.getListaNfeDetalhe())
			{
				I++;
				int tamanhoI = I.toString().length();
				IncrementoBloco = Biblioteca.repete("0", 3 - tamanhoI) + I.toString();  

				// / [Produto]
				NFeIni.put("Produto" + IncrementoBloco, "cProd", nfeDetalhe.getGtin());
				NFeIni.put("Produto" + IncrementoBloco, "cEAN", nfeDetalhe.getGtin());
				NFeIni.put("Produto" + IncrementoBloco, "xProd", nfeDetalhe.getNomeProduto());
				NFeIni.put("Produto" + IncrementoBloco, "ncm", nfeDetalhe.getNcm());
				NFeIni.put("Produto" + IncrementoBloco, "CEST", nfeDetalhe.getCest());
				NFeIni.put("Produto" + IncrementoBloco, "EXTIPI", "");// nfeDetalhe.getExtipi().toString());
				NFeIni.put("Produto" + IncrementoBloco, "CFOP", nfeDetalhe.getCfop().toString());
				NFeIni.put("Produto" + IncrementoBloco, "uCom", nfeDetalhe.getUnidadeComercial());
				NFeIni.put("Produto" + IncrementoBloco, "qCom", nfeDetalhe.getQuantidadeComercial().toString());
				NFeIni.put("Produto" + IncrementoBloco, "vUnCom", nfeDetalhe.getValorUnitarioComercial().toString());
				NFeIni.put("Produto" + IncrementoBloco, "vProd", nfeDetalhe.getValorTotal().toString());
				NFeIni.put("Produto" + IncrementoBloco, "cEANTrib", nfeDetalhe.getGtinUnidadeTributavel());
				NFeIni.put("Produto" + IncrementoBloco, "uTrib", nfeDetalhe.getUnidadeTributavel());
				NFeIni.put("Produto" + IncrementoBloco, "qTrib", nfeDetalhe.getQuantidadeTributavel().toString());
				NFeIni.put("Produto" + IncrementoBloco, "vUnTrib", nfeDetalhe.getValorUnitarioTributavel().toString());
				NFeIni.put("Produto" + IncrementoBloco, "vFrete", nfeDetalhe.getValorFrete().toString());
				NFeIni.put("Produto" + IncrementoBloco, "vSeg", nfeDetalhe.getValorSeguro().toString());
				NFeIni.put("Produto" + IncrementoBloco, "vDesc", nfeDetalhe.getValorDesconto().toString());
				NFeIni.put("Produto" + IncrementoBloco, "vOutro", nfeDetalhe.getValorOutrasDespesas().toString());
				NFeIni.put("Produto" + IncrementoBloco, "indTot", nfeDetalhe.getEntraTotal());
				NFeIni.put("Produto" + IncrementoBloco, "xPed", pNfeCabecalho.getCompraPedido());
				NFeIni.put("Produto" + IncrementoBloco, "nItemPed", nfeDetalhe.getItemPedidoCompra().toString());
				NFeIni.put("Produto" + IncrementoBloco, "nFCI", nfeDetalhe.getNumeroFci());
				NFeIni.put("Produto" + IncrementoBloco, "nRECOPI", nfeDetalhe.getNumeroRecopi());
				NFeIni.put("Produto" + IncrementoBloco, "pDevol", nfeDetalhe.getPercentualDevolvido().toString());
				NFeIni.put("Produto" + IncrementoBloco, "vIPIDevol", nfeDetalhe.getValorIpiDevolvido().toString());
				NFeIni.put("Produto" + IncrementoBloco, "vTotTrib", nfeDetalhe.getValorTotalTributos().toString());
				NFeIni.put("Produto" + IncrementoBloco, "infAdProd", nfeDetalhe.getInformacoesAdicionais());
				NFeIni.put("Produto" + IncrementoBloco, "indEscala", nfeDetalhe.getIndicadorEscalaRelevante());
				NFeIni.put("Produto" + IncrementoBloco, "CNPJFab", nfeDetalhe.getCnpjFabricante());
				NFeIni.put("Produto" + IncrementoBloco, "cBenef", nfeDetalhe.getCodigoBeneficioFiscal());

				//  Detalhes -- Impostos 
				//  Se houver CFOP cadastrado na Operação Fiscal, a nota é de serviços
				if (pNfeCabecalho.getTributOperacaoFiscal().getCfop() > 0)
				{
					// / [ISSQN]
					NFeIni.put("ISSQN" + IncrementoBloco, "vBC", nfeDetalhe.getNfeDetalheImpostoIssqn().getBaseCalculoIssqn().toString());
					NFeIni.put("ISSQN" + IncrementoBloco, "vAliq", nfeDetalhe.getNfeDetalheImpostoIssqn().getAliquotaIssqn().toString());
					NFeIni.put("ISSQN" + IncrementoBloco, "vISSQN", nfeDetalhe.getNfeDetalheImpostoIssqn().getValorIssqn().toString());
					NFeIni.put("ISSQN" + IncrementoBloco, "cMunFG", nfeDetalhe.getNfeDetalheImpostoIssqn().getMunicipioIssqn().toString());
					NFeIni.put("ISSQN" + IncrementoBloco, "cListServ", nfeDetalhe.getNfeDetalheImpostoIssqn().getItemListaServicos().toString());
				}
				else
				{
					// / [ICMS]
					if (empresa.getCrt().equals("1"))  // 1-Simples Nacional
					{
						NFeIni.put("ICMS" + IncrementoBloco, "CSOSN", nfeDetalhe.getNfeDetalheImpostoIcms().getCsosn());

						//  csosn 101
						if (nfeDetalhe.getNfeDetalheImpostoIcms().getCsosn().equals("101"))
						{
							NFeIni.put("ICMS" + IncrementoBloco, "orig", nfeDetalhe.getNfeDetalheImpostoIcms().getOrigemMercadoria());
							NFeIni.put("ICMS" + IncrementoBloco, "pCredSN", nfeDetalhe.getNfeDetalheImpostoIcms().getAliquotaCreditoIcmsSn().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vCredICMSSN", nfeDetalhe.getNfeDetalheImpostoIcms().getValorCreditoIcmsSn().toString());
						}

						//  csosn 102, 103, 300, 400
						else if ((nfeDetalhe.getNfeDetalheImpostoIcms().getCsosn().equals("102"))
							 || (nfeDetalhe.getNfeDetalheImpostoIcms().getCsosn().equals("103"))
							 || (nfeDetalhe.getNfeDetalheImpostoIcms().getCsosn().equals("300"))
							 || (nfeDetalhe.getNfeDetalheImpostoIcms().getCsosn().equals("400")))
						{
							NFeIni.put("ICMS" + IncrementoBloco, "orig", nfeDetalhe.getNfeDetalheImpostoIcms().getOrigemMercadoria());
						}

						//  csosn 201
						else if (nfeDetalhe.getNfeDetalheImpostoIcms().getCsosn().equals("201"))
						{
							NFeIni.put("ICMS" + IncrementoBloco, "orig", nfeDetalhe.getNfeDetalheImpostoIcms().getOrigemMercadoria());
							NFeIni.put("ICMS" + IncrementoBloco, "modBCST", nfeDetalhe.getNfeDetalheImpostoIcms().getModalidadeBcIcmsSt());
							NFeIni.put("ICMS" + IncrementoBloco, "pMVAST", nfeDetalhe.getNfeDetalheImpostoIcms().getPercentualMvaIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "pRedBCST", nfeDetalhe.getNfeDetalheImpostoIcms().getPercentualReducaoBcIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vBCST", nfeDetalhe.getNfeDetalheImpostoIcms().getValorBaseCalculoIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "pICMSST", nfeDetalhe.getNfeDetalheImpostoIcms().getAliquotaIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vICMSST", nfeDetalhe.getNfeDetalheImpostoIcms().getValorIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "pCredSN", nfeDetalhe.getNfeDetalheImpostoIcms().getAliquotaCreditoIcmsSn().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vCredICMSSN", nfeDetalhe.getNfeDetalheImpostoIcms().getValorCreditoIcmsSn().toString());
						}

						//  csosn 202, 203
						else if ((nfeDetalhe.getNfeDetalheImpostoIcms().getCsosn().equals("202"))
							 || (nfeDetalhe.getNfeDetalheImpostoIcms().getCsosn().equals("203")))
						{
							NFeIni.put("ICMS" + IncrementoBloco, "orig", nfeDetalhe.getNfeDetalheImpostoIcms().getOrigemMercadoria());
							NFeIni.put("ICMS" + IncrementoBloco, "modBCST", nfeDetalhe.getNfeDetalheImpostoIcms().getModalidadeBcIcmsSt());
							NFeIni.put("ICMS" + IncrementoBloco, "pMVAST", nfeDetalhe.getNfeDetalheImpostoIcms().getPercentualMvaIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "pRedBCST", nfeDetalhe.getNfeDetalheImpostoIcms().getPercentualReducaoBcIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vBCST", nfeDetalhe.getNfeDetalheImpostoIcms().getValorBaseCalculoIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "pICMSST", nfeDetalhe.getNfeDetalheImpostoIcms().getAliquotaIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vICMSST", nfeDetalhe.getNfeDetalheImpostoIcms().getValorIcmsSt().toString());
						}

						//  csosn 500
						else if (nfeDetalhe.getNfeDetalheImpostoIcms().getCsosn().equals("500"))
						{
							NFeIni.put("ICMS" + IncrementoBloco, "orig", nfeDetalhe.getNfeDetalheImpostoIcms().getOrigemMercadoria());
							NFeIni.put("ICMS" + IncrementoBloco, "vBCSTRet", nfeDetalhe.getNfeDetalheImpostoIcms().getValorBcIcmsStRetido().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vICMSSTRet", nfeDetalhe.getNfeDetalheImpostoIcms().getValorIcmsStRetido().toString());
						}

						//  csosn 900
						else if (nfeDetalhe.getNfeDetalheImpostoIcms().getCsosn().equals("900"))
						{
							NFeIni.put("ICMS" + IncrementoBloco, "orig", nfeDetalhe.getNfeDetalheImpostoIcms().getOrigemMercadoria());
							NFeIni.put("ICMS" + IncrementoBloco, "modBC", nfeDetalhe.getNfeDetalheImpostoIcms().getModalidadeBcIcms());
							NFeIni.put("ICMS" + IncrementoBloco, "vBC", nfeDetalhe.getNfeDetalheImpostoIcms().getValorBcIcms().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "pRedBC", nfeDetalhe.getNfeDetalheImpostoIcms().getPercentualReducaoBcIcms().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "pICMS", nfeDetalhe.getNfeDetalheImpostoIcms().getAliquotaIcms().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vICMS", nfeDetalhe.getNfeDetalheImpostoIcms().getValorIcms().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "modBCST", nfeDetalhe.getNfeDetalheImpostoIcms().getModalidadeBcIcmsSt());
							NFeIni.put("ICMS" + IncrementoBloco, "pMVAST", nfeDetalhe.getNfeDetalheImpostoIcms().getPercentualMvaIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "pRedBCST", nfeDetalhe.getNfeDetalheImpostoIcms().getPercentualReducaoBcIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vBCST", nfeDetalhe.getNfeDetalheImpostoIcms().getValorBaseCalculoIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "pICMSST", nfeDetalhe.getNfeDetalheImpostoIcms().getAliquotaIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vICMSST", nfeDetalhe.getNfeDetalheImpostoIcms().getValorIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "pCredSN", nfeDetalhe.getNfeDetalheImpostoIcms().getAliquotaCreditoIcmsSn().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vCredICMSSN", nfeDetalhe.getNfeDetalheImpostoIcms().getValorCreditoIcmsSn().toString());
						}
					}

					else
					{
						NFeIni.put("ICMS" + IncrementoBloco, "CST", nfeDetalhe.getNfeDetalheImpostoIcms().getCstIcms());

						//  00 Tributada integralmente
						if (nfeDetalhe.getNfeDetalheImpostoIcms().getCstIcms().equals("00"))
						{
							NFeIni.put("ICMS" + IncrementoBloco, "orig", nfeDetalhe.getNfeDetalheImpostoIcms().getOrigemMercadoria());
							NFeIni.put("ICMS" + IncrementoBloco, "modBC", nfeDetalhe.getNfeDetalheImpostoIcms().getModalidadeBcIcms());
							NFeIni.put("ICMS" + IncrementoBloco, "vBC", nfeDetalhe.getNfeDetalheImpostoIcms().getValorBcIcms().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "pICMS", nfeDetalhe.getNfeDetalheImpostoIcms().getAliquotaIcms().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vICMS", nfeDetalhe.getNfeDetalheImpostoIcms().getValorIcms().toString());
						}

						//  10 Tributada e com cobranca do ICMS por ST
						else if (nfeDetalhe.getNfeDetalheImpostoIcms().getCstIcms().equals("10"))
						{
							NFeIni.put("ICMS" + IncrementoBloco, "orig", nfeDetalhe.getNfeDetalheImpostoIcms().getOrigemMercadoria());
							NFeIni.put("ICMS" + IncrementoBloco, "modBC", nfeDetalhe.getNfeDetalheImpostoIcms().getModalidadeBcIcms());
							NFeIni.put("ICMS" + IncrementoBloco, "vBC", nfeDetalhe.getNfeDetalheImpostoIcms().getValorBcIcms().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "pICMS", nfeDetalhe.getNfeDetalheImpostoIcms().getAliquotaIcms().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vICMS", nfeDetalhe.getNfeDetalheImpostoIcms().getValorIcms().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "modBCST", nfeDetalhe.getNfeDetalheImpostoIcms().getModalidadeBcIcmsSt());
							NFeIni.put("ICMS" + IncrementoBloco, "pMVAST", nfeDetalhe.getNfeDetalheImpostoIcms().getPercentualMvaIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "pRedBCST", nfeDetalhe.getNfeDetalheImpostoIcms().getPercentualReducaoBcIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vBCST", nfeDetalhe.getNfeDetalheImpostoIcms().getValorBaseCalculoIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "pICMSST", nfeDetalhe.getNfeDetalheImpostoIcms().getAliquotaIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vICMSST", nfeDetalhe.getNfeDetalheImpostoIcms().getValorIcmsSt().toString());
						}

						//  20 Tributada com reducao de base de calculo
						else if (nfeDetalhe.getNfeDetalheImpostoIcms().getCstIcms().equals("20"))
						{
							NFeIni.put("ICMS" + IncrementoBloco, "orig", nfeDetalhe.getNfeDetalheImpostoIcms().getOrigemMercadoria());
							NFeIni.put("ICMS" + IncrementoBloco, "modBC", nfeDetalhe.getNfeDetalheImpostoIcms().getModalidadeBcIcms());
							NFeIni.put("ICMS" + IncrementoBloco, "pRedBC", nfeDetalhe.getNfeDetalheImpostoIcms().getPercentualReducaoBcIcms().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vBC", nfeDetalhe.getNfeDetalheImpostoIcms().getValorBcIcms().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "pICMS", nfeDetalhe.getNfeDetalheImpostoIcms().getAliquotaIcms().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vICMS", nfeDetalhe.getNfeDetalheImpostoIcms().getValorIcms().toString());
						}

						//  30 Isenta ou nao tributada e com cobranca do ICMS por ST
						else if (nfeDetalhe.getNfeDetalheImpostoIcms().getCstIcms().equals("30"))
						{
							NFeIni.put("ICMS" + IncrementoBloco, "orig", nfeDetalhe.getNfeDetalheImpostoIcms().getOrigemMercadoria());
							NFeIni.put("ICMS" + IncrementoBloco, "modBCST", nfeDetalhe.getNfeDetalheImpostoIcms().getModalidadeBcIcmsSt());
							NFeIni.put("ICMS" + IncrementoBloco, "pMVAST", nfeDetalhe.getNfeDetalheImpostoIcms().getPercentualMvaIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "pRedBCST", nfeDetalhe.getNfeDetalheImpostoIcms().getPercentualReducaoBcIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vBCST", nfeDetalhe.getNfeDetalheImpostoIcms().getValorBaseCalculoIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "pICMSST", nfeDetalhe.getNfeDetalheImpostoIcms().getAliquotaIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vICMSST", nfeDetalhe.getNfeDetalheImpostoIcms().getValorIcmsSt().toString());
						}

						//  40 Isenta
						else if (nfeDetalhe.getNfeDetalheImpostoIcms().getCstIcms().equals("40"))
						{
							NFeIni.put("ICMS" + IncrementoBloco, "orig", nfeDetalhe.getNfeDetalheImpostoIcms().getOrigemMercadoria());
							NFeIni.put("ICMS" + IncrementoBloco, "vICMS", nfeDetalhe.getNfeDetalheImpostoIcms().getValorIcms().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "motDesICMS", nfeDetalhe.getNfeDetalheImpostoIcms().getMotivoDesoneracaoIcms());
						}

						//  41 Nao tributada
						else if (nfeDetalhe.getNfeDetalheImpostoIcms().getCstIcms().equals("41"))
						{
							NFeIni.put("ICMS" + IncrementoBloco, "orig", nfeDetalhe.getNfeDetalheImpostoIcms().getOrigemMercadoria());
							NFeIni.put("ICMS" + IncrementoBloco, "vICMS", nfeDetalhe.getNfeDetalheImpostoIcms().getValorIcms().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "motDesICMS", nfeDetalhe.getNfeDetalheImpostoIcms().getMotivoDesoneracaoIcms());
						}

						//  50 Suspencao
						else if (nfeDetalhe.getNfeDetalheImpostoIcms().getCstIcms().equals("50"))
						{
							NFeIni.put("ICMS" + IncrementoBloco, "orig", nfeDetalhe.getNfeDetalheImpostoIcms().getOrigemMercadoria());
							NFeIni.put("ICMS" + IncrementoBloco, "vICMS", nfeDetalhe.getNfeDetalheImpostoIcms().getValorIcms().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "motDesICMS", nfeDetalhe.getNfeDetalheImpostoIcms().getMotivoDesoneracaoIcms());
						}

						//  51 Diferimento preenchimento do ICMS depende da UF
						else if (nfeDetalhe.getNfeDetalheImpostoIcms().getCstIcms().equals("51"))
						{
							NFeIni.put("ICMS" + IncrementoBloco, "orig", nfeDetalhe.getNfeDetalheImpostoIcms().getOrigemMercadoria());
							NFeIni.put("ICMS" + IncrementoBloco, "modBC", nfeDetalhe.getNfeDetalheImpostoIcms().getModalidadeBcIcms());
							NFeIni.put("ICMS" + IncrementoBloco, "pRedBC", nfeDetalhe.getNfeDetalheImpostoIcms().getPercentualReducaoBcIcms().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vBC", nfeDetalhe.getNfeDetalheImpostoIcms().getValorBcIcms().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "pICMS", nfeDetalhe.getNfeDetalheImpostoIcms().getAliquotaIcms().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vICMS", nfeDetalhe.getNfeDetalheImpostoIcms().getValorIcms().toString());
						}

						//  60 ICMS cobrado anteriormente por ST
						else if (nfeDetalhe.getNfeDetalheImpostoIcms().getCstIcms().equals("60"))
						{
							NFeIni.put("ICMS" + IncrementoBloco, "orig", nfeDetalhe.getNfeDetalheImpostoIcms().getOrigemMercadoria());
							NFeIni.put("ICMS" + IncrementoBloco, "vBCSTRet", nfeDetalhe.getNfeDetalheImpostoIcms().getValorBcIcmsStRetido().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vICMSSTRet", nfeDetalhe.getNfeDetalheImpostoIcms().getValorIcmsStRetido().toString());
						}

						//  70 ICMS com reducao de base de calculo e cobranca de ICMS por ST
						else if (nfeDetalhe.getNfeDetalheImpostoIcms().getCstIcms().equals("70"))
						{
							NFeIni.put("ICMS" + IncrementoBloco, "orig", nfeDetalhe.getNfeDetalheImpostoIcms().getOrigemMercadoria());
							NFeIni.put("ICMS" + IncrementoBloco, "modBC", nfeDetalhe.getNfeDetalheImpostoIcms().getModalidadeBcIcms());
							NFeIni.put("ICMS" + IncrementoBloco, "pRedBC", nfeDetalhe.getNfeDetalheImpostoIcms().getPercentualReducaoBcIcms().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vBC", nfeDetalhe.getNfeDetalheImpostoIcms().getValorBcIcms().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "pICMS", nfeDetalhe.getNfeDetalheImpostoIcms().getAliquotaIcms().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vICMS", nfeDetalhe.getNfeDetalheImpostoIcms().getValorIcms().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "modBCST", nfeDetalhe.getNfeDetalheImpostoIcms().getModalidadeBcIcmsSt());
							NFeIni.put("ICMS" + IncrementoBloco, "pMVAST", nfeDetalhe.getNfeDetalheImpostoIcms().getPercentualMvaIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "pRedBCST", nfeDetalhe.getNfeDetalheImpostoIcms().getPercentualReducaoBcIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vBCST", nfeDetalhe.getNfeDetalheImpostoIcms().getValorBaseCalculoIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "pICMSST", nfeDetalhe.getNfeDetalheImpostoIcms().getAliquotaIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vICMSST", nfeDetalhe.getNfeDetalheImpostoIcms().getValorIcmsSt().toString());
						}

						//  90 Outros
						else if (nfeDetalhe.getNfeDetalheImpostoIcms().getCstIcms().equals("90"))
						{
							NFeIni.put("ICMS" + IncrementoBloco, "orig", nfeDetalhe.getNfeDetalheImpostoIcms().getOrigemMercadoria());
							NFeIni.put("ICMS" + IncrementoBloco, "modBC", nfeDetalhe.getNfeDetalheImpostoIcms().getModalidadeBcIcms());
							NFeIni.put("ICMS" + IncrementoBloco, "vBC", nfeDetalhe.getNfeDetalheImpostoIcms().getValorBcIcms().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "pRedBC", nfeDetalhe.getNfeDetalheImpostoIcms().getPercentualReducaoBcIcms().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "pICMS", nfeDetalhe.getNfeDetalheImpostoIcms().getAliquotaIcms().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vICMS", nfeDetalhe.getNfeDetalheImpostoIcms().getValorIcms().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "modBCST", nfeDetalhe.getNfeDetalheImpostoIcms().getModalidadeBcIcmsSt());
							NFeIni.put("ICMS" + IncrementoBloco, "pMVAST", nfeDetalhe.getNfeDetalheImpostoIcms().getPercentualMvaIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "pRedBCST", nfeDetalhe.getNfeDetalheImpostoIcms().getPercentualReducaoBcIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vBCST", nfeDetalhe.getNfeDetalheImpostoIcms().getValorBaseCalculoIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "pICMSST", nfeDetalhe.getNfeDetalheImpostoIcms().getAliquotaIcmsSt().toString());
							NFeIni.put("ICMS" + IncrementoBloco, "vICMSST", nfeDetalhe.getNfeDetalheImpostoIcms().getValorIcmsSt().toString());
						}
						/*
						  Cabe a cada participante implementar o seguinte:
						  ICMSPart partilha do ICMS entre a UF de Origem e UF de Destino..
						  ICMSST Repasse de ICMS ST retido anteriormente em ope. interestadual...
						*/
					}

					// / [IPI]
					NFeIni.put("IPI" + IncrementoBloco, "CST", nfeDetalhe.getNfeDetalheImpostoIpi().getCstIpi());
					NFeIni.put("IPI" + IncrementoBloco, "vBC", nfeDetalhe.getNfeDetalheImpostoIpi().getValorBaseCalculoIpi().toString());
					NFeIni.put("IPI" + IncrementoBloco, "pIPI", nfeDetalhe.getNfeDetalheImpostoIpi().getAliquotaIpi().toString());
					NFeIni.put("IPI" + IncrementoBloco, "vIPI", nfeDetalhe.getNfeDetalheImpostoIpi().getValorIpi().toString());

					// / [PIS]
					NFeIni.put("PIS" + IncrementoBloco, "CST", nfeDetalhe.getNfeDetalheImpostoPis().getCstPis());
					NFeIni.put("PIS" + IncrementoBloco, "vBC", nfeDetalhe.getNfeDetalheImpostoPis().getValorBaseCalculoPis().toString());
					if (nfeDetalhe.getNfeDetalheImpostoPis().getCstPis().equals("01"))
						NFeIni.put("PIS" + IncrementoBloco, "pPIS", nfeDetalhe.getNfeDetalheImpostoPis().getAliquotaPisPercentual().toString());
					else if (nfeDetalhe.getNfeDetalheImpostoPis().getCstPis().equals("02"))
						NFeIni.put("PIS" + IncrementoBloco, "pPIS", nfeDetalhe.getNfeDetalheImpostoPis().getAliquotaPisReais().toString());
					NFeIni.put("PIS" + IncrementoBloco, "vPIS", nfeDetalhe.getNfeDetalheImpostoPis().getValorPis().toString());

					// / [COFINS]
					NFeIni.put("COFINS" + IncrementoBloco, "CST", nfeDetalhe.getNfeDetalheImpostoCofins().getCstCofins());
					NFeIni.put("COFINS" + IncrementoBloco, "vBC", nfeDetalhe.getNfeDetalheImpostoCofins().getBaseCalculoCofins().toString());
					if (nfeDetalhe.getNfeDetalheImpostoCofins().getCstCofins().equals("01"))
						NFeIni.put("COFINS" + IncrementoBloco, "pCOFINS", nfeDetalhe.getNfeDetalheImpostoCofins().getAliquotaCofinsPercentual().toString());
					else if (nfeDetalhe.getNfeDetalheImpostoCofins().getCstCofins().equals("02"))
						NFeIni.put("COFINS" + IncrementoBloco, "pCOFINS", nfeDetalhe.getNfeDetalheImpostoCofins().getAliquotaCofinsReais().toString());
					NFeIni.put("COFINS" + IncrementoBloco, "vCOFINS", nfeDetalhe.getNfeDetalheImpostoCofins().getValorCofins().toString());

					// / [II]
					//if (!nfeDetalhe.getNfeDetalheImpostoIi().getEquals(null))
					//{
					//	NFeIni.put("II" + IncrementoBloco, "vBC", nfeDetalhe.getNfeDetalheImpostoIi().getValorBcIi().toString());
					//	NFeIni.put("II" + IncrementoBloco, "vDespAdu", nfeDetalhe.getNfeDetalheImpostoIi().getValorDespesasAduaneiras().toString());
					//	NFeIni.put("II" + IncrementoBloco, "vII", nfeDetalhe.getNfeDetalheImpostoIi().getValorImpostoImportacao().toString());
					//	NFeIni.put("II" + IncrementoBloco, "vIOF", nfeDetalhe.getNfeDetalheImpostoIi().getValorIof().toString());
					//}

				}
			}

			// *******************************************************************************************
			//   [Total]
			// *******************************************************************************************
			NFeIni.put("Total", "vNF", pNfeCabecalho.getValorTotal().toString());
			NFeIni.put("Total", "vBC", pNfeCabecalho.getBaseCalculoIcms().toString());
			NFeIni.put("Total", "vICMS", pNfeCabecalho.getValorIcms().toString());
			NFeIni.put("Total", "vBCST", pNfeCabecalho.getBaseCalculoIcmsSt().toString());
			NFeIni.put("Total", "vST", pNfeCabecalho.getValorIcmsSt().toString());
			NFeIni.put("Total", "vProd", pNfeCabecalho.getValorTotalProdutos().toString());
			NFeIni.put("Total", "vFrete", pNfeCabecalho.getValorFrete().toString());
			NFeIni.put("Total", "vSeg", pNfeCabecalho.getValorSeguro().toString());
			NFeIni.put("Total", "vDesc", pNfeCabecalho.getValorDesconto().toString());
			NFeIni.put("Total", "vII", pNfeCabecalho.getValorImpostoImportacao().toString());
			NFeIni.put("Total", "vIPI", pNfeCabecalho.getValorIpi().toString());
			NFeIni.put("Total", "vPIS", pNfeCabecalho.getValorPis().toString());
			NFeIni.put("Total", "vCOFINS", pNfeCabecalho.getValorCofins().toString());
			NFeIni.put("Total", "vOutro", pNfeCabecalho.getValorDespesasAcessorias().toString());
			NFeIni.put("Total", "vNF", pNfeCabecalho.getValorTotal().toString());

			// *******************************************************************************************
			//   [ISSQNtot]
			// *******************************************************************************************
			NFeIni.put("ISSQNtot", "vServ", pNfeCabecalho.getValorServicos().toString());
			NFeIni.put("ISSQNtot", "vBC", pNfeCabecalho.getBaseCalculoIssqn().toString());
			NFeIni.put("ISSQNtot", "vISS", pNfeCabecalho.getValorIssqn().toString());
			NFeIni.put("ISSQNtot", "vPIS", pNfeCabecalho.getValorPisIssqn().toString());
			NFeIni.put("ISSQNtot", "vCOFINS", pNfeCabecalho.getValorCofinsIssqn().toString());

			// *******************************************************************************************
			//   [retTrib]
			// *******************************************************************************************
			NFeIni.put("retTrib", "vRetPIS", pNfeCabecalho.getValorRetidoPis().toString());
			NFeIni.put("retTrib", "vRetCOFINS", pNfeCabecalho.getValorRetidoCofins().toString());
			NFeIni.put("retTrib", "vRetCSLL", pNfeCabecalho.getValorRetidoCsll().toString());
			NFeIni.put("retTrib", "vBCIRRF", pNfeCabecalho.getBaseCalculoIrrf().toString());
			NFeIni.put("retTrib", "vIRRF", pNfeCabecalho.getValorRetidoIrrf().toString());
			NFeIni.put("retTrib", "vBCRetPrev", pNfeCabecalho.getBaseCalculoPrevidencia().toString());
			NFeIni.put("retTrib", "vRetPrev", pNfeCabecalho.getValorRetidoPrevidencia().toString());

			// *******************************************************************************************
			//   [PAG]
			// *******************************************************************************************
			NFeIni.put("PAG001", "tpag", "01");
			NFeIni.put("PAG001", "vPag", pNfeCabecalho.getValorTotal().toString());
			NFeIni.put("PAG001", "indPag", "0");
			NFeIni.put("PAG001", "vTroco", "0");

			// *******************************************************************************************
			//   [DadosAdicionais]
			// *******************************************************************************************
			NFeIni.put("DadosAdicionais", "infAdFisco", "");
			NFeIni.put("DadosAdicionais", "infCpl", "");

			NFeIni.store();
			
			return nomeArquivo;
		}
		finally
		{
		}
	}

	
}