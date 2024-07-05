using System.Collections.Generic;

namespace T2TiRetaguardaSH.Models
{
	public class AdmModuloModel
	{	
		public int Id{ get; set; } 

		public string Codigo{ get; set; } 

		public string Bloco{ get; set; } 

		public string Nome{ get; set; } 

		public string Descricao{ get; set; } 

		public string Link{ get; set; } 

		public EmpresaModel EmpresaModel { get; set; } 

	}
}
