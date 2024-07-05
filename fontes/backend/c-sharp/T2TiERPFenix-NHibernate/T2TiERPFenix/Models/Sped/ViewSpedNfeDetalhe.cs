/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VIEW_SPED_NFE_DETALHE] 
                                                                                
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

namespace T2TiERPFenix.Models
{
    public class ViewSpedNfeDetalhe
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

		public string CstCofins { get; set; }

		public System.Nullable<System.Decimal> QuantidadeVendidaCofins { get; set; }

		public System.Nullable<System.Decimal> BaseCalculoCofins { get; set; }

		public System.Nullable<System.Decimal> AliquotaCofinsPercentual { get; set; }

		public System.Nullable<System.Decimal> AliquotaCofinsReais { get; set; }

		public System.Nullable<System.Decimal> ValorCofins { get; set; }

		public string OrigemMercadoria { get; set; }

		public string CstIcms { get; set; }

		public string Csosn { get; set; }

		public string ModalidadeBcIcms { get; set; }

		public System.Nullable<System.Decimal> PercentualReducaoBcIcms { get; set; }

		public System.Nullable<System.Decimal> ValorBcIcms { get; set; }

		public System.Nullable<System.Decimal> AliquotaIcms { get; set; }

		public System.Nullable<System.Decimal> ValorIcms { get; set; }

		public string MotivoDesoneracaoIcms { get; set; }

		public string ModalidadeBcIcmsSt { get; set; }

		public System.Nullable<System.Decimal> PercentualMvaIcmsSt { get; set; }

		public System.Nullable<System.Decimal> PercentualReducaoBcIcmsSt { get; set; }

		public System.Nullable<System.Decimal> ValorBaseCalculoIcmsSt { get; set; }

		public System.Nullable<System.Decimal> AliquotaIcmsSt { get; set; }

		public System.Nullable<System.Decimal> ValorIcmsSt { get; set; }

		public System.Nullable<System.Decimal> ValorBcIcmsStRetido { get; set; }

		public System.Nullable<System.Decimal> ValorIcmsStRetido { get; set; }

		public System.Nullable<System.Decimal> ValorBcIcmsStDestino { get; set; }

		public System.Nullable<System.Decimal> ValorIcmsStDestino { get; set; }

		public System.Nullable<System.Decimal> AliquotaCreditoIcmsSn { get; set; }

		public System.Nullable<System.Decimal> ValorCreditoIcmsSn { get; set; }

		public System.Nullable<System.Decimal> PercentualBcOperacaoPropria { get; set; }

		public string UfSt { get; set; }

		public System.Nullable<System.Decimal> ValorBcIi { get; set; }

		public System.Nullable<System.Decimal> ValorDespesasAduaneiras { get; set; }

		public System.Nullable<System.Decimal> ValorImpostoImportacao { get; set; }

		public System.Nullable<System.Decimal> ValorIof { get; set; }

		public string CnpjProdutor { get; set; }

		public string CodigoSeloIpi { get; set; }

		public int? QuantidadeSeloIpi { get; set; }

		public string EnquadramentoLegalIpi { get; set; }

		public string CstIpi { get; set; }

		public System.Nullable<System.Decimal> ValorBaseCalculoIpi { get; set; }

		public System.Nullable<System.Decimal> AliquotaIpi { get; set; }

		public System.Nullable<System.Decimal> QuantidadeUnidadeTributavel { get; set; }

		public System.Nullable<System.Decimal> ValorUnidadeTributavel { get; set; }

		public System.Nullable<System.Decimal> ValorIpi { get; set; }

		public System.Nullable<System.Decimal> BaseCalculoIssqn { get; set; }

		public System.Nullable<System.Decimal> AliquotaIssqn { get; set; }

		public System.Nullable<System.Decimal> ValorIssqn { get; set; }

		public int? MunicipioIssqn { get; set; }

		public int? ItemListaServicos { get; set; }

		public string CstPis { get; set; }

		public System.Nullable<System.Decimal> QuantidadeVendidaPis { get; set; }

		public System.Nullable<System.Decimal> ValorBaseCalculoPis { get; set; }

		public System.Nullable<System.Decimal> AliquotaPisPercentual { get; set; }

		public System.Nullable<System.Decimal> AliquotaPisReais { get; set; }

		public System.Nullable<System.Decimal> ValorPis { get; set; }

		public NfeCabecalho NfeCabecalho { get; set; }

		public Produto Produto { get; set; }

		public TributOperacaoFiscal TributOperacaoFiscal { get; set; }

		public ProdutoUnidade ProdutoUnidade { get; set; }

    }
}
