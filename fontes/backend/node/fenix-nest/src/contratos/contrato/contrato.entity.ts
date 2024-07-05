/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CONTRATO] 
                                                                                
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
import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({ name: 'CONTRATO' })
export class Contrato { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'ID_SOLICITACAO_SERVICO' })
	idSolicitacaoServico: number;

	@Column({ name: 'ID_TIPO_CONTRATO' })
	idTipoContrato: number;

	@Column({ name: 'NUMERO' })
	numero: string;

	@Column({ name: 'NOME' })
	nome: string;

	@Column({ name: 'DESCRICAO' })
	descricao: string;

	@Column({ name: 'DATA_CADASTRO' })
	dataCadastro: Date;

	@Column({ name: 'DATA_INICIO_VIGENCIA' })
	dataInicioVigencia: Date;

	@Column({ name: 'DATA_FIM_VIGENCIA' })
	dataFimVigencia: Date;

	@Column({ name: 'DIA_FATURAMENTO' })
	diaFaturamento: string;

	@Column({ name: 'VALOR' })
	valor: number;

	@Column({ name: 'QUANTIDADE_PARCELAS' })
	quantidadeParcelas: number;

	@Column({ name: 'INTERVALO_ENTRE_PARCELAS' })
	intervaloEntreParcelas: number;

	@Column({ name: 'OBSERVACAO' })
	observacao: string;

	@Column({ name: 'CLASSIFICACAO_CONTABIL_CONTA' })
	classificacaoContabilConta: string;


	/**
	* Relations
	*/

	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.idSolicitacaoServico = objetoJson['idSolicitacaoServico'];
			this.idTipoContrato = objetoJson['idTipoContrato'];
			this.numero = objetoJson['numero'];
			this.nome = objetoJson['nome'];
			this.descricao = objetoJson['descricao'];
			this.dataCadastro = objetoJson['dataCadastro'];
			this.dataInicioVigencia = objetoJson['dataInicioVigencia'];
			this.dataFimVigencia = objetoJson['dataFimVigencia'];
			this.diaFaturamento = objetoJson['diaFaturamento'];
			this.valor = objetoJson['valor'];
			this.quantidadeParcelas = objetoJson['quantidadeParcelas'];
			this.intervaloEntreParcelas = objetoJson['intervaloEntreParcelas'];
			this.observacao = objetoJson['observacao'];
			this.classificacaoContabilConta = objetoJson['classificacaoContabilConta'];
			
			
		}
	}
}