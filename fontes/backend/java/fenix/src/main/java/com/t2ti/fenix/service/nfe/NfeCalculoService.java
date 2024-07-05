/********************************************************************************
Title: T2Ti ERP
Description: Classe de calculo da NFE - Lado Servidor

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


Versão de Cálculo feita para o T2Ti ERP 1.0 (Delphi) e adaptada para versões posteriores.
Autor original da primeira versão: Claudio Roberto de Souza (desenvcrs@hotmail.com)

@author T2Ti.COM
@version 1.0
********************************************************************************/
package com.t2ti.fenix.service.nfe;

import java.math.BigDecimal;
import java.math.MathContext;

import org.springframework.stereotype.Service;

import com.t2ti.fenix.model.transiente.CalculoNFe;
import com.t2ti.fenix.util.Biblioteca;

@Service
public final class NfeCalculoService {

	private NfeCalculoService() {}
	
	public static CalculoNFe Calcular(CalculoNFe pCalculoNFe)
	{
		CalculoNFe Calculo = pCalculoNFe;

		// empresa emissora do simples
		//region 'Empresa do Simples'
		if (Calculo.getCrtEmissor() == 1)
		{
			// calculos do simples nacional
			//region 'CSOSN 101'
			if (Calculo.getCsosn() == "101") // 101 Tributada pelo Simples Nacional com permissão de crédito
			{				
				Calculo.setBaseCalculoIcms(
							Biblioteca.subtrai(
								Biblioteca.soma(
									Biblioteca.soma(Calculo.getValorBrutoProdutos(), Calculo.getValorFrete()),
									Biblioteca.soma(Calculo.getValorSeguro(), Calculo.getValorOutrasDespesas())
								), Calculo.getValorDesconto()
							)
						);
				Calculo.setValorCreditoIcmsSn(
							Biblioteca.divide(
								Biblioteca.multiplica(Calculo.getBaseCalculoIcms(), Calculo.getAliquotaCreditoIcmsSn()), 
								BigDecimal.valueOf(100)
							)
						);
				Calculo.setValorCreditoIcmsSn(Calculo.getValorCreditoIcmsSn());
			}
			//endregion

			//region 'CSOSN 102'
			else if (Calculo.getCsosn() == "102") // 102 Tributada pelo Simples Nacional sem permissão de crédito
			{
				// não tem calculo
			}
			//endregion
			
			//region 'CSOSN 103'
			else if (Calculo.getCsosn() == "103") // 103 isenção do ICMS no Simples Nacional para faixa de receita bruta
			{
				// não tem calculo
			}
			//endregion
			
			//region 'CSOSN 201'
			else if (Calculo.getCsosn() == "201") // 201 Tributada pelo Simples Nacional com permissão de crédito e com cobrança do ICMS por substituição tributária
			{
				// calculo icms proprio
				Calculo.setBaseCalculoIcms(
						Biblioteca.subtrai(
							Biblioteca.soma(
								Biblioteca.soma(Calculo.getValorBrutoProdutos(), Calculo.getValorFrete()),
								Biblioteca.soma(Calculo.getValorSeguro(), Calculo.getValorOutrasDespesas())
							), Calculo.getValorDesconto()
						)
					);
				
				if (Calculo.getUfClienteCod() == Calculo.getUfEmissor())// se for uf diferente entre emissor e destinatario usar aliquota de transferencia
				{
					Calculo.setValorIcms(
						Biblioteca.divide(
								Biblioteca.multiplica(Calculo.getBaseCalculoIcms(), Calculo.getAliquotaIcms()), 
								BigDecimal.valueOf(100)
							)
					);
				}
				else
				{
					Calculo.setValorIcms(
						Biblioteca.divide(
								Biblioteca.multiplica(Calculo.getBaseCalculoIcms(), Calculo.getAliquotaIcmsInter()), 
								BigDecimal.valueOf(100)
							)
					);
				}
				
				Calculo.setValorCreditoIcmsSn(
						Biblioteca.divide(
								Biblioteca.multiplica(Calculo.getBaseCalculoIcms(), Calculo.getAliquotaCreditoIcmsSn()), 
								BigDecimal.valueOf(100)
							)
					);

				// calculo icms proprio
				// calculo icms ST
				if (Calculo.getModalidadeBcIcmsSt() == "0")// preço Tabelado ou máximo Sugerido
				{
					// 
				}
				else if (Calculo.getModalidadeBcIcmsSt() == "1")// lista Negativa(valor)
				{
					// 
				}
				else if (Calculo.getModalidadeBcIcmsSt() == "2")// Lista Positiva(valor)
				{
					// 
				}
				else if (Calculo.getModalidadeBcIcmsSt() == "3")// Lista Neutra(valor)
				{
					// 
				}
				else if (Calculo.getModalidadeBcIcmsSt() == "4")// Margem valor Agregado(%)
				{
					Calculo.setBaseCalculoIcmsSt(
							Biblioteca.subtrai(
								Biblioteca.soma(
									Biblioteca.soma(Calculo.getValorBrutoProdutos(), Calculo.getValorFrete()),
									Biblioteca.soma(Calculo.getValorSeguro(), Calculo.getValorOutrasDespesas())
								), Calculo.getValorDesconto()
							)
						);
					Calculo.setBaseCalculoIcmsSt(
							Biblioteca.subtrai(
								Calculo.getBaseCalculoIcmsSt(),
								Biblioteca.divide(
									Biblioteca.multiplica(Calculo.getBaseCalculoIcmsSt(), Calculo.getPercentualMvaIcmsSt()),
									BigDecimal.valueOf(100)
								)
							)
						);					
					Calculo.setValorCreditoIcmsSn(
							Biblioteca.divide(
									Biblioteca.multiplica(Calculo.getBaseCalculoIcms(), Calculo.getAliquotaIcmsSt()), 
									BigDecimal.valueOf(100)
								)
						);
					Calculo.setValorIcmsSt(
							Biblioteca.subtrai(Calculo.getValorIcms(), Calculo.getValorReducaoBcIcmsSt())
					);
				}
				else if (Calculo.getModalidadeBcIcmsSt() == "5")// Pauta(valor)
				{
					// 
				}// calculo icms ST
			}
			//endregion

			//region 'CSOSN 202'
			else if (Calculo.getCsosn() == "202") // 202 Tributada pelo Simples Nacional sem permissão de crédito e com cobrança do ICMS por substituição tributária
			{
				// calculo icms proprio
				Calculo.setBaseCalculoIcmsSt(
						Biblioteca.subtrai(
							Biblioteca.soma(
								Biblioteca.soma(Calculo.getValorBrutoProdutos(), Calculo.getValorFrete()),
								Biblioteca.soma(Calculo.getValorSeguro(), Calculo.getValorOutrasDespesas())
							), Calculo.getValorDesconto()
						)
					);

				if (Calculo.getUfClienteCod() == Calculo.getUfEmissor())// se for uf diferente entre emissor e destinatario usar aliquota de transferencia
				{
					Calculo.setValorIcms(
						Biblioteca.divide(
								Biblioteca.multiplica(Calculo.getBaseCalculoIcms(), Calculo.getAliquotaIcms()), 
								BigDecimal.valueOf(100)
							)
					);
				}
				else
				{
					Calculo.setValorIcms(
						Biblioteca.divide(
								Biblioteca.multiplica(Calculo.getBaseCalculoIcms(), Calculo.getAliquotaIcmsInter()), 
								BigDecimal.valueOf(100)
							)
					);
				}

				// calculo icms proprio
				// calculo icms ST
				if (Calculo.getModalidadeBcIcmsSt() == "0")// preço Tabelado ou máximo Sugerido
				{
					// 
				}
				else if (Calculo.getModalidadeBcIcmsSt() == "1")// lista Negativa(valor)
				{
					// 
				}
				else if (Calculo.getModalidadeBcIcmsSt() == "2")// Lista Positiva(valor)
				{
					// 
				}
				else if (Calculo.getModalidadeBcIcmsSt() == "3")// Lista Neutra(valor)
				{
					// 
				}
				else if (Calculo.getModalidadeBcIcmsSt() == "4")// Margem valor Agregado(%)
				{
					Calculo.setBaseCalculoIcmsSt(
							Biblioteca.subtrai(
								Biblioteca.soma(
									Biblioteca.soma(Calculo.getValorBrutoProdutos(), Calculo.getValorFrete()),
									Biblioteca.soma(Calculo.getValorSeguro(), Calculo.getValorOutrasDespesas())
								), Calculo.getValorDesconto()
							)
						);
					Calculo.setBaseCalculoIcmsSt(
							Biblioteca.subtrai(
								Calculo.getBaseCalculoIcmsSt(),
								Biblioteca.divide(
									Biblioteca.multiplica(Calculo.getBaseCalculoIcmsSt(), Calculo.getPercentualMvaIcmsSt()),
									BigDecimal.valueOf(100)
								)
							)
						);					
					Calculo.setValorReducaoBcIcmsSt(
							Biblioteca.divide(
									Biblioteca.multiplica(Calculo.getBaseCalculoIcmsSt(), Calculo.getAliquotaIcmsSt()), 
									BigDecimal.valueOf(100)
								)
						);

					Calculo.setValorIcmsSt(
							Biblioteca.subtrai(Calculo.getValorIcms(), Calculo.getValorReducaoBcIcmsSt())
					);
				}
				else if (Calculo.getModalidadeBcIcmsSt() == "5")// Pauta(valor)
				{
					// 
				}// calculo icms ST
			}
			//endregion

			//region 'CSOSN 203'
			else if (Calculo.getCsosn() == "203") // 203 Tributada pelo Simples Nacional sem permissão de crédito e com cobrança do ICMS por substituição tributária
			{
				// calculo icms proprio
				Calculo.setBaseCalculoIcmsSt(
						Biblioteca.subtrai(
							Biblioteca.soma(
								Biblioteca.soma(Calculo.getValorBrutoProdutos(), Calculo.getValorFrete()),
								Biblioteca.soma(Calculo.getValorSeguro(), Calculo.getValorOutrasDespesas())
							), Calculo.getValorDesconto()
						)
					);

				if (Calculo.getUfClienteCod() == Calculo.getUfEmissor())// se for uf diferente entre emissor e destinatario usar aliquota de transferencia
				{
					Calculo.setValorIcms(
						Biblioteca.divide(
								Biblioteca.multiplica(Calculo.getBaseCalculoIcms(), Calculo.getAliquotaIcms()), 
								BigDecimal.valueOf(100)
							)
					);
				}
				else
				{
					Calculo.setValorIcms(
						Biblioteca.divide(
								Biblioteca.multiplica(Calculo.getBaseCalculoIcms(), Calculo.getAliquotaIcmsInter()), 
								BigDecimal.valueOf(100)
							)
					);
				}

				// calculo icms proprio
				// calculo icms ST
				if (Calculo.getModalidadeBcIcmsSt() == "0")// preço Tabelado ou máximo Sugerido
				{
					// 
				}
				else if (Calculo.getModalidadeBcIcmsSt() == "1")// lista Negativa(valor)
				{
					// 
				}
				else if (Calculo.getModalidadeBcIcmsSt() == "2")// Lista Positiva(valor)
				{
					// 
				}
				else if (Calculo.getModalidadeBcIcmsSt() == "3")// Lista Neutra(valor)
				{
					// 
				}
				else if (Calculo.getModalidadeBcIcmsSt() == "4")// Margem valor Agregado(%)
				{
					Calculo.setBaseCalculoIcmsSt(
							Biblioteca.subtrai(
								Biblioteca.soma(
									Biblioteca.soma(Calculo.getValorBrutoProdutos(), Calculo.getValorFrete()),
									Biblioteca.soma(Calculo.getValorSeguro(), Calculo.getValorOutrasDespesas())
								), Calculo.getValorDesconto()
							)
						);
					Calculo.setBaseCalculoIcmsSt(
							Biblioteca.subtrai(
								Calculo.getBaseCalculoIcmsSt(),
								Biblioteca.divide(
									Biblioteca.multiplica(Calculo.getBaseCalculoIcmsSt(), Calculo.getPercentualMvaIcmsSt()),
									BigDecimal.valueOf(100)
								)
							)
						);					
					
					Calculo.setValorReducaoBcIcmsSt(
							Biblioteca.divide(
									Biblioteca.multiplica(Calculo.getBaseCalculoIcmsSt(), Calculo.getAliquotaIcmsSt()), 
									BigDecimal.valueOf(100)
								)
						);

					Calculo.setValorIcmsSt(
							Biblioteca.subtrai(Calculo.getValorIcms(), Calculo.getValorReducaoBcIcmsSt())
					);
				}
				else if (Calculo.getModalidadeBcIcmsSt() == "5")// Pauta(valor)
				{
					// 
				}// calculo icms ST
			}
			//endregion

			//region 'CSOSN 300'
			else if (Calculo.getCsosn() == "300") // 300 Imune() - Classificam-se neste código as operações praticadas por optantes pelo Simples Nacional contempladas com imunidade do ICMS
			{
				// não tem calculo
			}
			//endregion
			
			//region 'CSOSN 400'
			else if (Calculo.getCsosn() == "400") // 400 N?o tributada pelo Simples Nacional() - Classificam-se neste código as operações praticadas por optantes pelo Simples Nacional não sujeitas ? tributa??o pelo ICMS dentro do Simples Nacional
			{
				// não tem calculo
			}
			//endregion
			
			//region 'CSOSN 500'
			else if (Calculo.getCsosn() == "500") // 500 ICMS cobrado anteriormente por substituição tributária (substituído) ou por antecipação() - Classificam-se neste código as operações sujeitas exclusivamente ao regime de substituição tributária na condição de substituído tributário ou no caso de antecipações
			{
				// não tem calculo
			}
			//endregion
			
			//region 'CSOSN 900'
			else if (Calculo.getCsosn() == "900") // 900 Outros() - Classificam-se neste código as demais operações que não se enquadrem nos códigos 101, 102, 103, 201, 202, 203, 300, 400 e 500
			{
				// 
			}
			//endregion
		}// if Empresa.getCrt() = crtSimplesNacional
		//endregion

		
		
		// empresas do regime normal e excesso de receita
		//region 'Empresa do Regime normal e execesso de receita'
		if ((Calculo.getCrtEmissor() == 2) || (Calculo.getCrtEmissor() == 3))
		{
			// convert UF do cliente para codigo para comparar com cod uf emitente
			Calculo.setUfClienteCod(Biblioteca.UFToInt(Calculo.getUfCliente()));
			
			
			// aqui definir a aliquota do icms proprio ou inter estatual
			
			// calcula ipi
			//region 'IPI'
			if ((Calculo.getCstIpi() == "00") ||
			   (Calculo.getCstIpi() == "49") ||
			   (Calculo.getCstIpi() == "50") ||
			   (Calculo.getCstIpi() == "99"))
			{
				Calculo.setBaseCalculoIpi(
						Biblioteca.subtrai(
							Biblioteca.soma(
								Biblioteca.soma(Calculo.getValorBrutoProdutos(), Calculo.getValorFrete()),
								Biblioteca.soma(Calculo.getValorSeguro(), Calculo.getValorOutrasDespesas())
							), Calculo.getValorDesconto()
						)
					);
				Calculo.setValorIpi(
						Biblioteca.divide(
								Biblioteca.multiplica(Calculo.getBaseCalculoIpi(), Calculo.getAliquotaIpi()), 
								BigDecimal.valueOf(100)
							)
					);
			}
			else
			{
				Calculo.setBaseCalculoIpi(BigDecimal.ZERO);
				Calculo.setValorIpi(BigDecimal.ZERO);
			}
			//endregion

			// calcula icms
			//region 'CST 00'
			if (Calculo.getCstIcms() == "00") // 00 Tributada integralmente
			{
				// calcula icms
				if (Calculo.getModalidadeBcIcms() == "0")// Margem valor Agregado
				{
					// 
				}// 0
				else if (Calculo.getModalidadeBcIcms() == "1")// Pauta(Valor)
				{
					// 
				}// 1
				else if (Calculo.getModalidadeBcIcms() == "2")// preço Tabelado M?x.get(Valor)
				{
					// 
				}// 2
				else if (Calculo.getModalidadeBcIcms() == "3")// Valor da operação
				{
					if (Calculo.getTipoCliente() == "F") // pessoa fisica inclui ipi na base de calculo do icms
					{
						Calculo.setBaseCalculoIcms(
								Biblioteca.subtrai(
									Biblioteca.soma(
										Biblioteca.soma(
											Biblioteca.soma(Calculo.getValorBrutoProdutos(), Calculo.getValorFrete()),
											Biblioteca.soma(Calculo.getValorSeguro(), Calculo.getValorOutrasDespesas())
										), Calculo.getValorIpi()
									), Calculo.getValorDesconto()
								)
							);

						Calculo.setValorIcms(
								Biblioteca.divide(
										Biblioteca.multiplica(Calculo.getBaseCalculoIcms(), Calculo.getAliquotaIcms()), 
										BigDecimal.valueOf(100)
									)
							);
					}
					if (Calculo.getTipoCliente() == "J") // pessoa juridica não inclui ipi na base de calculo do icms
					{
						Calculo.setBaseCalculoIcms(
								Biblioteca.subtrai(
									Biblioteca.soma(
										Biblioteca.soma(Calculo.getValorBrutoProdutos(), Calculo.getValorFrete()),
										Biblioteca.soma(Calculo.getValorSeguro(), Calculo.getValorOutrasDespesas())
									), Calculo.getValorDesconto()
								)
							);

						if (Calculo.getUfClienteCod() == Calculo.getUfEmissor())// se for uf diferente entre emissor e destinatario usar aliquota de transferencia
						{
							Calculo.setValorIcms(
								Biblioteca.divide(
										Biblioteca.multiplica(Calculo.getBaseCalculoIcms(), Calculo.getAliquotaIcms()), 
										BigDecimal.valueOf(100)
									)
							);
						}
						else
						{
							Calculo.setValorIcms(
								Biblioteca.divide(
										Biblioteca.multiplica(Calculo.getBaseCalculoIcms(), Calculo.getAliquotaIcmsInter()), 
										BigDecimal.valueOf(100)
									)
							);
						}
					}
				}// 3
			}
			//endregion

			//region 'CST 10'
			else if (Calculo.getCstIcms() == "10") // 10 Tributada e com cobrança do ICMS por substituição tributária
			{
				// calculo icms proprio
				if (Calculo.getModalidadeBcIcms() == "0")// Margem valor Agregado
				{
					// 
				}// 0
				else if (Calculo.getModalidadeBcIcms() == "1")// Pauta(Valor)
				{
					// 
				}// 1
				else if (Calculo.getModalidadeBcIcms() == "2")// preço Tabelado Máx.get(Valor)
				{
					// 
				}// 2
				else if (Calculo.getModalidadeBcIcms() == "3")// Valor da operação
				{
					if (Calculo.getTipoCliente() == "F") // pessoa fisica inclui ipi na base de calculo do icms
					{
						Calculo.setBaseCalculoIcms(
								Biblioteca.subtrai(
									Biblioteca.soma(
										Biblioteca.soma(
											Biblioteca.soma(Calculo.getValorBrutoProdutos(), Calculo.getValorFrete()),
											Biblioteca.soma(Calculo.getValorSeguro(), Calculo.getValorOutrasDespesas())
										), Calculo.getValorIpi()
									), Calculo.getValorDesconto()
								)
							);
						Calculo.setValorIcms(
								Biblioteca.divide(
										Biblioteca.multiplica(Calculo.getBaseCalculoIcms(), Calculo.getAliquotaIcms()), 
										BigDecimal.valueOf(100)
									)
							);
					}
					if (Calculo.getTipoCliente() == "J") // pessoa juridica não inclui ipi na base de calculo do icms
					{
						Calculo.setBaseCalculoIcms(
								Biblioteca.subtrai(
									Biblioteca.soma(
										Biblioteca.soma(Calculo.getValorBrutoProdutos(), Calculo.getValorFrete()),
										Biblioteca.soma(Calculo.getValorSeguro(), Calculo.getValorOutrasDespesas())
									), Calculo.getValorDesconto()
								)
							);
						if (Calculo.getUfClienteCod() == Calculo.getUfEmissor())// se for uf diferente entre emissor e destinatario usar aliquota de transferencia
						{
							Calculo.setValorIcms(
								Biblioteca.divide(
										Biblioteca.multiplica(Calculo.getBaseCalculoIcms(), Calculo.getAliquotaIcms()), 
										BigDecimal.valueOf(100)
									)
							);
						}
						else
						{
							Calculo.setValorIcms(
								Biblioteca.divide(
										Biblioteca.multiplica(Calculo.getBaseCalculoIcms(), Calculo.getAliquotaIcmsInter()), 
										BigDecimal.valueOf(100)
									)
							);
						}
					}
				}// 3() - calculo icms proprio

				// calculo icms ST
				if (Calculo.getModalidadeBcIcmsSt() == "0")// preço Tabelado ou máximo Sugerido
				{
					// 
				}
				else if (Calculo.getModalidadeBcIcmsSt() == "1")// lista Negativa(valor)
				{
					// 
				}
				else if (Calculo.getModalidadeBcIcmsSt() == "2")// Lista Positiva(valor)
				{
					// 
				}
				else if (Calculo.getModalidadeBcIcmsSt() == "3")// Lista Neutra(valor)
				{
					// 
				}
				else if (Calculo.getModalidadeBcIcmsSt() == "4")// Margem valor Agregado(%)
				{
					Calculo.setBaseCalculoIcms(
							Biblioteca.subtrai(
								Biblioteca.soma(
									Biblioteca.soma(
										Biblioteca.soma(Calculo.getValorBrutoProdutos(), Calculo.getValorFrete()),
										Biblioteca.soma(Calculo.getValorSeguro(), Calculo.getValorOutrasDespesas())
									), Calculo.getValorIpi()
								), Calculo.getValorDesconto()
							)
						);

					Calculo.setBaseCalculoIcmsSt(
							Biblioteca.subtrai(
								Calculo.getBaseCalculoIcmsSt(),
								Biblioteca.divide(
									Biblioteca.multiplica(Calculo.getBaseCalculoIcmsSt(), Calculo.getPercentualMvaIcmsSt()),
									BigDecimal.valueOf(100)
								)
							)
						);					
					
					Calculo.setValorReducaoBcIcmsSt(
							Biblioteca.divide(
									Biblioteca.multiplica(Calculo.getBaseCalculoIcmsSt(), Calculo.getAliquotaIcmsSt()), 
									BigDecimal.valueOf(100)
								)
						);

					Calculo.setValorIcmsSt(
							Biblioteca.subtrai(Calculo.getValorIcms(), Calculo.getValorReducaoBcIcmsSt())
					);
					
				}
				else if (Calculo.getModalidadeBcIcmsSt() == "5")// Pauta(valor)
				{
					// 
				}// calculo icms ST
			}
			//endregion

			//region 'CST 20'
			else if (Calculo.getCstIcms() == "20") // 20 Com redução de base de cálculo do ICMS
			{
				// calcula icms
				if (Calculo.getModalidadeBcIcms() == "0")// Margem valor Agregado
				{
					// 
				}// 0
				else if (Calculo.getModalidadeBcIcms() == "1")// Pauta(Valor)
				{
					// 
				}// 1
				else if (Calculo.getModalidadeBcIcms() == "2")// preço Tabelado M?x.get(Valor)
				{
					// 
				}// 2
				else if (Calculo.getModalidadeBcIcms() == "3")// Valor da operação
				{
					if (Calculo.getTipoCliente() == "F") // pessoa fisica inclui ipi na base de calculo do icms
					{
						Calculo.setBaseCalculoIcms(
								Biblioteca.subtrai(
									Biblioteca.soma(
										Biblioteca.soma(
											Biblioteca.soma(Calculo.getValorBrutoProdutos(), Calculo.getValorFrete()),
											Biblioteca.soma(Calculo.getValorSeguro(), Calculo.getValorOutrasDespesas())
										), Calculo.getValorIpi()
									), Calculo.getValorDesconto()
								)
							);
												
						Calculo.setBaseCalculoIcms(
								Biblioteca.subtrai(
									Calculo.getBaseCalculoIcms(),
									Biblioteca.divide(
										Biblioteca.multiplica(Calculo.getBaseCalculoIcms(), Calculo.getTaxaReducaoBcIcms()),
										BigDecimal.valueOf(100)
									)
								)
							);					
						Calculo.setBaseCalculoIcms(
								Biblioteca.subtrai(Calculo.getBaseCalculoIcms(), Calculo.getValorReducaoBcIcms())
							);					
						
						Calculo.setValorIcms(
								Biblioteca.divide(
										Biblioteca.multiplica(Calculo.getBaseCalculoIcms(), Calculo.getAliquotaIcms()), //pessoa fisica sempre usa a aliquota normal da UF emissao
										BigDecimal.valueOf(100)
									)
							);
					}
					if (Calculo.getTipoCliente() == "J") // pessoa juridica não inclui ipi na base de calculo do icms
					{
						Calculo.setBaseCalculoIcms(
								Biblioteca.subtrai(
									Biblioteca.soma(
										Biblioteca.soma(Calculo.getValorBrutoProdutos(), Calculo.getValorFrete()),
										Biblioteca.soma(Calculo.getValorSeguro(), Calculo.getValorOutrasDespesas())
									), Calculo.getValorDesconto()
								)
							);
						Calculo.setValorReducaoBcIcms(
								Biblioteca.subtrai(
									Calculo.getBaseCalculoIcms(),
									Biblioteca.divide(
										Biblioteca.multiplica(Calculo.getBaseCalculoIcms(), Calculo.getTaxaReducaoBcIcms()),
										BigDecimal.valueOf(100)
									)
								)
							);					
						Calculo.setBaseCalculoIcms(
								Biblioteca.subtrai(Calculo.getBaseCalculoIcms(), Calculo.getValorReducaoBcIcms())
							);					

						if (Calculo.getUfClienteCod() == Calculo.getUfEmissor())// se for uf diferente entre emissor e destinatario usar aliquota de transferencia
						{
							Calculo.setValorIcms(
								Biblioteca.divide(
										Biblioteca.multiplica(Calculo.getBaseCalculoIcms(), Calculo.getAliquotaIcms()), 
										BigDecimal.valueOf(100)
									)
							);
						}
						else
						{
							Calculo.setValorIcms(
								Biblioteca.divide(
										Biblioteca.multiplica(Calculo.getBaseCalculoIcms(), Calculo.getAliquotaIcmsInter()), 
										BigDecimal.valueOf(100)
									)
							);
						}
					}
				}// 3
			}
			//endregion

			//region 'CST 30'
			else if (Calculo.getCstIcms() == "30") // 30 Isenta ou não tributada e com cobrança do ICMS por substituição tributária
			{
				// 
			}
			//endregion
			
			//region 'CST 40'
			else if (Calculo.getCstIcms() == "40") // 40 Isenta do ICMS
			{
				// 
			}
			//endregion
			
			//region 'CST 41'
			else if (Calculo.getCstIcms() == "41") // 41 Nao tributada no ICMS
			{
				// 
			}
			//endregion
			
			//region 'CST 50'
			else if (Calculo.getCstIcms() == "50") // 50 Suspensao do ICMS
			{
				// 
			}
			//endregion
			
			//region 'CST 51'
			else if (Calculo.getCstIcms() == "51") // 51 Diferimento do ICMS
			{
				// 
			}
			//endregion
			
			//region 'CST 60'
			else if (Calculo.getCstIcms() == "60") // 60 ICMS cobrado anteriormente por substituição tributária
			{
				// 
			}
			//endregion
			
			//region 'CST 70'
			else if (Calculo.getCstIcms() == "70") // 70 Com redução da base de cálculo e cobrança do ICMS por substituição tributária
			{
				// 
			}
			//endregion
			
			//region 'CST 90'
			else if (Calculo.getCstIcms() == "90") // 90 Outras
			{
				// 
			}
			//endregion

			// calcula pis/cofins
			//region 'PIS/COFINS'
			// calcula Pis 01
			if (Calculo.getCstPis() == "01") // tributável por aliquota Normal
			{
				Calculo.setBaseCalculoPis(
						Biblioteca.subtrai(
								Calculo.getValorBrutoProdutos()
								.add(Calculo.getValorFrete(), MathContext.DECIMAL64)
								.add(Calculo.getValorSeguro(), MathContext.DECIMAL64)
								.add(Calculo.getValorOutrasDespesas(), MathContext.DECIMAL64)
								.add(Calculo.getValorIcms(), MathContext.DECIMAL64)
								.add(Calculo.getValorIpi(), MathContext.DECIMAL64)								
								, Calculo.getValorDesconto()
						)
					);
				Calculo.setValorPis(
						Calculo.getBaseCalculoPis()
						.multiply(Calculo.getAliquotaPis(), MathContext.DECIMAL64)
						.divide(BigDecimal.valueOf(100))
					);
			}
			// calcula Pis 02
			if (Calculo.getCstPis() == "02") // tributável por aliquota diferenciada
			{
				Calculo.setBaseCalculoPis(
						Biblioteca.subtrai(
								Calculo.getValorBrutoProdutos()
								.add(Calculo.getValorFrete(), MathContext.DECIMAL64)
								.add(Calculo.getValorSeguro(), MathContext.DECIMAL64)
								.add(Calculo.getValorOutrasDespesas(), MathContext.DECIMAL64)
								.add(Calculo.getValorIcms(), MathContext.DECIMAL64)
								.add(Calculo.getValorIpi(), MathContext.DECIMAL64)								
								, Calculo.getValorDesconto()
						)
					);
				Calculo.setValorPis(
						Calculo.getBaseCalculoPis()
						.multiply(Calculo.getAliquotaPisReais(), MathContext.DECIMAL64)
						.divide(BigDecimal.valueOf(100))
					);
			}
			// calcula Cofins 01
			if (Calculo.getCstCofins() == "01") // tributável por aliquota Normal
			{
				Calculo.setBaseCalculoCofins(
						Calculo.getValorBrutoProdutos()
						.add(Calculo.getValorFrete(), MathContext.DECIMAL64)
						.add(Calculo.getValorSeguro(), MathContext.DECIMAL64)
						.add(Calculo.getValorOutrasDespesas(), MathContext.DECIMAL64)
						.add(Calculo.getValorIcms(), MathContext.DECIMAL64)
						.add(Calculo.getValorIpi(), MathContext.DECIMAL64)
						.subtract(Calculo.getValorDesconto())
					);
				Calculo.setValorCofins(
						Calculo.getBaseCalculoCofins()
						.multiply(Calculo.getAliquotaCofins(), MathContext.DECIMAL64)
						.divide(BigDecimal.valueOf(100))
					);
			}
			// calcula Cofins 02
			if (Calculo.getCstCofins() == "02") // tributável por aliquota diferenciada
			{
				Calculo.setBaseCalculoCofins(
						Calculo.getValorBrutoProdutos()
						.add(Calculo.getValorFrete(), MathContext.DECIMAL64)
						.add(Calculo.getValorSeguro(), MathContext.DECIMAL64)
						.add(Calculo.getValorOutrasDespesas(), MathContext.DECIMAL64)
						.add(Calculo.getValorIcms(), MathContext.DECIMAL64)
						.add(Calculo.getValorIpi(), MathContext.DECIMAL64)								
						.subtract(Calculo.getValorDesconto())
					);
				Calculo.setValorCofins(
						Calculo.getBaseCalculoCofins()
						.multiply(Calculo.getAliquotaCofinsReais(), MathContext.DECIMAL64)
						.divide(BigDecimal.valueOf(100))
					);
			}
			//endregion
		}// if Empresa.getCrt() = crtRegimeNormal or Empresa.getCrt() = crtSimplesExcessoReceita
		//endregion

		return Calculo;
	}
}