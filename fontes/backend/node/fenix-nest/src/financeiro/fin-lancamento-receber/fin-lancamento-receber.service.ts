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
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { FinLancamentoReceber } from './fin-lancamento-receber.entity';
import { DataSource, QueryRunner } from 'typeorm';
import { Empresa } from '../../entities-export';
import { EmpresaEndereco } from '../../entities-export';
import { ViewPessoaCliente } from '../../entities-export';
import { FinConfiguracaoBoleto } from '../../entities-export';
import { Biblioteca } from '../../util/biblioteca';
import * as fs from "fs";
import * as INI from "easy-ini";

@Injectable()
export class FinLancamentoReceberService extends TypeOrmCrudService<FinLancamentoReceber> {

  constructor(
	private dataSource: DataSource,
    @InjectRepository(FinLancamentoReceber) repository) { super(repository); }

	async persistir(finLancamentoReceber: FinLancamentoReceber, operacao: string): Promise<FinLancamentoReceber> {
	  let objetoRetorno: FinLancamentoReceber;
	
		const queryRunner = this.dataSource.createQueryRunner();
	
	  await queryRunner.connect();
	  await queryRunner.startTransaction();
	  try {
	    if (operacao == 'A') {
	      await this.excluirFilhos(queryRunner, finLancamentoReceber.id);
	    }
	    objetoRetorno = await queryRunner.manager.save(finLancamentoReceber);
	    await queryRunner.commitTransaction();
	  } catch (erro) {
	    await queryRunner.rollbackTransaction();
	    throw (erro);
	  } finally {
	    await queryRunner.release();
	  }
	  return objetoRetorno;
	}
  
	async excluirMestreDetalhe(id: number) {
		const queryRunner = this.dataSource.createQueryRunner();
	
	  await queryRunner.connect();
	  await queryRunner.startTransaction();
	  try {
	    await this.excluirFilhos(queryRunner, id);
	    await queryRunner.query('delete from finLancamentoReceber where id=' + id);
	    await queryRunner.commitTransaction();
	  } catch (erro) {
	    await queryRunner.rollbackTransaction();
	    throw (erro);
	  } finally {
	    await queryRunner.release();
	  }
	}

	async excluirFilhos(queryRunner: QueryRunner, id: number) {
		await queryRunner.query('delete from FIN_PARCELA_RECEBER where ID_FIN_LANCAMENTO_RECEBER=' + id);
		
	}

	async gerarBoleto(lancamento: FinLancamentoReceber): Promise<string> {
		// primeiro passo - gerar o arquivo INI com os Titulos
		await this.gerarArquivoIni(lancamento);
		// segundo passo - limpar a lista de boletos
		await this.gerarArquivoEntradaLimparBoletos();

		await new Promise(resolve => setTimeout(resolve, 100)); //espera por 100 milisegundos

		// terceiro passo - criar o arquivo de entrada para o ACBRMonitor
		await this.gerarArquivoEntradaGerarBoletos(lancamento);
		// quarto passo - Pegar o retorno e enviar para o controller
		return await this.pegarRetornoSaida();	
	}

	async gerarArquivoIni(lancamento: FinLancamentoReceber) {
		//  Pega a empresa
		let empresa: Empresa;
		//const connection = getConnection();
		empresa = await this.dataSource.manager.findOneBy(Empresa, {id: 1,});
		empresa.setEnderecoPrincipal(await this.dataSource.manager.findOneBy(EmpresaEndereco, {id: 1,}));
		// Pega a configuração do boleto
		let configuracaoBoleto: FinConfiguracaoBoleto;
//		configuracaoBoleto = await this.dataSource.manager.findOne(FinConfiguracaoBoleto, 1);
		configuracaoBoleto = await this.dataSource.getRepository(FinConfiguracaoBoleto)
		.createQueryBuilder("FinConfiguracaoBoleto")
		.innerJoinAndSelect("FinConfiguracaoBoleto.bancoContaCaixa", "BancoContaCaixa")
		.innerJoinAndSelect("BancoContaCaixa.bancoAgencia", "BancoAgencia")
		.innerJoinAndSelect("BancoAgencia.banco", "Banco")
		.where("FinConfiguracaoBoleto.id = :id")
		.setParameters({ id: 1})
		.getOne();

		// Pega o cliente
		let cliente: ViewPessoaCliente;
		cliente = await this.dataSource.manager.findOneBy(ViewPessoaCliente, {id:lancamento.cliente.id});

		let nomeArquivo = "c:\\t2ti\\boletos\\ini\\" + lancamento.id + ".ini";
		fs.writeFileSync(nomeArquivo, "");
		const arquivoIni = new INI(fs.readFileSync(nomeArquivo, {encoding: 'utf8'}))

		// *******************************************************************************************
		//   [Cedente]
		// *******************************************************************************************
		Biblioteca.iniWriteString("Cedente", "Nome", empresa.razaoSocial, arquivoIni);
		Biblioteca.iniWriteString("Cedente", "CNPJCPF", empresa.cnpj, arquivoIni);
		Biblioteca.iniWriteString("Cedente", "Logradouro", empresa.enderecoPrincipal.logradouro, arquivoIni);
		Biblioteca.iniWriteString("Cedente", "Numero", empresa.enderecoPrincipal.numero, arquivoIni);
		Biblioteca.iniWriteString("Cedente", "Bairro", empresa.enderecoPrincipal.bairro, arquivoIni);
		Biblioteca.iniWriteString("Cedente", "Cidade", empresa.enderecoPrincipal.cidade, arquivoIni);
		Biblioteca.iniWriteString("Cedente", "CEP", empresa.enderecoPrincipal.cep, arquivoIni);
		Biblioteca.iniWriteString("Cedente", "Complemento", empresa.enderecoPrincipal.complemento, arquivoIni);
		Biblioteca.iniWriteString("Cedente", "UF", empresa.enderecoPrincipal.uf, arquivoIni);
		Biblioteca.iniWriteString("Cedente", "CodigoCedente", configuracaoBoleto.codigoCedente, arquivoIni);
		Biblioteca.iniWriteString("Cedente", "Convenio", configuracaoBoleto.codigoConvenio, arquivoIni);

		// *******************************************************************************************
		//   [Conta]
		// *******************************************************************************************
		Biblioteca.iniWriteString("Conta", "Agencia", configuracaoBoleto.bancoContaCaixa.bancoAgencia.numero, arquivoIni);
		Biblioteca.iniWriteString("Conta", "AgenciaDigito", configuracaoBoleto.bancoContaCaixa.bancoAgencia.digito, arquivoIni);
		Biblioteca.iniWriteString("Conta", "Conta", configuracaoBoleto.bancoContaCaixa.numero, arquivoIni);
		Biblioteca.iniWriteString("Conta", "ContaDigito", configuracaoBoleto.bancoContaCaixa.numero, arquivoIni);

		// *******************************************************************************************
		//   [Banco]
		// *******************************************************************************************
		Biblioteca.iniWriteString("Banco", "Numero", configuracaoBoleto.bancoContaCaixa.bancoAgencia.banco.codigo, arquivoIni);
		Biblioteca.iniWriteString("Banco", "CNAB", configuracaoBoleto.layoutRemessa, arquivoIni);

		// *******************************************************************************************
		//   Títulos
		// *******************************************************************************************
		let i = 0;
		lancamento.listaFinParcelaReceber.forEach(async parcela => {
			if (parcela.emitiuBoleto == "S") {
				i++;    
				// let tamanhoI = i.toString().length;
				// let incrementoBloco = "0".repeat(3 - tamanhoI) + i.toString();
				let incrementoBloco = i.toString();

				Biblioteca.iniWriteString("Titulo" + incrementoBloco, "NumeroDocumento", parcela.boletoNossoNumero, arquivoIni);
				Biblioteca.iniWriteString("Titulo" + incrementoBloco, "NossoNumero", parcela.boletoNossoNumero, arquivoIni);
				Biblioteca.iniWriteString("Titulo" + incrementoBloco, "Carteira", configuracaoBoleto.carteira, arquivoIni);
				Biblioteca.iniWriteString("Titulo" + incrementoBloco, "LocalPagamento", configuracaoBoleto.localPagamento, arquivoIni);
				Biblioteca.iniWriteString("Titulo" + incrementoBloco, "Vencimento", parcela.dataVencimento.toLocaleString('pt-BR'), arquivoIni);
				Biblioteca.iniWriteString("Titulo" + incrementoBloco, "DataDocumento", parcela.dataVencimento.toLocaleString('pt-BR'), arquivoIni);
				Biblioteca.iniWriteString("Titulo" + incrementoBloco, "DataProcessamento", new Date(Date.UTC(2012, 11, 20)).toLocaleString('pt-BR'), arquivoIni);
				Biblioteca.iniWriteString("Titulo" + incrementoBloco, "Aceite", configuracaoBoleto.aceite, arquivoIni);
				Biblioteca.iniWriteString("Titulo" + incrementoBloco, "TotalParcelas", lancamento.quantidadeParcela.toString(), arquivoIni);
				Biblioteca.iniWriteString("Titulo" + incrementoBloco, "ValorDesconto", parcela.valorDesconto.toString().replace('.', ','), arquivoIni);
				Biblioteca.iniWriteString("Titulo" + incrementoBloco, "DataDesconto", parcela.descontoAte.toString(), arquivoIni);
				Biblioteca.iniWriteString("Titulo" + incrementoBloco, "ValorDocumento", parcela.valor.toString().replace('.', ','), arquivoIni);
				Biblioteca.iniWriteString("Titulo" + incrementoBloco, "Parcela", parcela.numeroParcela.toString(), arquivoIni);
				Biblioteca.iniWriteString("Titulo" + incrementoBloco, "PercentualMulta", parcela.taxaMulta.toString().replace('.', ','), arquivoIni);
				Biblioteca.iniWriteString("Titulo" + incrementoBloco, "Instrucao1", configuracaoBoleto.instrucao01, arquivoIni);
				Biblioteca.iniWriteString("Titulo" + incrementoBloco, "Instrucao2", configuracaoBoleto.instrucao02, arquivoIni);

				// Sacado
				Biblioteca.iniWriteString("Titulo" + incrementoBloco, "Sacado.NomeSacado", cliente.nome, arquivoIni);
				Biblioteca.iniWriteString("Titulo" + incrementoBloco, "Sacado.cNPJCPF", cliente.cpfCnpj, arquivoIni);
			}
		})

		const arquivoFinalizado = arquivoIni.createINIString();
		fs.writeFileSync(nomeArquivo, arquivoFinalizado);
	}
	
	async gerarArquivoEntradaLimparBoletos() {
		//  apaga o arquivo 'SAI.TXT'
		let nomeArquivoApagar = "c:\\ACBrMonitor\\sai.txt";
		try {
			fs.unlinkSync(nomeArquivoApagar);
			//file removed
		} catch(err) {
			console.error(err);
		}		
		  
		//  cria o arquivo 'ENT.TXT'
		let nomeArquivo = "c:\\ACBrMonitor\\ENT.TXT";
		let conteudoArquivo = 'BOLETO.LimparLista';
		fs.writeFileSync(nomeArquivo, conteudoArquivo);
	}

	async gerarArquivoEntradaGerarBoletos(lancamento: FinLancamentoReceber) {
		//  apaga o arquivo 'SAI.TXT'
		let nomeArquivoApagar = "c:\\ACBrMonitor\\sai.txt";
		try {
			fs.unlinkSync(nomeArquivoApagar);
			//file removed
		} catch(err) {
			console.error(err);
		}		
		  
		//  cria o arquivo 'ENT.TXT'
		let nomeArquivo = "c:\\ACBrMonitor\\ENT.TXT";
		let conteudoArquivo = 'BOLETO.IncluirTitulos(\"c:\\t2ti\\boletos\\ini\\' + lancamento.id + '.ini\", \"I\"';
		fs.writeFileSync(nomeArquivo, conteudoArquivo);
	}
	
	async pegarRetornoSaida(): Promise<string> {
		while (!fs.existsSync("C:\\ACBrMonitor\\sai.txt"))
		{
		}

		return "C:\\T2Ti\\Boletos\\PDF\\boleto.pdf";
	}
	
}