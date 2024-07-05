using System.Collections.Generic;

namespace T2TiRetaguardaSH.Models
{
	public class EmpresaModel
	{	
		public int Id{ get; set; } 

		public string RazaoSocial{ get; set; } 

		public string NomeFantasia{ get; set; } 

		public string Cnpj{ get; set; } 

		public string InscricaoEstadual{ get; set; } 

		public string InscricaoMunicipal{ get; set; } 

		public string TipoRegime{ get; set; } 

		public string Crt{ get; set; } 

		public System.Nullable<System.DateTime> DataConstituicao{ get; set; } 

		public string Tipo{ get; set; } 

		public string Email{ get; set; } 

		public string Logradouro{ get; set; } 

		public string Numero{ get; set; } 

		public string Complemento{ get; set; } 

		public string Cep{ get; set; } 

		public string Bairro{ get; set; } 

		public string Cidade{ get; set; } 

		public string Uf{ get; set; } 

		public string Fone{ get; set; } 

		public string Contato{ get; set; } 

		public int CodigoIbgeCidade{ get; set; } 

		public int CodigoIbgeUf{ get; set; } 

		public string Logotipo{ get; set; } 

		public string Registrado{ get; set; } 

		public string NaturezaJuridica{ get; set; } 

		public string Simei{ get; set; } 

		public string EmailPagamento{ get; set; } 

		public System.Nullable<System.DateTime> DataRegistro{ get; set; } 

		public string HoraRegistro{ get; set; } 

		public string IdPlataformaPagamento{ get; set; } 


		private IList<AdmModuloModel> admModuloModelList; 
		public IList<AdmModuloModel> AdmModuloModelList 
		{ 
			get 
			{ 
				return admModuloModelList; 
			} 
			set 
			{ 
				admModuloModelList = value; 
				foreach (AdmModuloModel admModuloModel in admModuloModelList) 
				{ 
					admModuloModel.EmpresaModel = this; 
				} 
			} 
		} 

	}
}
