/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [MDFE_CABECALHO] 
                                                                                
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

@Entity({ name: 'MDFE_CABECALHO' })
export class MdfeCabecalho { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'UF' })
	uf: number;

	@Column({ name: 'TIPO_AMBIENTE' })
	tipoAmbiente: number;

	@Column({ name: 'TIPO_EMITENTE' })
	tipoEmitente: number;

	@Column({ name: 'TIPO_TRANSPORTADORA' })
	tipoTransportadora: number;

	@Column({ name: 'MODELO' })
	modelo: string;

	@Column({ name: 'SERIE' })
	serie: string;

	@Column({ name: 'NUMERO_MDFE' })
	numeroMdfe: string;

	@Column({ name: 'CODIGO_NUMERICO' })
	codigoNumerico: string;

	@Column({ name: 'CHAVE_ACESSO' })
	chaveAcesso: string;

	@Column({ name: 'DIGITO_VERIFICADOR' })
	digitoVerificador: number;

	@Column({ name: 'MODAL' })
	modal: number;

	@Column({ name: 'DATA_HORA_EMISSAO' })
	dataHoraEmissao: Date;

	@Column({ name: 'TIPO_EMISSAO' })
	tipoEmissao: number;

	@Column({ name: 'PROCESSO_EMISSAO' })
	processoEmissao: number;

	@Column({ name: 'VERSAO_PROCESSO_EMISSAO' })
	versaoProcessoEmissao: string;

	@Column({ name: 'UF_INICIO' })
	ufInicio: string;

	@Column({ name: 'UF_FIM' })
	ufFim: string;

	@Column({ name: 'DATA_HORA_PREVISAO_VIAGEM' })
	dataHoraPrevisaoViagem: Date;

	@Column({ name: 'QUANTIDADE_TOTAL_CTE' })
	quantidadeTotalCte: number;

	@Column({ name: 'QUANTIDADE_TOTAL_NFE' })
	quantidadeTotalNfe: number;

	@Column({ name: 'QUANTIDADE_TOTAL_MDFE' })
	quantidadeTotalMdfe: number;

	@Column({ name: 'CODIGO_UNIDADE_MEDIDA' })
	codigoUnidadeMedida: string;

	@Column({ name: 'PESO_BRUTO_CARGA' })
	pesoBrutoCarga: number;

	@Column({ name: 'VALOR_CARGA' })
	valorCarga: number;

	@Column({ name: 'NUMERO_PROTOCOLO' })
	numeroProtocolo: string;


	/**
	* Relations
	*/

	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.uf = objetoJson['uf'];
			this.tipoAmbiente = objetoJson['tipoAmbiente'];
			this.tipoEmitente = objetoJson['tipoEmitente'];
			this.tipoTransportadora = objetoJson['tipoTransportadora'];
			this.modelo = objetoJson['modelo'];
			this.serie = objetoJson['serie'];
			this.numeroMdfe = objetoJson['numeroMdfe'];
			this.codigoNumerico = objetoJson['codigoNumerico'];
			this.chaveAcesso = objetoJson['chaveAcesso'];
			this.digitoVerificador = objetoJson['digitoVerificador'];
			this.modal = objetoJson['modal'];
			this.dataHoraEmissao = objetoJson['dataHoraEmissao'];
			this.tipoEmissao = objetoJson['tipoEmissao'];
			this.processoEmissao = objetoJson['processoEmissao'];
			this.versaoProcessoEmissao = objetoJson['versaoProcessoEmissao'];
			this.ufInicio = objetoJson['ufInicio'];
			this.ufFim = objetoJson['ufFim'];
			this.dataHoraPrevisaoViagem = objetoJson['dataHoraPrevisaoViagem'];
			this.quantidadeTotalCte = objetoJson['quantidadeTotalCte'];
			this.quantidadeTotalNfe = objetoJson['quantidadeTotalNfe'];
			this.quantidadeTotalMdfe = objetoJson['quantidadeTotalMdfe'];
			this.codigoUnidadeMedida = objetoJson['codigoUnidadeMedida'];
			this.pesoBrutoCarga = objetoJson['pesoBrutoCarga'];
			this.valorCarga = objetoJson['valorCarga'];
			this.numeroProtocolo = objetoJson['numeroProtocolo'];
			
			
		}
	}
}