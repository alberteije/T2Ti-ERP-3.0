using System.Collections.Generic;

namespace T2TiRetaguardaSH.Models
{
	public class ErpTipoPlanoModel
	{	
		public int Id{ get; set; } 

		public string Nome{ get; set; } 

		public System.Nullable<System.Decimal> Valor{ get; set; } 

		public string Frequencia{ get; set; } 

		public bool AcessoTotal{ get; set; } 

		public bool Ativo{ get; set; } 

	}
}
