/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [FIN_LANCAMENTO_RECEBER] 
                                                                                
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

namespace T2TiERPFenix.Controllers
{
    [Route("fin-lancamento-receber")]
    [Produces("application/json")]
    public class FinLancamentoReceberController : Controller
    {
		private readonly FinLancamentoReceberService _service;

        public FinLancamentoReceberController()
        {
            _service = new FinLancamentoReceberService();
        }

        [HttpGet]
        public IActionResult ConsultarListaFinLancamentoReceber([FromQuery]string filter)
        {
            try
            {
                IEnumerable<FinLancamentoReceber> lista;
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
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [Consultar Lista FinLancamentoReceber]", ex));
            }
        }

        [HttpGet("{id}", Name = "ConsultarObjetoFinLancamentoReceber")]
        public IActionResult ConsultarObjetoFinLancamentoReceber(int id)
        {
            try
            {
                var objeto = _service.ConsultarObjeto(id);

                if (objeto == null)
                {
                    return StatusCode(404, new RetornoJsonErro(404, "Registro não localizado [Consultar Objeto FinLancamentoReceber]", null));
                }
                else
                {
                    return Ok(objeto);
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [Consultar Objeto FinLancamentoReceber]", ex));
            }
        }

        [HttpPost]
        public IActionResult InserirFinLancamentoReceber([FromBody]FinLancamentoReceber objJson)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return StatusCode(400, new RetornoJsonErro(400, "Objeto inválido [Inserir FinLancamentoReceber]", null));
                }
                _service.Inserir(objJson);

                return CreatedAtRoute("ConsultarObjetoFinLancamentoReceber", new { id = objJson.Id }, objJson);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [Inserir FinLancamentoReceber]", ex));
            }
        }

        [HttpPut("{id}")]
        public IActionResult AlterarFinLancamentoReceber([FromBody]FinLancamentoReceber objJson, int id)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return StatusCode(400, new RetornoJsonErro(400, "Objeto inválido [Alterar FinLancamentoReceber]", null));
                }

                if (objJson.Id != id)
                {
                    return StatusCode(400, new RetornoJsonErro(400, "Objeto inválido [Alterar FinLancamentoReceber] - ID do objeto difere do ID da URL.", null));
                }

                _service.Alterar(objJson);

                return ConsultarObjetoFinLancamentoReceber(id);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [Alterar FinLancamentoReceber]", ex));
            }
        }

        [HttpDelete("{id}")]
        public IActionResult ExcluirFinLancamentoReceber(int id)
        {
            try
            {
                var objeto = _service.ConsultarObjeto(id);

                _service.Excluir(objeto);

                return Ok();
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [Excluir FinLancamentoReceber]", ex));
            }
        }


        [HttpPost]
        [Route("gera-boleto")]
        public IActionResult GerarBoleto([FromBody]FinLancamentoReceber objJson)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return StatusCode(400, new RetornoJsonErro(400, "Objeto inválido [GerarBoleto FinLancamentoReceber]", null));
                }

                string retorno = _service.GerarBoleto(objJson);

                var net = new System.Net.WebClient();
                var data = net.DownloadData(retorno);
                var content = new System.IO.MemoryStream(data);
                var contentType = "application/pdf";
                var fileName = "nfe.pdf";
                net.Dispose();
                return File(content, contentType, fileName);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [GerarBoleto FinLancamentoReceber]", ex));
            }
        }

    }
}