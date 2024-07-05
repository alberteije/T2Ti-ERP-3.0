/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DETALHE] 
                                                                                
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
using System.Collections.Generic;

namespace T2TiERPFenix.Models
{
    public class NfeDetalhe
    {	
		public int Id { get; set; }

		public int? NumeroItem { get; set; }

		public string CodigoProduto { get; set; }

		public string Gtin { get; set; }

		public string NomeProduto { get; set; }

		public string Ncm { get; set; }

		public string Nve { get; set; }

		public string Cest { get; set; }

		public string IndicadorEscalaRelevante { get; set; }

		public string CnpjFabricante { get; set; }

		public string CodigoBeneficioFiscal { get; set; }

		public int? ExTipi { get; set; }

		public int? Cfop { get; set; }

		public string UnidadeComercial { get; set; }

		public System.Nullable<System.Decimal> QuantidadeComercial { get; set; }

		public string NumeroPedidoCompra { get; set; }

		public int? ItemPedidoCompra { get; set; }

		public string NumeroFci { get; set; }

		public string NumeroRecopi { get; set; }

		public System.Nullable<System.Decimal> ValorUnitarioComercial { get; set; }

		public System.Nullable<System.Decimal> ValorBrutoProduto { get; set; }

		public string GtinUnidadeTributavel { get; set; }

		public string UnidadeTributavel { get; set; }

		public System.Nullable<System.Decimal> QuantidadeTributavel { get; set; }

		public System.Nullable<System.Decimal> ValorUnitarioTributavel { get; set; }

		public System.Nullable<System.Decimal> ValorFrete { get; set; }

		public System.Nullable<System.Decimal> ValorSeguro { get; set; }

		public System.Nullable<System.Decimal> ValorDesconto { get; set; }

		public System.Nullable<System.Decimal> ValorOutrasDespesas { get; set; }

		public string EntraTotal { get; set; }

		public System.Nullable<System.Decimal> ValorTotalTributos { get; set; }

		public System.Nullable<System.Decimal> PercentualDevolvido { get; set; }

		public System.Nullable<System.Decimal> ValorIpiDevolvido { get; set; }

		public string InformacoesAdicionais { get; set; }

		public System.Nullable<System.Decimal> ValorSubtotal { get; set; }

		public System.Nullable<System.Decimal> ValorTotal { get; set; }

		private NfeDetEspecificoCombustivel nfeDetEspecificoCombustivel;
		public NfeDetEspecificoCombustivel NfeDetEspecificoCombustivel
		{
			get
			{
				return nfeDetEspecificoCombustivel;
			}
			set
			{
				nfeDetEspecificoCombustivel = value;
				if (value != null)
				{
					nfeDetEspecificoCombustivel.NfeDetalhe = this;
				}
			}
		}

		private NfeDetEspecificoMedicamento nfeDetEspecificoMedicamento;
		public NfeDetEspecificoMedicamento NfeDetEspecificoMedicamento
		{
			get
			{
				return nfeDetEspecificoMedicamento;
			}
			set
			{
				nfeDetEspecificoMedicamento = value;
				if (value != null)
				{
					nfeDetEspecificoMedicamento.NfeDetalhe = this;
				}
			}
		}

		private NfeDetEspecificoVeiculo nfeDetEspecificoVeiculo;
		public NfeDetEspecificoVeiculo NfeDetEspecificoVeiculo
		{
			get
			{
				return nfeDetEspecificoVeiculo;
			}
			set
			{
				nfeDetEspecificoVeiculo = value;
				if (value != null)
				{
					nfeDetEspecificoVeiculo.NfeDetalhe = this;
				}
			}
		}

		private NfeDetalheImpostoCofins nfeDetalheImpostoCofins;
		public NfeDetalheImpostoCofins NfeDetalheImpostoCofins
		{
			get
			{
				return nfeDetalheImpostoCofins;
			}
			set
			{
				nfeDetalheImpostoCofins = value;
				if (value != null)
				{
					nfeDetalheImpostoCofins.NfeDetalhe = this;
				}
			}
		}

		private NfeDetalheImpostoCofinsSt nfeDetalheImpostoCofinsSt;
		public NfeDetalheImpostoCofinsSt NfeDetalheImpostoCofinsSt
		{
			get
			{
				return nfeDetalheImpostoCofinsSt;
			}
			set
			{
				nfeDetalheImpostoCofinsSt = value;
				if (value != null)
				{
					nfeDetalheImpostoCofinsSt.NfeDetalhe = this;
				}
			}
		}

		private NfeDetalheImpostoIcms nfeDetalheImpostoIcms;
		public NfeDetalheImpostoIcms NfeDetalheImpostoIcms
		{
			get
			{
				return nfeDetalheImpostoIcms;
			}
			set
			{
				nfeDetalheImpostoIcms = value;
				if (value != null)
				{
					nfeDetalheImpostoIcms.NfeDetalhe = this;
				}
			}
		}

		private NfeDetalheImpostoIcmsUfdest nfeDetalheImpostoIcmsUfdest;
		public NfeDetalheImpostoIcmsUfdest NfeDetalheImpostoIcmsUfdest
		{
			get
			{
				return nfeDetalheImpostoIcmsUfdest;
			}
			set
			{
				nfeDetalheImpostoIcmsUfdest = value;
				if (value != null)
				{
					nfeDetalheImpostoIcmsUfdest.NfeDetalhe = this;
				}
			}
		}

		private NfeDetalheImpostoIi nfeDetalheImpostoIi;
		public NfeDetalheImpostoIi NfeDetalheImpostoIi
		{
			get
			{
				return nfeDetalheImpostoIi;
			}
			set
			{
				nfeDetalheImpostoIi = value;
				if (value != null)
				{
					nfeDetalheImpostoIi.NfeDetalhe = this;
				}
			}
		}

		private NfeDetalheImpostoIpi nfeDetalheImpostoIpi;
		public NfeDetalheImpostoIpi NfeDetalheImpostoIpi
		{
			get
			{
				return nfeDetalheImpostoIpi;
			}
			set
			{
				nfeDetalheImpostoIpi = value;
				if (value != null)
				{
					nfeDetalheImpostoIpi.NfeDetalhe = this;
				}
			}
		}

		private NfeDetalheImpostoIssqn nfeDetalheImpostoIssqn;
		public NfeDetalheImpostoIssqn NfeDetalheImpostoIssqn
		{
			get
			{
				return nfeDetalheImpostoIssqn;
			}
			set
			{
				nfeDetalheImpostoIssqn = value;
				if (value != null)
				{
					nfeDetalheImpostoIssqn.NfeDetalhe = this;
				}
			}
		}

		private NfeDetalheImpostoPis nfeDetalheImpostoPis;
		public NfeDetalheImpostoPis NfeDetalheImpostoPis
		{
			get
			{
				return nfeDetalheImpostoPis;
			}
			set
			{
				nfeDetalheImpostoPis = value;
				if (value != null)
				{
					nfeDetalheImpostoPis.NfeDetalhe = this;
				}
			}
		}

		private NfeDetalheImpostoPisSt nfeDetalheImpostoPisSt;
		public NfeDetalheImpostoPisSt NfeDetalheImpostoPisSt
		{
			get
			{
				return nfeDetalheImpostoPisSt;
			}
			set
			{
				nfeDetalheImpostoPisSt = value;
				if (value != null)
				{
					nfeDetalheImpostoPisSt.NfeDetalhe = this;
				}
			}
		}

		public NfeCabecalho NfeCabecalho { get; set; }

		public Produto Produto { get; set; }

		private IList<NfeDeclaracaoImportacao> listaNfeDeclaracaoImportacao;
		public IList<NfeDeclaracaoImportacao> ListaNfeDeclaracaoImportacao
		{
			get
			{
				return listaNfeDeclaracaoImportacao;
			}
			set
			{
				if (value != null)
				{
					listaNfeDeclaracaoImportacao = value;
					foreach (NfeDeclaracaoImportacao nfeDeclaracaoImportacao in listaNfeDeclaracaoImportacao)
					{
						nfeDeclaracaoImportacao.NfeDetalhe = this;
					}
				}
			}
		}

		private IList<NfeDetEspecificoArmamento> listaNfeDetEspecificoArmamento;
		public IList<NfeDetEspecificoArmamento> ListaNfeDetEspecificoArmamento
		{
			get
			{
				return listaNfeDetEspecificoArmamento;
			}
			set
			{
				if (value != null)
				{
					listaNfeDetEspecificoArmamento = value;
					foreach (NfeDetEspecificoArmamento nfeDetEspecificoArmamento in listaNfeDetEspecificoArmamento)
					{
						nfeDetEspecificoArmamento.NfeDetalhe = this;
					}
				}
			}
		}

		private IList<NfeExportacao> listaNfeExportacao;
		public IList<NfeExportacao> ListaNfeExportacao
		{
			get
			{
				return listaNfeExportacao;
			}
			set
			{
				if (value != null)
				{
					listaNfeExportacao = value;
					foreach (NfeExportacao nfeExportacao in listaNfeExportacao)
					{
						nfeExportacao.NfeDetalhe = this;
					}
				}
			}
		}

		private IList<NfeItemRastreado> listaNfeItemRastreado;
		public IList<NfeItemRastreado> ListaNfeItemRastreado
		{
			get
			{
				return listaNfeItemRastreado;
			}
			set
			{
				if (value != null)
				{
					listaNfeItemRastreado = value;
					foreach (NfeItemRastreado nfeItemRastreado in listaNfeItemRastreado)
					{
						nfeItemRastreado.NfeDetalhe = this;
					}
				}
			}
		}

    }
}
