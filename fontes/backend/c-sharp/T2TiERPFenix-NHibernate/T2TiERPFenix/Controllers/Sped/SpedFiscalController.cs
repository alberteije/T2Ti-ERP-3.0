/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado ao Sped Fiscal - EFD
                                                                                
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
using Microsoft.AspNetCore.Mvc;
using System;
using T2TiERPFenix.Models;
using T2TiERPFenix.Services;

namespace T2TiERPFenix.Controllers
{
    [Route("sped-fiscal")]
    [Produces("application/json")]
    public class SpedFiscalController : Controller
    {
		private readonly SpedFiscalService _service;

        public SpedFiscalController()
        {
            _service = new SpedFiscalService();
        }

        [HttpGet("{filter}", Name = "GerarSpedFiscal")]
        public IActionResult GerarSpedFiscal(string filter)
        {
            try
            {
                string caminhoArquivoSped = _service.GerarSpedFiscal(filter);

                var net = new System.Net.WebClient();
                var data = net.DownloadData(caminhoArquivoSped);
                var content = new System.IO.MemoryStream(data);
                var contentType = "text/plain";
                var fileName = "efd.txt";
				net.Dispose();
                return File(content, contentType, fileName);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [Gerar Sped Fiscal]", ex));
            }
        }

    }
}