/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [NFE_CABECALHO] 
                                                                                
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
using System.Collections.Generic;
using T2TiERPFenix.Models;
using T2TiERPFenix.Services;
using T2TiERPFenix.Util;

namespace T2TiERPFenix.Controllers
{
    [Route("nfe-cabecalho")]
    [Produces("application/json")]
    public class NfeCabecalhoController : Controller
    {
		private readonly NfeCabecalhoService _service;

        public NfeCabecalhoController()
        {
            _service = new NfeCabecalhoService();
        }

        [HttpGet]
        public IActionResult ConsultarListaNfeCabecalho([FromQuery]string filter)
        {
            try
            {
                IEnumerable<NfeCabecalho> lista;
                if (filter == null)
                {
                    lista = _service.ConsultarLista();
                }
                else
                {
                    // define o filtro
                    Filtro filtro = new Filtro(filter);
                    lista = _service.ConsultarListaFiltro(filtro);
                }
                return Ok(lista);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [Consultar Lista NfeCabecalho]", ex));
            }
        }

        [HttpGet("{id}", Name = "ConsultarObjetoNfeCabecalho")]
        public IActionResult ConsultarObjetoNfeCabecalho(int id)
        {
            try
            {
                var objeto = _service.ConsultarObjeto(id);

                if (objeto == null)
                {
                    return StatusCode(404, new RetornoJsonErro(404, "Registro não localizado [Consultar Objeto NfeCabecalho]", null));
                }
                else
                {
                    return Ok(objeto);
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [Consultar Objeto NfeCabecalho]", ex));
            }
        }

        [HttpPost]
        public IActionResult InserirNfeCabecalho([FromBody]NfeCabecalho objJson)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return StatusCode(400, new RetornoJsonErro(400, "Objeto inválido [Inserir NfeCabecalho]", null));
                }
                _service.Inserir(objJson);

                return CreatedAtRoute("ConsultarObjetoNfeCabecalho", new { id = objJson.Id }, objJson);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [Inserir NfeCabecalho]", ex));
            }
        }

        [HttpPut("{id}")]
        public IActionResult AlterarNfeCabecalho([FromBody]NfeCabecalho objJson, int id)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return StatusCode(400, new RetornoJsonErro(400, "Objeto inválido [Alterar NfeCabecalho]", null));
                }

                if (objJson.Id != id)
                {
                    return StatusCode(400, new RetornoJsonErro(400, "Objeto inválido [Alterar NfeCabecalho] - ID do objeto difere do ID da URL.", null));
                }

                _service.Alterar(objJson);

                return ConsultarObjetoNfeCabecalho(id);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [Alterar NfeCabecalho]", ex));
            }
        }

        [HttpDelete("{id}")]
        public IActionResult ExcluirNfeCabecalho(int id)
        {
            try
            {
                var objeto = _service.ConsultarObjeto(id);

                _service.Excluir(objeto);

                return Ok();
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [Excluir NfeCabecalho]", ex));
            }
        }

        [HttpPost]
        [Route("calcula-totais")]
        public IActionResult CalcularTotais([FromBody]NfeCabecalho objJson)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return StatusCode(400, new RetornoJsonErro(400, "Objeto inválido [CalcularTotais NfeCabecalho]", null));
                }

                _service.CalcularTotais(objJson);
                return Ok(objJson);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [CalcularTotais NfeCabecalho]", ex));
            }
        }

        [HttpPost]
        [Route("transmite-nfe")]
        public IActionResult TransmitirNfe([FromBody]NfeCabecalho objJson)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return StatusCode(400, new RetornoJsonErro(400, "Objeto inválido [TransmitirNfe NfeCabecalho]", null));
                }

                string retorno = _service.TransmitirNFe(objJson);
                if (!retorno.Contains("ERRO"))
                {
                    var net = new System.Net.WebClient();
                    var data = net.DownloadData(retorno);
                    var content = new System.IO.MemoryStream(data);
                    var contentType = "application/pdf";
                    var nomeArquivo = "nfe.pdf";
                    net.Dispose();
                    return File(content, contentType, nomeArquivo);
                }
                else
                {
                    return StatusCode(418, new RetornoJsonErro(418, retorno, null)); // Erro capturado pelo ACBrMonitor
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [TransmitirNfe NfeCabecalho]", ex));
            }
        }

        [HttpGet]
        [Route("gera-pdf-nfe")]
        public IActionResult GerarPdfNfe()
        {
            string retorno;
            try
            {
                string chave = Request.Headers["chave"];

                retorno = _service.GerarPdfDanfe(chave);
                if (!retorno.Contains("ERRO"))
                {
                    var net = new System.Net.WebClient();
                    var data = net.DownloadData(retorno);
                    var content = new System.IO.MemoryStream(data);
                    var contentType = "application/pdf";
                    var nomeArquivo = "nfe.pdf";
                    net.Dispose();
                    return File(content, contentType, nomeArquivo);
                }
                else
                {
                    return StatusCode(418, new RetornoJsonErro(418, retorno, null)); // Erro capturado pelo ACBrMonitor
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500,
                        new RetornoJsonErro(500, "Erro no Servidor [Gerar Pdf Danfe Nfe]", ex));
            }
        }

    }
}