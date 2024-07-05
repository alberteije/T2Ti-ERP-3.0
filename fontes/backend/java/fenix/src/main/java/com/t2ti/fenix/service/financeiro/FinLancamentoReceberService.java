/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [FIN_LANCAMENTO_RECEBER] 
                                                                                
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
package com.t2ti.fenix.service.financeiro;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.ini4j.InvalidFileFormatException;
import org.ini4j.Wini;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.t2ti.fenix.model.administrativo.Empresa;
import com.t2ti.fenix.model.financeiro.FinConfiguracaoBoleto;
import com.t2ti.fenix.model.financeiro.FinLancamentoReceber;
import com.t2ti.fenix.model.financeiro.FinParcelaReceber;
import com.t2ti.fenix.model.transiente.Filtro;
import com.t2ti.fenix.model.viewsDB.ViewPessoaCliente;
import com.t2ti.fenix.repository.financeiro.FinLancamentoReceberRepository;
import com.t2ti.fenix.service.administrativo.EmpresaService;
import com.t2ti.fenix.service.viewsDB.ViewPessoaClienteService;
import com.t2ti.fenix.util.Biblioteca;

@Service
public class FinLancamentoReceberService {

	@Autowired
	private FinLancamentoReceberRepository repository;

	@Autowired
	private EmpresaService empresaService;

	@Autowired	
	private FinConfiguracaoBoletoService configuracaoBoletoService;

	@Autowired	
	private ViewPessoaClienteService viewPessoaClienteService;
	
	@PersistenceContext
	private EntityManager entityManager;

	public List<FinLancamentoReceber> consultarLista() {
		return repository.findAll();
	}

	@SuppressWarnings("unchecked")
	public List<FinLancamentoReceber> consultarLista(Filtro filtro) {
		String sql = "select * from FIN_LANCAMENTO_RECEBER where " + filtro.getWhere();
		Query query = entityManager.createNativeQuery(sql, FinLancamentoReceber.class);
		return query.getResultList();

	}

	public FinLancamentoReceber consultarObjeto(Integer id) {
		return repository.findById(id).get();
	}

	public FinLancamentoReceber salvar(FinLancamentoReceber objeto) {
		return repository.save(objeto);
	}

	public void excluir(Integer id) {
		FinLancamentoReceber objeto = consultarObjeto(id);
		repository.delete(objeto);
	}

	public String gerarBoleto(FinLancamentoReceber lancamento) throws IOException, InterruptedException {
		// primeiro passo - gerar o arquivo INI com os Titulos
		gerarArquivoIni(lancamento);
		// segundo passo - limpar a lista de boletos
		gerarArquivoEntradaLimparBoletos();
		Thread.sleep(100);
		// terceiro passo - criar o arquivo de entrada para o ACBRMonitor
		gerarArquivoEntradaGerarBoletos(lancamento);
		// quarto passo - Pegar o retorno e enviar para o controller
		return pegarRetornoSaida();
	}

	private void gerarArquivoIni(FinLancamentoReceber lancamento) throws InvalidFileFormatException, IOException
	{
		String nomeArquivo = "c:\\t2ti\\boletos\\ini\\" + lancamento.getId() + ".ini"; 
		
		File f = new File(nomeArquivo);
		try {
			f.createNewFile();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Wini ArquivoIni = new Wini(new File(nomeArquivo));
		String IncrementoBloco;
		//  Pega a empresa
		Empresa empresa = empresaService.consultarObjeto(1);
		// Pega a configuração do boleto
		FinConfiguracaoBoleto configuracaoBoleto = configuracaoBoletoService.consultarObjeto(1);
		// Pega o cliente
		ViewPessoaCliente cliente = viewPessoaClienteService.consultarObjeto(lancamento.getCliente().getId());

		//Máscara para os valores
		DecimalFormat decimais = new DecimalFormat("###,###,##0.00");
		
		try
		{
			// *******************************************************************************************
			//   [Cedente]
			// *******************************************************************************************
			ArquivoIni.put("Cedente", "Nome", empresa.getRazaoSocial());
			ArquivoIni.put("Cedente", "CNPJCPF", empresa.getCnpj());
			ArquivoIni.put("Cedente", "Logradouro", empresa.getEnderecoPrincipal().getLogradouro());
			ArquivoIni.put("Cedente", "Numero", empresa.getEnderecoPrincipal().getNumero());
			ArquivoIni.put("Cedente", "Bairro", empresa.getEnderecoPrincipal().getBairro());
			ArquivoIni.put("Cedente", "Cidade", empresa.getEnderecoPrincipal().getCidade());
			ArquivoIni.put("Cedente", "CEP", empresa.getEnderecoPrincipal().getCep());
			ArquivoIni.put("Cedente", "Complemento", empresa.getEnderecoPrincipal().getComplemento());
			ArquivoIni.put("Cedente", "UF", empresa.getEnderecoPrincipal().getUf());
			ArquivoIni.put("Cedente", "CodigoCedente", configuracaoBoleto.getCodigoCedente());
			ArquivoIni.put("Cedente", "Convenio", configuracaoBoleto.getCodigoConvenio());

			// *******************************************************************************************
			//   [Conta]
			// *******************************************************************************************
			ArquivoIni.put("Conta", "Agencia", configuracaoBoleto.getBancoContaCaixa().getBancoAgencia().getNumero());
			ArquivoIni.put("Conta", "AgenciaDigito", configuracaoBoleto.getBancoContaCaixa().getBancoAgencia().getDigito());
			ArquivoIni.put("Conta", "Conta", configuracaoBoleto.getBancoContaCaixa().getNumero());
			ArquivoIni.put("Conta", "ContaDigito", configuracaoBoleto.getBancoContaCaixa().getNumero());

			// *******************************************************************************************
			//   [Banco]
			// *******************************************************************************************
			ArquivoIni.put("Banco", "Numero", configuracaoBoleto.getBancoContaCaixa().getBancoAgencia().getBanco().getCodigo());
			ArquivoIni.put("Banco", "CNAB", configuracaoBoleto.getLayoutRemessa());
						
			// *******************************************************************************************
			//   Títulos
			// *******************************************************************************************
			Integer I = 0;
			for(FinParcelaReceber parcela : lancamento.getListaFinParcelaReceber())
			{
				if (parcela.getEmitiuBoleto().equals("S")) 
				{
					I++;
					//int tamanhoI = I.toString().length();
					//IncrementoBloco = Biblioteca.repete("0", 3 - tamanhoI) + I.toString();  
					IncrementoBloco = I.toString();  
	
					ArquivoIni.put("Titulo" + IncrementoBloco, "NumeroDocumento", parcela.getBoletoNossoNumero());
					ArquivoIni.put("Titulo" + IncrementoBloco, "NossoNumero", parcela.getBoletoNossoNumero());
					ArquivoIni.put("Titulo" + IncrementoBloco, "Carteira", configuracaoBoleto.getCarteira());
					ArquivoIni.put("Titulo" + IncrementoBloco, "LocalPagamento", configuracaoBoleto.getLocalPagamento());
					ArquivoIni.put("Titulo" + IncrementoBloco, "Vencimento", Biblioteca.formataDataHora(parcela.getDataVencimento()));
					ArquivoIni.put("Titulo" + IncrementoBloco, "DataDocumento", Biblioteca.formataDataHora(parcela.getDataVencimento()));
					ArquivoIni.put("Titulo" + IncrementoBloco, "DataProcessamento", Biblioteca.formataDataHora(new Date()));
					ArquivoIni.put("Titulo" + IncrementoBloco, "Aceite", configuracaoBoleto.getAceite());
					ArquivoIni.put("Titulo" + IncrementoBloco, "TotalParcelas", decimais.format(lancamento.getQuantidadeParcela()));
					ArquivoIni.put("Titulo" + IncrementoBloco, "ValorDesconto", decimais.format(parcela.getValorDesconto()));
					ArquivoIni.put("Titulo" + IncrementoBloco, "DataDesconto", Biblioteca.formataDataHora(parcela.getDescontoAte()));
					ArquivoIni.put("Titulo" + IncrementoBloco, "ValorDocumento", decimais.format(parcela.getValor()));
					ArquivoIni.put("Titulo" + IncrementoBloco, "Parcela", parcela.getNumeroParcela().toString());
					ArquivoIni.put("Titulo" + IncrementoBloco, "PercentualMulta", decimais.format(parcela.getTaxaMulta()));
					ArquivoIni.put("Titulo" + IncrementoBloco, "Instrucao1", configuracaoBoleto.getInstrucao01());
					ArquivoIni.put("Titulo" + IncrementoBloco, "Instrucao2", configuracaoBoleto.getInstrucao02());
					
					// Sacado
					ArquivoIni.put("Titulo" + IncrementoBloco, "Sacado.NomeSacado", cliente.getNome());
					ArquivoIni.put("Titulo" + IncrementoBloco, "Sacado.CNPJCPF", cliente.getCpfCnpj());
				}
			}

			ArquivoIni.store();
		}
		finally
		{
		}
	}
	
	private void gerarArquivoEntradaLimparBoletos() throws IOException {
		try {
			// apaga o arquivo 'SAI.TXT'
			File file = new File("c:\\ACBrMonitor\\sai.txt");
			file.delete();

			// cria o arquivo 'ENT.TXT'
			FileWriter ArquivoEntrada = new FileWriter("c:\\ACBrMonitor\\ENT.TXT");
			PrintWriter gravarArquivo = new PrintWriter(ArquivoEntrada);
			gravarArquivo.printf("BOLETO.LimparLista");
			ArquivoEntrada.close();
		} finally {
		}
	}

	private void gerarArquivoEntradaGerarBoletos(FinLancamentoReceber lancamento) throws IOException {
		try {
			// apaga o arquivo 'SAI.TXT'
			File file = new File("c:\\ACBrMonitor\\sai.txt");
			file.delete();

			// cria o arquivo 'ENT.TXT'
			FileWriter ArquivoEntrada = new FileWriter("c:\\ACBrMonitor\\ENT.TXT");
			PrintWriter gravarArquivo = new PrintWriter(ArquivoEntrada);
			gravarArquivo.printf("BOLETO.IncluirTitulos(\"c:\\t2ti\\boletos\\ini\\" + lancamento.getId() + ".ini\", \"I\"");
			ArquivoEntrada.close();
		} finally {
		}
	}

	private String pegarRetornoSaida() throws IOException
	{
		File file = new File("c:\\ACBrMonitor\\sai.txt");
		while (!file.exists()) {
		}

		return "C:\\T2Ti\\Boletos\\PDF\\boleto.pdf";
	}
	
}