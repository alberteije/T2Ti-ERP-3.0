/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [WMS_ORDEM_SEPARACAO_DET] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2021 T2Ti.COM                                          
                                                                                
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
    [Route("wms-ordem-separacao-det")]
    [Produces("application/json")]
    public class WmsOrdemSeparacaoDetController : Controller
    {
		private readonly WmsOrdemSeparacaoDetService _service;

        public WmsOrdemSeparacaoDetController()
        {
            _service = new WmsOrdemSeparacaoDetService();
        }

        [HttpGet]
        public IActionResult ConsultarListaWmsOrdemSeparacaoDet([FromQuery]string filter)
        {
            try
            {
                IEnumerable<WmsOrdemSeparacaoDet> lista;
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
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [Consultar Lista WmsOrdemSeparacaoDet]", ex));
            }
        }

        [HttpGet("{id}", Name = "ConsultarObjetoWmsOrdemSeparacaoDet")]
        public IActionResult ConsultarObjetoWmsOrdemSeparacaoDet(int id)
        {
            try
            {
                var objeto = _service.ConsultarObjeto(id);

                if (objeto == null)
                {
                    return StatusCode(404, new RetornoJsonErro(404, "Registro não localizado [Consultar Objeto WmsOrdemSeparacaoDet]", null));
                }
                else
                {
                    return Ok(objeto);
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [Consultar Objeto WmsOrdemSeparacaoDet]", ex));
            }
        }

        [HttpPost]
        public IActionResult InserirWmsOrdemSeparacaoDet([FromBody]WmsOrdemSeparacaoDet objJson)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return StatusCode(400, new RetornoJsonErro(400, "Objeto inválido [Inserir WmsOrdemSeparacaoDet]", null));
                }
                _service.Inserir(objJson);

                return CreatedAtRoute("ConsultarObjetoWmsOrdemSeparacaoDet", new { id = objJson.Id }, objJson);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [Inserir WmsOrdemSeparacaoDet]", ex));
            }
        }

        [HttpPut("{id}")]
        public IActionResult AlterarWmsOrdemSeparacaoDet([FromBody]WmsOrdemSeparacaoDet objJson, int id)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return StatusCode(400, new RetornoJsonErro(400, "Objeto inválido [Alterar WmsOrdemSeparacaoDet]", null));
                }

                if (objJson.Id != id)
                {
                    return StatusCode(400, new RetornoJsonErro(400, "Objeto inválido [Alterar WmsOrdemSeparacaoDet] - ID do objeto difere do ID da URL.", null));
                }

                _service.Alterar(objJson);

                return ConsultarObjetoWmsOrdemSeparacaoDet(id);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [Alterar WmsOrdemSeparacaoDet]", ex));
            }
        }

        [HttpDelete("{id}")]
        public IActionResult ExcluirWmsOrdemSeparacaoDet(int id)
        {
            try
            {
                var objeto = _service.ConsultarObjeto(id);

                _service.Excluir(objeto);

                return Ok();
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [Excluir WmsOrdemSeparacaoDet]", ex));
            }
        }

    }
}