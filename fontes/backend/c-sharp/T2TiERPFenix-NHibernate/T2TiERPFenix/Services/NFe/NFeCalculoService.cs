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

using System;
using T2TiERPFenix.Models;
using T2TiERPFenix.Util;

namespace T2TiERPFenix.Services
{

	public static class NFeCalculoService
	{

		public static CalculoNFe Calcular(CalculoNFe pCalculoNFe)
		{
			CalculoNFe Calculo = pCalculoNFe;

			try
			{

				// empresa emissora do simples
				#region 'Empresa do Simples'
				if (Calculo.CrtEmissor == 1)
				{
					// calculos do simples nacional
					#region 'CSOSN 101'
					if (Calculo.Csosn == "101") // 101 Tributada pelo Simples Nacional com permissão de crédito
					{
						Calculo.BaseCalculoIcms = ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
														Calculo.ValorOutrasDespesas) - Calculo.ValorDesconto);
						Calculo.ValorCreditoIcmsSn = ((Calculo.BaseCalculoIcms * Calculo.AliquotaCreditoIcmsSn) / 100);
						Calculo.ValorCreditoIcmsSn = Biblioteca.ArredondaTruncaValor("A", Calculo.ValorCreditoIcmsSn, 2);
					}
					#endregion
					#region 'CSOSN 102'
					else if (Calculo.Csosn == "102") // 102 Tributada pelo Simples Nacional sem permissão de crédito
					{
						// não tem calculo
					}
					#endregion
					#region 'CSOSN 103'
					else if (Calculo.Csosn == "103") // 103 isenção do ICMS no Simples Nacional para faixa de receita bruta
					{
						// não tem calculo
					}
					#endregion
					#region 'CSOSN 201'
					else if (Calculo.Csosn == "201") // 201 Tributada pelo Simples Nacional com permissão de crédito e com cobrança do ICMS por substituição tributária
					{
						// calculo icms proprio
						Calculo.BaseCalculoIcms = ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
														Calculo.ValorOutrasDespesas) - Calculo.ValorDesconto);
						if (Calculo.UFClienteCod == Calculo.UFemissor)// se for uf diferente entre emissor e destinatario usar aliquota de transferencia
							Calculo.ValorIcms = ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcms) / 100);
						else
							Calculo.ValorIcms = ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcmsInter) / 100);

						Calculo.ValorIcms = Biblioteca.ArredondaTruncaValor("A", Calculo.ValorIcms, 2);

						Calculo.ValorCreditoIcmsSn = ((Calculo.BaseCalculoIcms * Calculo.AliquotaCreditoIcmsSn) / 100);
						Calculo.ValorCreditoIcmsSn = Biblioteca.ArredondaTruncaValor("A", Calculo.ValorCreditoIcmsSn, 2);

						// calculo icms proprio
						// calculo icms ST
						if (Calculo.ModalidadeBcIcmsSt == "0")// preço Tabelado ou máximo Sugerido
						{
							// 
						}
						else if (Calculo.ModalidadeBcIcmsSt == "1")// lista Negativa(valor)
						{
							// 
						}
						else if (Calculo.ModalidadeBcIcmsSt == "2")// Lista Positiva(valor)
						{
							// 
						}
						else if (Calculo.ModalidadeBcIcmsSt == "3")// Lista Neutra(valor)
						{
							// 
						}
						else if (Calculo.ModalidadeBcIcmsSt == "4")// Margem valor Agregado(%)
						{
							Calculo.BaseCalculoIcmsSt = ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
														 Calculo.ValorOutrasDespesas) - Calculo.ValorDesconto);
							Calculo.BaseCalculoIcmsSt = (Calculo.BaseCalculoIcmsSt - ((Calculo.BaseCalculoIcmsSt * Calculo.PercentualMvaIcmsSt) / 100));
							Calculo.BaseCalculoIcmsSt = Biblioteca.ArredondaTruncaValor("A", Calculo.BaseCalculoIcmsSt, 2);
							Calculo.ValorReducaoBcIcmsSt = ((Calculo.BaseCalculoIcmsSt * Calculo.AliquotaIcmsSt) / 100);
							Calculo.ValorReducaoBcIcmsSt = Biblioteca.ArredondaTruncaValor("A", Calculo.ValorReducaoBcIcmsSt, 2);
							Calculo.ValorIcmsSt = Calculo.ValorIcms - Calculo.ValorReducaoBcIcmsSt;
						}
						else if (Calculo.ModalidadeBcIcmsSt == "5")// Pauta(valor)
						{
							// 
						}// calculo icms ST
					}
					#endregion
					#region 'CSOSN 202'
					else if (Calculo.Csosn == "202") // 202 Tributada pelo Simples Nacional sem permissão de crédito e com cobrança do ICMS por substituição tributária
					{
						// calculo icms proprio
						Calculo.BaseCalculoIcms = ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
														Calculo.ValorOutrasDespesas) - Calculo.ValorDesconto);
						if (Calculo.UFClienteCod == Calculo.UFemissor)// se for uf diferente entre emissor e destinatario usar aliquota de transferencia
							Calculo.ValorIcms = ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcms) / 100);
						else
							Calculo.ValorIcms = ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcmsInter) / 100);

						Calculo.ValorIcms = Biblioteca.ArredondaTruncaValor("A", Calculo.ValorIcms, 2);

						// calculo icms proprio
						// calculo icms ST
						if (Calculo.ModalidadeBcIcmsSt == "0")// preço Tabelado ou máximo Sugerido
						{
							// 
						}
						else if (Calculo.ModalidadeBcIcmsSt == "1")// lista Negativa(valor)
						{
							// 
						}
						else if (Calculo.ModalidadeBcIcmsSt == "2")// Lista Positiva(valor)
						{
							// 
						}
						else if (Calculo.ModalidadeBcIcmsSt == "3")// Lista Neutra(valor)
						{
							// 
						}
						else if (Calculo.ModalidadeBcIcmsSt == "4")// Margem valor Agregado(%)
						{
							Calculo.BaseCalculoIcmsSt = ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
															  Calculo.ValorOutrasDespesas) - Calculo.ValorDesconto);
							Calculo.BaseCalculoIcmsSt = (Calculo.BaseCalculoIcmsSt - ((Calculo.BaseCalculoIcmsSt * Calculo.PercentualMvaIcmsSt) / 100));
							Calculo.BaseCalculoIcmsSt = Biblioteca.ArredondaTruncaValor("A", Calculo.BaseCalculoIcmsSt, 2);
							Calculo.ValorReducaoBcIcmsSt = ((Calculo.BaseCalculoIcmsSt * Calculo.AliquotaIcmsSt) / 100);
							Calculo.ValorReducaoBcIcmsSt = Biblioteca.ArredondaTruncaValor("A", Calculo.ValorReducaoBcIcmsSt, 2);
							Calculo.ValorIcmsSt = Calculo.ValorIcms - Calculo.ValorReducaoBcIcmsSt;
						}
						else if (Calculo.ModalidadeBcIcmsSt == "5")// Pauta(valor)
						{
							// 
						}// calculo icms ST
					}
					#endregion
					#region 'CSOSN 203'
					else if (Calculo.Csosn == "203") // 203 Tributada pelo Simples Nacional sem permissão de crédito e com cobrança do ICMS por substituição tributária
					{
						// calculo icms proprio
						Calculo.BaseCalculoIcms = ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
														Calculo.ValorOutrasDespesas) - Calculo.ValorDesconto);
						if (Calculo.UFClienteCod == Calculo.UFemissor)// se for uf diferente entre emissor e destinatario usar aliquota de transferencia
							Calculo.ValorIcms = ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcms) / 100);
						else
							Calculo.ValorIcms = ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcmsInter) / 100);

						Calculo.ValorIcms = Biblioteca.ArredondaTruncaValor("A", Calculo.ValorIcms, 2);

						// calculo icms proprio
						// calculo icms ST
						if (Calculo.ModalidadeBcIcmsSt == "0")// preço Tabelado ou máximo Sugerido
						{
							// 
						}
						else if (Calculo.ModalidadeBcIcmsSt == "1")// lista Negativa(valor)
						{
							// 
						}
						else if (Calculo.ModalidadeBcIcmsSt == "2")// Lista Positiva(valor)
						{
							// 
						}
						else if (Calculo.ModalidadeBcIcmsSt == "3")// Lista Neutra(valor)
						{
							// 
						}
						else if (Calculo.ModalidadeBcIcmsSt == "4")// Margem valor Agregado(%)
						{
							Calculo.BaseCalculoIcmsSt = ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
														 Calculo.ValorOutrasDespesas) - Calculo.ValorDesconto);
							Calculo.BaseCalculoIcmsSt = (Calculo.BaseCalculoIcmsSt - ((Calculo.BaseCalculoIcmsSt * Calculo.PercentualMvaIcmsSt) / 100));
							Calculo.BaseCalculoIcmsSt = Biblioteca.ArredondaTruncaValor("A", Calculo.BaseCalculoIcmsSt, 2);
							Calculo.ValorReducaoBcIcmsSt = ((Calculo.BaseCalculoIcmsSt * Calculo.AliquotaIcmsSt) / 100);
							Calculo.ValorReducaoBcIcmsSt = Biblioteca.ArredondaTruncaValor("A", Calculo.ValorReducaoBcIcmsSt, 2);
							Calculo.ValorIcmsSt = Calculo.ValorIcms - Calculo.ValorReducaoBcIcmsSt;
						}
						else if (Calculo.ModalidadeBcIcmsSt == "5")// Pauta(valor)
						{
							// 
						}// calculo icms ST
					}
					#endregion
					#region 'CSOSN 300'
					else if (Calculo.Csosn == "300") // 300 Imune - Classificam-se neste código as operações praticadas por optantes pelo Simples Nacional contempladas com imunidade do ICMS
					{
						// não tem calculo
					}
					#endregion
					#region 'CSOSN 400'
					else if (Calculo.Csosn == "400") // 400 N?o tributada pelo Simples Nacional - Classificam-se neste código as operações praticadas por optantes pelo Simples Nacional não sujeitas ? tributa??o pelo ICMS dentro do Simples Nacional
					{
						// não tem calculo
					}
					#endregion
					#region 'CSOSN 500'
					else if (Calculo.Csosn == "500") // 500 ICMS cobrado anteriormente por substituição tributária (substituído) ou por antecipação - Classificam-se neste código as operações sujeitas exclusivamente ao regime de substituição tributária na condição de substituído tributário ou no caso de antecipações
					{
						// não tem calculo
					}
					#endregion
					#region 'CSOSN 900'
					else if (Calculo.Csosn == "900") // 900 Outros - Classificam-se neste código as demais operações que não se enquadrem nos códigos 101, 102, 103, 201, 202, 203, 300, 400 e 500
					{
						// 
					}
					#endregion
				}// if Empresa.Crt = crtSimplesNacional
				#endregion

				// empresas do regime normal e excesso de receita
				#region 'Empresa do Regime normal e execesso de receita'
				if ((Calculo.CrtEmissor == 2) || (Calculo.CrtEmissor == 3))
				{
					// convert UF do cliente para codigo para comparar com cod uf emitente
					Calculo.UFClienteCod = Biblioteca.UFToInt(Calculo.UFCliente);
					// aqui definir a aliquota do icms proprio ou inter estatual

					// calcula ipi
					#region 'IPI'
					if ((Calculo.CstIpi == "00") ||
					   (Calculo.CstIpi == "49") ||
					   (Calculo.CstIpi == "50") ||
					   (Calculo.CstIpi == "99"))
					{
						Calculo.BaseCalculoIpi = ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro + Calculo.ValorOutrasDespesas) - Calculo.ValorDesconto);
						Calculo.ValorIpi = ((Calculo.BaseCalculoIpi * Calculo.AliquotaIpi) / 100);
						Calculo.ValorIpi = Biblioteca.ArredondaTruncaValor("A", Calculo.ValorIpi, 2);
					}
					else
					{
						Calculo.BaseCalculoIpi = 0;
						Calculo.ValorIpi = 0;
					}
					#endregion

					// calcula icms
					#region 'CST 00'
					if (Calculo.CstIcms == "00") // 00 Tributada integralmente
					{
						// calcula icms
						if (Calculo.ModalidadeBcIcms == "0")// Margem valor Agregado
						{
							// 
						}// 0
						else if (Calculo.ModalidadeBcIcms == "1")// Pauta(Valor)
						{
							// 
						}// 1
						else if (Calculo.ModalidadeBcIcms == "2")// preço Tabelado M?x.(Valor)
						{
							// 
						}// 2
						else if (Calculo.ModalidadeBcIcms == "3")// Valor da operação
						{
							if (Calculo.TipoCliente == "F") // pessoa fisica inclui ipi na base de calculo do icms
							{
								Calculo.BaseCalculoIcms = ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
															   Calculo.ValorOutrasDespesas + Calculo.ValorIpi) - Calculo.ValorDesconto);
								Calculo.ValorIcms = ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcms) / 100);// pessoa fisica sempre usa a aliquota normal da UF emissao
							}
							if (Calculo.TipoCliente == "J") // pessoa juridica não inclui ipi na base de calculo do icms
							{
								Calculo.BaseCalculoIcms = ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
															   Calculo.ValorOutrasDespesas) - Calculo.ValorDesconto);// pessoa juridica nao inclui ipi na base de calculo
								if (Calculo.UFClienteCod == Calculo.UFemissor)// se for uf diferente entre emissor e destinatario usar aliquota de transferencia
									Calculo.ValorIcms = ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcms) / 100);
								else
									Calculo.ValorIcms = ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcmsInter) / 100);
							}
							Calculo.ValorIcms = Biblioteca.ArredondaTruncaValor("A", Calculo.ValorIcms, 2);
						}// 3
					}
					#endregion
					#region 'CST 10'
					else if (Calculo.CstIcms == "10") // 10 Tributada e com cobrança do ICMS por substituição tributária
					{
						// calculo icms proprio
						if (Calculo.ModalidadeBcIcms == "0")// Margem valor Agregado
						{
							// 
						}// 0
						else if (Calculo.ModalidadeBcIcms == "1")// Pauta(Valor)
						{
							// 
						}// 1
						else if (Calculo.ModalidadeBcIcms == "2")// preço Tabelado Máx.(Valor)
						{
							// 
						}// 2
						else if (Calculo.ModalidadeBcIcms == "3")// Valor da operação
						{
							if (Calculo.TipoCliente == "F") // pessoa fisica inclui ipi na base de calculo do icms
							{
								Calculo.BaseCalculoIcms = ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
															   Calculo.ValorOutrasDespesas + Calculo.ValorIpi) - Calculo.ValorDesconto);
								Calculo.ValorIcms = ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcms) / 100);// pessoa fisica sempre usa a aliquota normal da UF emissao
							}
							if (Calculo.TipoCliente == "J") // pessoa juridica não inclui ipi na base de calculo do icms
							{
								Calculo.BaseCalculoIcms = ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
															   Calculo.ValorOutrasDespesas) - Calculo.ValorDesconto);// pessoa juridica nao inclui ipi na base de calculo
								if (Calculo.UFClienteCod == Calculo.UFemissor)// se for uf diferente entre emissor e destinatario usar aliquota de transferencia
									Calculo.ValorIcms = ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcms) / 100);
								else
									Calculo.ValorIcms = ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcmsInter) / 100);
							}
							Calculo.ValorIcms = Biblioteca.ArredondaTruncaValor("A", Calculo.ValorIcms, 2);
						}// 3 - calculo icms proprio

						// calculo icms ST
						if (Calculo.ModalidadeBcIcmsSt == "0")// preço Tabelado ou máximo Sugerido
						{
							// 
						}
						else if (Calculo.ModalidadeBcIcmsSt == "1")// lista Negativa(valor)
						{
							// 
						}
						else if (Calculo.ModalidadeBcIcmsSt == "2")// Lista Positiva(valor)
						{
							// 
						}
						else if (Calculo.ModalidadeBcIcmsSt == "3")// Lista Neutra(valor)
						{
							// 
						}
						else if (Calculo.ModalidadeBcIcmsSt == "4")// Margem valor Agregado(%)
						{
							Calculo.BaseCalculoIcmsSt = ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
															  Calculo.ValorOutrasDespesas + Calculo.ValorIpi) - Calculo.ValorDesconto);
							Calculo.BaseCalculoIcmsSt = (Calculo.BaseCalculoIcmsSt - ((Calculo.BaseCalculoIcmsSt * Calculo.PercentualMvaIcmsSt) / 100));
							Calculo.BaseCalculoIcmsSt = Biblioteca.ArredondaTruncaValor("A", Calculo.BaseCalculoIcmsSt, 2);
							Calculo.ValorReducaoBcIcmsSt = ((Calculo.BaseCalculoIcmsSt * Calculo.AliquotaIcmsSt) / 100);
							Calculo.ValorReducaoBcIcmsSt = Biblioteca.ArredondaTruncaValor("A", Calculo.ValorReducaoBcIcmsSt, 2);
							Calculo.ValorIcmsSt = Calculo.ValorIcms - Calculo.ValorReducaoBcIcmsSt;
						}
						else if (Calculo.ModalidadeBcIcmsSt == "5")// Pauta(valor)
						{
							// 
						}// calculo icms ST
					}
					#endregion
					#region 'CST 20'
					else if (Calculo.CstIcms == "20") // 20 Com redução de base de cálculo do ICMS
					{
						// calcula icms
						if (Calculo.ModalidadeBcIcms == "0")// Margem valor Agregado
						{
							// 
						}// 0
						else if (Calculo.ModalidadeBcIcms == "1")// Pauta(Valor)
						{
							// 
						}// 1
						else if (Calculo.ModalidadeBcIcms == "2")// preço Tabelado M?x.(Valor)
						{
							// 
						}// 2
						else if (Calculo.ModalidadeBcIcms == "3")// Valor da operação
						{
							if (Calculo.TipoCliente == "F") // pessoa fisica inclui ipi na base de calculo do icms
							{
								Calculo.BaseCalculoIcms = ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
															Calculo.ValorOutrasDespesas + Calculo.ValorIpi) - Calculo.ValorDesconto);
								Calculo.ValorReducaoBcIcms = (Calculo.BaseCalculoIcms - ((Calculo.BaseCalculoIcms * Calculo.TaxaReducaoBcIcms) / 100));
								Calculo.ValorReducaoBcIcms = Biblioteca.ArredondaTruncaValor("A", Calculo.ValorReducaoBcIcmsSt, 2);
								Calculo.BaseCalculoIcms = Calculo.BaseCalculoIcms - Calculo.ValorReducaoBcIcms;
								Calculo.ValorIcms = ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcms) / 100);// pessoa fisica sempre usa a aliquota normal da UF emissao
								Calculo.ValorIcms = Biblioteca.ArredondaTruncaValor("A", Calculo.ValorIcms, 2);
							}
							if (Calculo.TipoCliente == "J") // pessoa juridica não inclui ipi na base de calculo do icms
							{
								Calculo.BaseCalculoIcms = ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
															Calculo.ValorOutrasDespesas) - Calculo.ValorDesconto);// pessoa juridica nao inclui ipi na base de calculo
								Calculo.ValorReducaoBcIcms = (Calculo.BaseCalculoIcms - ((Calculo.BaseCalculoIcms * Calculo.TaxaReducaoBcIcms) / 100));
								Calculo.ValorReducaoBcIcms = Biblioteca.ArredondaTruncaValor("A", Calculo.ValorReducaoBcIcmsSt, 2);
								Calculo.BaseCalculoIcms = Calculo.BaseCalculoIcms - Calculo.ValorReducaoBcIcms;
								if (Calculo.UFClienteCod == Calculo.UFemissor)// se for uf diferente entre emissor e destinatario usar aliquota de transferencia
									Calculo.ValorIcms = ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcms) / 100);
								else
									Calculo.ValorIcms = ((Calculo.BaseCalculoIcms * Calculo.AliquotaIcmsInter) / 100);
								Calculo.ValorIcms = Biblioteca.ArredondaTruncaValor("A", Calculo.ValorIcms, 2);
							}
						}// 3
					}
					#endregion
					#region 'CST 30'
					else if (Calculo.CstIcms == "30") // 30 Isenta ou não tributada e com cobrança do ICMS por substituição tributária
					{
						// 
					}
					#endregion
					#region 'CST 40'
					else if (Calculo.CstIcms == "40") // 40 Isenta do ICMS
					{
						// 
					}
					#endregion
					#region 'CST 41'
					else if (Calculo.CstIcms == "41") // 41 Nao tributada no ICMS
					{
						// 
					}
					#endregion
					#region 'CST 50'
					else if (Calculo.CstIcms == "50") // 50 Suspensao do ICMS
					{
						// 
					}
					#endregion
					#region 'CST 51'
					else if (Calculo.CstIcms == "51") // 51 Diferimento do ICMS
					{
						// 
					}
					#endregion
					#region 'CST 60'
					else if (Calculo.CstIcms == "60") // 60 ICMS cobrado anteriormente por substituição tributária
					{
						// 
					}
					#endregion
					#region 'CST 70'
					else if (Calculo.CstIcms == "70") // 70 Com redução da base de cálculo e cobrança do ICMS por substituição tributária
					{
						// 
					}
					#endregion
					#region 'CST 90'
					else if (Calculo.CstIcms == "90") // 90 Outras
					{
						// 
					}
					#endregion

					// calcula pis/cofins
					#region 'PIS/COFINS'
					// calcula Pis 01
					if (Calculo.CstPis == "01") // tributável por aliquota Normal
					{
						Calculo.BaseCalculoPis = ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
												  Calculo.ValorOutrasDespesas + Calculo.ValorIcms + Calculo.ValorIpi) - Calculo.ValorDesconto);
						Calculo.ValorPis = ((Calculo.BaseCalculoPis * Calculo.AliquotaPis) / 100);
						Calculo.ValorPis = Biblioteca.ArredondaTruncaValor("A", Calculo.ValorPis, 2);
					}
					// calcula Pis 02
					if (Calculo.CstPis == "02") // tributável por aliquota diferenciada
					{
						Calculo.BaseCalculoPis = ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
														Calculo.ValorOutrasDespesas + Calculo.ValorIcms + Calculo.ValorIpi) - Calculo.ValorDesconto);
						Calculo.ValorPis = (Calculo.BaseCalculoPis * Calculo.AliquotaPisReais);// ver formula 02
						Calculo.ValorPis = Biblioteca.ArredondaTruncaValor("A", Calculo.ValorPis, 2);
					}
					// calcula Cofins 01
					if (Calculo.CstCofins == "01") // tributável por aliquota Normal
					{
						Calculo.BaseCalculoCofins = ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
													 Calculo.ValorOutrasDespesas + Calculo.ValorIcms + Calculo.ValorIpi) - Calculo.ValorDesconto);
						Calculo.ValorCofins = ((Calculo.BaseCalculoCofins * Calculo.AliquotaCofins) / 100);
						Calculo.ValorCofins = Biblioteca.ArredondaTruncaValor("A", Calculo.ValorCofins, 2);
					}
					// calcula Cofins 02
					if (Calculo.CstCofins == "02") // tributável por aliquota diferenciada
					{
						Calculo.BaseCalculoCofins = ((Calculo.ValorBrutoProdutos + Calculo.ValorFrete + Calculo.ValorSeguro +
													 Calculo.ValorOutrasDespesas + Calculo.ValorIcms + Calculo.ValorIpi) - Calculo.ValorDesconto);
						Calculo.ValorCofins = (Calculo.BaseCalculoCofins * Calculo.AliquotaCofinsReais);// ver formula 02
						Calculo.ValorCofins = Biblioteca.ArredondaTruncaValor("A", Calculo.ValorCofins, 2);
					}
					#endregion
				}// if Empresa.Crt = crtRegimeNormal or Empresa.Crt = crtSimplesExcessoReceita
				#endregion

				return Calculo;
			}
			finally
			{
			}
		}
	}

}