namespace T2TiERPFenix.Models
{
    public class CalculoNFe
    {
        public CalculoNFe() { }

		public int? CrtEmissor { get; set; }// emissor
		public int? UFemissor { get; set; }

		public string TipoCliente { get; set; }// cliente ou fornecedor
		public string UFCliente { get; set; }
		public int? UFClienteCod { get; set; }

		public System.Nullable<decimal> ValorBrutoProdutos { get; set; }// icms
		public System.Nullable<decimal> ValorFrete { get; set; }
		public System.Nullable<decimal> ValorSeguro { get; set; }
		public System.Nullable<decimal> ValorOutrasDespesas { get; set; }
		public System.Nullable<decimal> ValorDesconto { get; set; }
		public string CstIcms { get; set; }
		public string Csosn { get; set; }
		public string ModalidadeBcIcms { get; set; }
		public System.Nullable<decimal> BaseCalculoIcms { get; set; }
		public System.Nullable<decimal> TaxaReducaoBcIcms { get; set; }
		public System.Nullable<decimal> ValorReducaoBcIcms { get; set; }
		public System.Nullable<decimal> AliquotaIcms { get; set; }
		public System.Nullable<decimal> AliquotaIcmsInter { get; set; }
		public System.Nullable<decimal> ValorIcms { get; set; }

		public string ModalidadeBcIcmsSt { get; set; }// icms ST
		public System.Nullable<decimal> PercentualMvaIcmsSt { get; set; }
		public System.Nullable<decimal> BaseCalculoIcmsSt { get; set; }
		public System.Nullable<decimal> ReducaoBcIcmsSt { get; set; }
		public System.Nullable<decimal> ValorReducaoBcIcmsSt { get; set; }
		public System.Nullable<decimal> AliquotaIcmsSt { get; set; }
		public System.Nullable<decimal> ValorIcmsSt { get; set; }

		public System.Nullable<decimal> AliquotaCreditoIcmsSn { get; set; }// icms credito simples
		public System.Nullable<decimal> ValorCreditoIcmsSn { get; set; }

		public string CstIpi { get; set; }// ipi
		public System.Nullable<decimal> BaseCalculoIpi { get; set; }
		public System.Nullable<decimal> AliquotaIpi { get; set; }
		public System.Nullable<decimal> ValorIpi { get; set; }

		public string CstPis { get; set; }// pis
		public System.Nullable<decimal> BaseCalculoPis { get; set; }
		public System.Nullable<decimal> AliquotaPis { get; set; }
		public System.Nullable<decimal> AliquotaPisReais { get; set; }
		public System.Nullable<decimal> ValorPis { get; set; }

		public string CstCofins { get; set; }// cofins
		public System.Nullable<decimal> BaseCalculoCofins { get; set; }
		public System.Nullable<decimal> AliquotaCofins { get; set; }
		public System.Nullable<decimal> AliquotaCofinsReais { get; set; }
		public System.Nullable<decimal> ValorCofins { get; set; }

	}
}
