/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Classe de calculo da NFE - Lado Servidor
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.cOM                                          
                                                                                
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
													 
Versão de Cálculo feita para o T2Ti ERP 1.0 (Delphi) e adaptada para versões posteriores.
Autor original da primeira versão: Claudio Roberto de Souza (desenvcrs@hotmail.com)
		   
@author Albert Eije (alberteije@gmail.com)                    
@version 1.0.0
*******************************************************************************/
import { Injectable } from '@nestjs/common';
import { CalculoNfeModel } from '../../util/calculoNfe.model';
import { Biblioteca } from '../../util/biblioteca';

@Injectable()
export class NfeCalculoService  {

  constructor() {}

	static async calcular(pCalculoNFe: CalculoNfeModel, result: (pCalculoNFe: CalculoNfeModel) => void) {
		// empresa emissora do simples
		//#region 'Empresa do Simples'
		if (pCalculoNFe.crtEmissor == 1)
		{
			// calculos do simples nacional
			//#region 'CSOSN 101'
			if (pCalculoNFe.csosn == "101") // 101 Tributada pelo Simples Nacional com permissão de crédito
			{
				pCalculoNFe.baseCalculoIcms = ((pCalculoNFe.valorBrutoProdutos + pCalculoNFe.valorFrete + pCalculoNFe.valorSeguro +
												pCalculoNFe.valorOutrasDespesas) - pCalculoNFe.valorDesconto);
				pCalculoNFe.valorCreditoIcmsSn = ((pCalculoNFe.baseCalculoIcms * pCalculoNFe.aliquotaCreditoIcmsSn) / 100);
				pCalculoNFe.valorCreditoIcmsSn = Biblioteca.arredondaTruncaValor("A", pCalculoNFe.valorCreditoIcmsSn, 2);
			}
			//#endregion
			//#region 'CSOSN 102'
			else if (pCalculoNFe.csosn == "102") // 102 Tributada pelo Simples Nacional sem permissão de crédito
			{
				// não tem pCalculoNFe
			}
			//#endregion
			//#region 'CSOSN 103'
			else if (pCalculoNFe.csosn == "103") // 103 isenção do ICMS no Simples Nacional para faixa de receita bruta
			{
				// não tem pCalculoNFe
			}
			//#endregion
			//#region 'CSOSN 201'
			else if (pCalculoNFe.csosn == "201") // 201 Tributada pelo Simples Nacional com permissão de crédito e com cobrança do ICMS por substituição tributária
			{
				// pCalculoNFe icms proprio
				pCalculoNFe.baseCalculoIcms = ((pCalculoNFe.valorBrutoProdutos + pCalculoNFe.valorFrete + pCalculoNFe.valorSeguro +
												pCalculoNFe.valorOutrasDespesas) - pCalculoNFe.valorDesconto);
				if (pCalculoNFe.ufClienteCod == pCalculoNFe.ufEmissor)// se for uf diferente entre emissor e destinatario usar aliquota de transferencia
					pCalculoNFe.valorIcms = ((pCalculoNFe.baseCalculoIcms * pCalculoNFe.aliquotaIcms) / 100);
				else
					pCalculoNFe.valorIcms = ((pCalculoNFe.baseCalculoIcms * pCalculoNFe.aliquotaIcmsInter) / 100);

				pCalculoNFe.valorIcms = Biblioteca.arredondaTruncaValor("A", pCalculoNFe.valorIcms, 2);

				pCalculoNFe.valorCreditoIcmsSn = ((pCalculoNFe.baseCalculoIcms * pCalculoNFe.aliquotaCreditoIcmsSn) / 100);
				pCalculoNFe.valorCreditoIcmsSn = Biblioteca.arredondaTruncaValor("A", pCalculoNFe.valorCreditoIcmsSn, 2);

				// pCalculoNFe icms proprio
				// pCalculoNFe icms ST
				if (pCalculoNFe.modalidadeBcIcmsSt == "0")// preço Tabelado ou máximo Sugerido
				{
					// 
				}
				else if (pCalculoNFe.modalidadeBcIcmsSt == "1")// lista Negativa(valor)
				{
					// 
				}
				else if (pCalculoNFe.modalidadeBcIcmsSt == "2")// Lista Positiva(valor)
				{
					// 
				}
				else if (pCalculoNFe.modalidadeBcIcmsSt == "3")// Lista Neutra(valor)
				{
					// 
				}
				else if (pCalculoNFe.modalidadeBcIcmsSt == "4")// Margem valor Agregado(%)
				{
					pCalculoNFe.baseCalculoIcmsSt = ((pCalculoNFe.valorBrutoProdutos + pCalculoNFe.valorFrete + pCalculoNFe.valorSeguro +
													pCalculoNFe.valorOutrasDespesas) - pCalculoNFe.valorDesconto);
					pCalculoNFe.baseCalculoIcmsSt = (pCalculoNFe.baseCalculoIcmsSt - ((pCalculoNFe.baseCalculoIcmsSt * pCalculoNFe.percentualMvaIcmsSt) / 100));
					pCalculoNFe.baseCalculoIcmsSt = Biblioteca.arredondaTruncaValor("A", pCalculoNFe.baseCalculoIcmsSt, 2);
					pCalculoNFe.valorReducaoBcIcmsSt = ((pCalculoNFe.baseCalculoIcmsSt * pCalculoNFe.aliquotaIcmsSt) / 100);
					pCalculoNFe.valorReducaoBcIcmsSt = Biblioteca.arredondaTruncaValor("A", pCalculoNFe.valorReducaoBcIcmsSt, 2);
					pCalculoNFe.valorIcmsSt = pCalculoNFe.valorIcms - pCalculoNFe.valorReducaoBcIcmsSt;
				}
				else if (pCalculoNFe.modalidadeBcIcmsSt == "5")// Pauta(valor)
				{
					// 
				}// pCalculoNFe icms ST
			}
			//#endregion
			//#region 'CSOSN 202'
			else if (pCalculoNFe.csosn == "202") // 202 Tributada pelo Simples Nacional sem permissão de crédito e com cobrança do ICMS por substituição tributária
			{
				// pCalculoNFe icms proprio
				pCalculoNFe.baseCalculoIcms = ((pCalculoNFe.valorBrutoProdutos + pCalculoNFe.valorFrete + pCalculoNFe.valorSeguro +
												pCalculoNFe.valorOutrasDespesas) - pCalculoNFe.valorDesconto);
				if (pCalculoNFe.ufClienteCod == pCalculoNFe.ufEmissor)// se for uf diferente entre emissor e destinatario usar aliquota de transferencia
					pCalculoNFe.valorIcms = ((pCalculoNFe.baseCalculoIcms * pCalculoNFe.aliquotaIcms) / 100);
				else
					pCalculoNFe.valorIcms = ((pCalculoNFe.baseCalculoIcms * pCalculoNFe.aliquotaIcmsInter) / 100);

				pCalculoNFe.valorIcms = Biblioteca.arredondaTruncaValor("A", pCalculoNFe.valorIcms, 2);

				// pCalculoNFe icms proprio
				// pCalculoNFe icms ST
				if (pCalculoNFe.modalidadeBcIcmsSt == "0")// preço Tabelado ou máximo Sugerido
				{
					// 
				}
				else if (pCalculoNFe.modalidadeBcIcmsSt == "1")// lista Negativa(valor)
				{
					// 
				}
				else if (pCalculoNFe.modalidadeBcIcmsSt == "2")// Lista Positiva(valor)
				{
					// 
				}
				else if (pCalculoNFe.modalidadeBcIcmsSt == "3")// Lista Neutra(valor)
				{
					// 
				}
				else if (pCalculoNFe.modalidadeBcIcmsSt == "4")// Margem valor Agregado(%)
				{
					pCalculoNFe.baseCalculoIcmsSt = ((pCalculoNFe.valorBrutoProdutos + pCalculoNFe.valorFrete + pCalculoNFe.valorSeguro +
														pCalculoNFe.valorOutrasDespesas) - pCalculoNFe.valorDesconto);
					pCalculoNFe.baseCalculoIcmsSt = (pCalculoNFe.baseCalculoIcmsSt - ((pCalculoNFe.baseCalculoIcmsSt * pCalculoNFe.percentualMvaIcmsSt) / 100));
					pCalculoNFe.baseCalculoIcmsSt = Biblioteca.arredondaTruncaValor("A", pCalculoNFe.baseCalculoIcmsSt, 2);
					pCalculoNFe.valorReducaoBcIcmsSt = ((pCalculoNFe.baseCalculoIcmsSt * pCalculoNFe.aliquotaIcmsSt) / 100);
					pCalculoNFe.valorReducaoBcIcmsSt = Biblioteca.arredondaTruncaValor("A", pCalculoNFe.valorReducaoBcIcmsSt, 2);
					pCalculoNFe.valorIcmsSt = pCalculoNFe.valorIcms - pCalculoNFe.valorReducaoBcIcmsSt;
				}
				else if (pCalculoNFe.modalidadeBcIcmsSt == "5")// Pauta(valor)
				{
					// 
				}// pCalculoNFe icms ST
			}
			//#endregion
			//#region 'CSOSN 203'
			else if (pCalculoNFe.csosn == "203") // 203 Tributada pelo Simples Nacional sem permissão de crédito e com cobrança do ICMS por substituição tributária
			{
				// pCalculoNFe icms proprio
				pCalculoNFe.baseCalculoIcms = ((pCalculoNFe.valorBrutoProdutos + pCalculoNFe.valorFrete + pCalculoNFe.valorSeguro +
												pCalculoNFe.valorOutrasDespesas) - pCalculoNFe.valorDesconto);
				if (pCalculoNFe.ufClienteCod == pCalculoNFe.ufEmissor)// se for uf diferente entre emissor e destinatario usar aliquota de transferencia
					pCalculoNFe.valorIcms = ((pCalculoNFe.baseCalculoIcms * pCalculoNFe.aliquotaIcms) / 100);
				else
					pCalculoNFe.valorIcms = ((pCalculoNFe.baseCalculoIcms * pCalculoNFe.aliquotaIcmsInter) / 100);

				pCalculoNFe.valorIcms = Biblioteca.arredondaTruncaValor("A", pCalculoNFe.valorIcms, 2);

				// pCalculoNFe icms proprio
				// pCalculoNFe icms ST
				if (pCalculoNFe.modalidadeBcIcmsSt == "0")// preço Tabelado ou máximo Sugerido
				{
					// 
				}
				else if (pCalculoNFe.modalidadeBcIcmsSt == "1")// lista Negativa(valor)
				{
					// 
				}
				else if (pCalculoNFe.modalidadeBcIcmsSt == "2")// Lista Positiva(valor)
				{
					// 
				}
				else if (pCalculoNFe.modalidadeBcIcmsSt == "3")// Lista Neutra(valor)
				{
					// 
				}
				else if (pCalculoNFe.modalidadeBcIcmsSt == "4")// Margem valor Agregado(%)
				{
					pCalculoNFe.baseCalculoIcmsSt = ((pCalculoNFe.valorBrutoProdutos + pCalculoNFe.valorFrete + pCalculoNFe.valorSeguro +
													pCalculoNFe.valorOutrasDespesas) - pCalculoNFe.valorDesconto);
					pCalculoNFe.baseCalculoIcmsSt = (pCalculoNFe.baseCalculoIcmsSt - ((pCalculoNFe.baseCalculoIcmsSt * pCalculoNFe.percentualMvaIcmsSt) / 100));
					pCalculoNFe.baseCalculoIcmsSt = Biblioteca.arredondaTruncaValor("A", pCalculoNFe.baseCalculoIcmsSt, 2);
					pCalculoNFe.valorReducaoBcIcmsSt = ((pCalculoNFe.baseCalculoIcmsSt * pCalculoNFe.aliquotaIcmsSt) / 100);
					pCalculoNFe.valorReducaoBcIcmsSt = Biblioteca.arredondaTruncaValor("A", pCalculoNFe.valorReducaoBcIcmsSt, 2);
					pCalculoNFe.valorIcmsSt = pCalculoNFe.valorIcms - pCalculoNFe.valorReducaoBcIcmsSt;
				}
				else if (pCalculoNFe.modalidadeBcIcmsSt == "5")// Pauta(valor)
				{
					// 
				}// pCalculoNFe icms ST
			}
			//#endregion
			//#region 'CSOSN 300'
			else if (pCalculoNFe.csosn == "300") // 300 Imune - Classificam-se neste código as operações praticadas por optantes pelo Simples Nacional contempladas com imunidade do ICMS
			{
				// não tem pCalculoNFe
			}
			//#endregion
			//#region 'CSOSN 400'
			else if (pCalculoNFe.csosn == "400") // 400 N?o tributada pelo Simples Nacional - Classificam-se neste código as operações praticadas por optantes pelo Simples Nacional não sujeitas ? tributa??o pelo ICMS dentro do Simples Nacional
			{
				// não tem pCalculoNFe
			}
			//#endregion
			//#region 'CSOSN 500'
			else if (pCalculoNFe.csosn == "500") // 500 ICMS cobrado anteriormente por substituição tributária (substituído) ou por antecipação - Classificam-se neste código as operações sujeitas exclusivamente ao regime de substituição tributária na condição de substituído tributário ou no caso de antecipações
			{
				// não tem pCalculoNFe
			}
			//#endregion
			//#region 'CSOSN 900'
			else if (pCalculoNFe.csosn == "900") // 900 Outros - Classificam-se neste código as demais operações que não se enquadrem nos códigos 101, 102, 103, 201, 202, 203, 300, 400 e 500
			{
				// 
			}
			//#endregion
		}// if Empresa.crt = crtSimplesNacional
		//#endregion

		// empresas do regime normal e excesso de receita
		//#region 'Empresa do Regime normal e execesso de receita'
		if ((pCalculoNFe.crtEmissor == 2) || (pCalculoNFe.crtEmissor == 3))
		{
			// convert UF do cliente para codigo para comparar com cod uf emitente
			pCalculoNFe.ufClienteCod = Biblioteca.uFToInt(pCalculoNFe.ufCliente);
			// aqui definir a aliquota do icms proprio ou inter estatual

			// calcula ipi
			//#region 'IPI'
			if ((pCalculoNFe.cstIpi == "00") ||
				(pCalculoNFe.cstIpi == "49") ||
				(pCalculoNFe.cstIpi == "50") ||
				(pCalculoNFe.cstIpi == "99"))
			{
				pCalculoNFe.baseCalculoIpi = ((pCalculoNFe.valorBrutoProdutos + pCalculoNFe.valorFrete + pCalculoNFe.valorSeguro + pCalculoNFe.valorOutrasDespesas) - pCalculoNFe.valorDesconto);
				pCalculoNFe.valorIpi = ((pCalculoNFe.baseCalculoIpi * pCalculoNFe.aliquotaIpi) / 100);
				pCalculoNFe.valorIpi = Biblioteca.arredondaTruncaValor("A", pCalculoNFe.valorIpi, 2);
			}
			else
			{
				pCalculoNFe.baseCalculoIpi = 0;
				pCalculoNFe.valorIpi = 0;
			}
			//#endregion

			// calcula icms
			//#region 'CST 00'
			if (pCalculoNFe.cstIcms == "00") // 00 Tributada integralmente
			{
				// calcula icms
				if (pCalculoNFe.modalidadeBcIcms == "0")// Margem valor Agregado
				{
					// 
				}// 0
				else if (pCalculoNFe.modalidadeBcIcms == "1")// Pauta(Valor)
				{
					// 
				}// 1
				else if (pCalculoNFe.modalidadeBcIcms == "2")// preço Tabelado M?x.(Valor)
				{
					// 
				}// 2
				else if (pCalculoNFe.modalidadeBcIcms == "3")// Valor da operação
				{
					if (pCalculoNFe.tipoCliente == "F") // pessoa fisica inclui ipi na base de pCalculoNFe do icms
					{
						pCalculoNFe.baseCalculoIcms = ((pCalculoNFe.valorBrutoProdutos + pCalculoNFe.valorFrete + pCalculoNFe.valorSeguro +
														pCalculoNFe.valorOutrasDespesas + pCalculoNFe.valorIpi) - pCalculoNFe.valorDesconto);
						pCalculoNFe.valorIcms = ((pCalculoNFe.baseCalculoIcms * pCalculoNFe.aliquotaIcms) / 100);// pessoa fisica sempre usa a aliquota normal da UF emissao
					}
					if (pCalculoNFe.tipoCliente == "J") // pessoa juridica não inclui ipi na base de pCalculoNFe do icms
					{
						pCalculoNFe.baseCalculoIcms = ((pCalculoNFe.valorBrutoProdutos + pCalculoNFe.valorFrete + pCalculoNFe.valorSeguro +
														pCalculoNFe.valorOutrasDespesas) - pCalculoNFe.valorDesconto);// pessoa juridica nao inclui ipi na base de pCalculoNFe
						if (pCalculoNFe.ufClienteCod == pCalculoNFe.ufEmissor)// se for uf diferente entre emissor e destinatario usar aliquota de transferencia
							pCalculoNFe.valorIcms = ((pCalculoNFe.baseCalculoIcms * pCalculoNFe.aliquotaIcms) / 100);
						else
							pCalculoNFe.valorIcms = ((pCalculoNFe.baseCalculoIcms * pCalculoNFe.aliquotaIcmsInter) / 100);
					}
					pCalculoNFe.valorIcms = Biblioteca.arredondaTruncaValor("A", pCalculoNFe.valorIcms, 2);
				}// 3
			}
			//#endregion
			//#region 'CST 10'
			else if (pCalculoNFe.cstIcms == "10") // 10 Tributada e com cobrança do ICMS por substituição tributária
			{
				// pCalculoNFe icms proprio
				if (pCalculoNFe.modalidadeBcIcms == "0")// Margem valor Agregado
				{
					// 
				}// 0
				else if (pCalculoNFe.modalidadeBcIcms == "1")// Pauta(Valor)
				{
					// 
				}// 1
				else if (pCalculoNFe.modalidadeBcIcms == "2")// preço Tabelado Máx.(Valor)
				{
					// 
				}// 2
				else if (pCalculoNFe.modalidadeBcIcms == "3")// Valor da operação
				{
					if (pCalculoNFe.tipoCliente == "F") // pessoa fisica inclui ipi na base de pCalculoNFe do icms
					{
						pCalculoNFe.baseCalculoIcms = ((pCalculoNFe.valorBrutoProdutos + pCalculoNFe.valorFrete + pCalculoNFe.valorSeguro +
														pCalculoNFe.valorOutrasDespesas + pCalculoNFe.valorIpi) - pCalculoNFe.valorDesconto);
						pCalculoNFe.valorIcms = ((pCalculoNFe.baseCalculoIcms * pCalculoNFe.aliquotaIcms) / 100);// pessoa fisica sempre usa a aliquota normal da UF emissao
					}
					if (pCalculoNFe.tipoCliente == "J") // pessoa juridica não inclui ipi na base de pCalculoNFe do icms
					{
						pCalculoNFe.baseCalculoIcms = ((pCalculoNFe.valorBrutoProdutos + pCalculoNFe.valorFrete + pCalculoNFe.valorSeguro +
														pCalculoNFe.valorOutrasDespesas) - pCalculoNFe.valorDesconto);// pessoa juridica nao inclui ipi na base de pCalculoNFe
						if (pCalculoNFe.ufClienteCod == pCalculoNFe.ufEmissor)// se for uf diferente entre emissor e destinatario usar aliquota de transferencia
							pCalculoNFe.valorIcms = ((pCalculoNFe.baseCalculoIcms * pCalculoNFe.aliquotaIcms) / 100);
						else
							pCalculoNFe.valorIcms = ((pCalculoNFe.baseCalculoIcms * pCalculoNFe.aliquotaIcmsInter) / 100);
					}
					pCalculoNFe.valorIcms = Biblioteca.arredondaTruncaValor("A", pCalculoNFe.valorIcms, 2);
				}// 3 - pCalculoNFe icms proprio

				// pCalculoNFe icms ST
				if (pCalculoNFe.modalidadeBcIcmsSt == "0")// preço Tabelado ou máximo Sugerido
				{
					// 
				}
				else if (pCalculoNFe.modalidadeBcIcmsSt == "1")// lista Negativa(valor)
				{
					// 
				}
				else if (pCalculoNFe.modalidadeBcIcmsSt == "2")// Lista Positiva(valor)
				{
					// 
				}
				else if (pCalculoNFe.modalidadeBcIcmsSt == "3")// Lista Neutra(valor)
				{
					// 
				}
				else if (pCalculoNFe.modalidadeBcIcmsSt == "4")// Margem valor Agregado(%)
				{
					pCalculoNFe.baseCalculoIcmsSt = ((pCalculoNFe.valorBrutoProdutos + pCalculoNFe.valorFrete + pCalculoNFe.valorSeguro +
														pCalculoNFe.valorOutrasDespesas + pCalculoNFe.valorIpi) - pCalculoNFe.valorDesconto);
					pCalculoNFe.baseCalculoIcmsSt = (pCalculoNFe.baseCalculoIcmsSt - ((pCalculoNFe.baseCalculoIcmsSt * pCalculoNFe.percentualMvaIcmsSt) / 100));
					pCalculoNFe.baseCalculoIcmsSt = Biblioteca.arredondaTruncaValor("A", pCalculoNFe.baseCalculoIcmsSt, 2);
					pCalculoNFe.valorReducaoBcIcmsSt = ((pCalculoNFe.baseCalculoIcmsSt * pCalculoNFe.aliquotaIcmsSt) / 100);
					pCalculoNFe.valorReducaoBcIcmsSt = Biblioteca.arredondaTruncaValor("A", pCalculoNFe.valorReducaoBcIcmsSt, 2);
					pCalculoNFe.valorIcmsSt = pCalculoNFe.valorIcms - pCalculoNFe.valorReducaoBcIcmsSt;
				}
				else if (pCalculoNFe.modalidadeBcIcmsSt == "5")// Pauta(valor)
				{
					// 
				}// pCalculoNFe icms ST
			}
			//#endregion
			//#region 'CST 20'
			else if (pCalculoNFe.cstIcms == "20") // 20 Com redução de base de cálculo do ICMS
			{
				// calcula icms
				if (pCalculoNFe.modalidadeBcIcms == "0")// Margem valor Agregado
				{
					// 
				}// 0
				else if (pCalculoNFe.modalidadeBcIcms == "1")// Pauta(Valor)
				{
					// 
				}// 1
				else if (pCalculoNFe.modalidadeBcIcms == "2")// preço Tabelado M?x.(Valor)
				{
					// 
				}// 2
				else if (pCalculoNFe.modalidadeBcIcms == "3")// Valor da operação
				{
					if (pCalculoNFe.tipoCliente == "F") // pessoa fisica inclui ipi na base de pCalculoNFe do icms
					{
						pCalculoNFe.baseCalculoIcms = ((pCalculoNFe.valorBrutoProdutos + pCalculoNFe.valorFrete + pCalculoNFe.valorSeguro +
													pCalculoNFe.valorOutrasDespesas + pCalculoNFe.valorIpi) - pCalculoNFe.valorDesconto);
						pCalculoNFe.valorReducaoBcIcms = (pCalculoNFe.baseCalculoIcms - ((pCalculoNFe.baseCalculoIcms * pCalculoNFe.taxaReducaoBcIcms) / 100));
						pCalculoNFe.valorReducaoBcIcms = Biblioteca.arredondaTruncaValor("A", pCalculoNFe.valorReducaoBcIcmsSt, 2);
						pCalculoNFe.baseCalculoIcms = pCalculoNFe.baseCalculoIcms - pCalculoNFe.valorReducaoBcIcms;
						pCalculoNFe.valorIcms = ((pCalculoNFe.baseCalculoIcms * pCalculoNFe.aliquotaIcms) / 100);// pessoa fisica sempre usa a aliquota normal da UF emissao
						pCalculoNFe.valorIcms = Biblioteca.arredondaTruncaValor("A", pCalculoNFe.valorIcms, 2);
					}
					if (pCalculoNFe.tipoCliente == "J") // pessoa juridica não inclui ipi na base de pCalculoNFe do icms
					{
						pCalculoNFe.baseCalculoIcms = ((pCalculoNFe.valorBrutoProdutos + pCalculoNFe.valorFrete + pCalculoNFe.valorSeguro +
													pCalculoNFe.valorOutrasDespesas) - pCalculoNFe.valorDesconto);// pessoa juridica nao inclui ipi na base de pCalculoNFe
						pCalculoNFe.valorReducaoBcIcms = (pCalculoNFe.baseCalculoIcms - ((pCalculoNFe.baseCalculoIcms * pCalculoNFe.taxaReducaoBcIcms) / 100));
						pCalculoNFe.valorReducaoBcIcms = Biblioteca.arredondaTruncaValor("A", pCalculoNFe.valorReducaoBcIcmsSt, 2);
						pCalculoNFe.baseCalculoIcms = pCalculoNFe.baseCalculoIcms - pCalculoNFe.valorReducaoBcIcms;
						if (pCalculoNFe.ufClienteCod == pCalculoNFe.ufEmissor)// se for uf diferente entre emissor e destinatario usar aliquota de transferencia
							pCalculoNFe.valorIcms = ((pCalculoNFe.baseCalculoIcms * pCalculoNFe.aliquotaIcms) / 100);
						else
							pCalculoNFe.valorIcms = ((pCalculoNFe.baseCalculoIcms * pCalculoNFe.aliquotaIcmsInter) / 100);
						pCalculoNFe.valorIcms = Biblioteca.arredondaTruncaValor("A", pCalculoNFe.valorIcms, 2);
					}
				}// 3
			}
			//#endregion
			//#region 'CST 30'
			else if (pCalculoNFe.cstIcms == "30") // 30 Isenta ou não tributada e com cobrança do ICMS por substituição tributária
			{
				// 
			}
			//#endregion
			//#region 'CST 40'
			else if (pCalculoNFe.cstIcms == "40") // 40 Isenta do ICMS
			{
				// 
			}
			//#endregion
			//#region 'CST 41'
			else if (pCalculoNFe.cstIcms == "41") // 41 Nao tributada no ICMS
			{
				// 
			}
			//#endregion
			//#region 'CST 50'
			else if (pCalculoNFe.cstIcms == "50") // 50 Suspensao do ICMS
			{
				// 
			}
			//#endregion
			//#region 'CST 51'
			else if (pCalculoNFe.cstIcms == "51") // 51 Diferimento do ICMS
			{
				// 
			}
			//#endregion
			//#region 'CST 60'
			else if (pCalculoNFe.cstIcms == "60") // 60 ICMS cobrado anteriormente por substituição tributária
			{
				// 
			}
			//#endregion
			//#region 'CST 70'
			else if (pCalculoNFe.cstIcms == "70") // 70 Com redução da base de cálculo e cobrança do ICMS por substituição tributária
			{
				// 
			}
			//#endregion
			//#region 'CST 90'
			else if (pCalculoNFe.cstIcms == "90") // 90 Outras
			{
				// 
			}
			//#endregion

			// calcula pis/cofins
			//#region 'PIS/COFINS'
			// calcula Pis 01
			if (pCalculoNFe.cstPis == "01") // tributável por aliquota Normal
			{
				pCalculoNFe.baseCalculoPis = ((pCalculoNFe.valorBrutoProdutos + pCalculoNFe.valorFrete + pCalculoNFe.valorSeguro +
											pCalculoNFe.valorOutrasDespesas + pCalculoNFe.valorIcms + pCalculoNFe.valorIpi) - pCalculoNFe.valorDesconto);
				pCalculoNFe.valorPis = ((pCalculoNFe.baseCalculoPis * pCalculoNFe.aliquotaPis) / 100);
				pCalculoNFe.valorPis = Biblioteca.arredondaTruncaValor("A", pCalculoNFe.valorPis, 2);
			}
			// calcula Pis 02
			if (pCalculoNFe.cstPis == "02") // tributável por aliquota diferenciada
			{
				pCalculoNFe.baseCalculoPis = ((pCalculoNFe.valorBrutoProdutos + pCalculoNFe.valorFrete + pCalculoNFe.valorSeguro +
												pCalculoNFe.valorOutrasDespesas + pCalculoNFe.valorIcms + pCalculoNFe.valorIpi) - pCalculoNFe.valorDesconto);
				pCalculoNFe.valorPis = (pCalculoNFe.baseCalculoPis * pCalculoNFe.aliquotaPisReais);// ver formula 02
				pCalculoNFe.valorPis = Biblioteca.arredondaTruncaValor("A", pCalculoNFe.valorPis, 2);
			}
			// calcula Cofins 01
			if (pCalculoNFe.cstCofins == "01") // tributável por aliquota Normal
			{
				pCalculoNFe.baseCalculoCofins = ((pCalculoNFe.valorBrutoProdutos + pCalculoNFe.valorFrete + pCalculoNFe.valorSeguro +
												pCalculoNFe.valorOutrasDespesas + pCalculoNFe.valorIcms + pCalculoNFe.valorIpi) - pCalculoNFe.valorDesconto);
				pCalculoNFe.valorCofins = ((pCalculoNFe.baseCalculoCofins * pCalculoNFe.aliquotaCofins) / 100);
				pCalculoNFe.valorCofins = Biblioteca.arredondaTruncaValor("A", pCalculoNFe.valorCofins, 2);
			}
			// calcula Cofins 02
			if (pCalculoNFe.cstCofins == "02") // tributável por aliquota diferenciada
			{
				pCalculoNFe.baseCalculoCofins = ((pCalculoNFe.valorBrutoProdutos + pCalculoNFe.valorFrete + pCalculoNFe.valorSeguro +
												pCalculoNFe.valorOutrasDespesas + pCalculoNFe.valorIcms + pCalculoNFe.valorIpi) - pCalculoNFe.valorDesconto);
				pCalculoNFe.valorCofins = (pCalculoNFe.baseCalculoCofins * pCalculoNFe.aliquotaCofinsReais);// ver formula 02
				pCalculoNFe.valorCofins = Biblioteca.arredondaTruncaValor("A", pCalculoNFe.valorCofins, 2);
			}
			//#endregion
		}// if Empresa.crt = crtRegimeNormal or Empresa.crt = crtSimplesExcessoReceita
		//#endregion

		return result(pCalculoNFe);
	}  
	
}