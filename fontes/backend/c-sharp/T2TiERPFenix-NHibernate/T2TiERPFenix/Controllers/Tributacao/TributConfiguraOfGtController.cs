/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [TRIBUT_CONFIGURA_OF_GT] 
                                                                                
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
    [Route("tribut-configura-of-gt")]
    [Produces("application/json")]
    public class TributConfiguraOfGtController : Controller
    {
		private readonly TributConfiguraOfGtService _service;

        public TributConfiguraOfGtController()
        {
            _service = new TributConfiguraOfGtService();
        }

        [HttpGet]
        public IActionResult ConsultarListaTributConfiguraOfGt([FromQuery]string filter)
        {
            try
            {
                IEnumerable<TributConfiguraOfGt> lista;
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
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [Consultar Lista TributConfiguraOfGt]", ex));
            }
        }

        [HttpGet("{id}", Name = "ConsultarObjetoTributConfiguraOfGt")]
        public IActionResult ConsultarObjetoTributConfiguraOfGt(int id)
        {
            try
            {
                var objeto = _service.ConsultarObjeto(id);

                if (objeto == null)
                {
                    return StatusCode(404, new RetornoJsonErro(404, "Registro não localizado [Consultar Objeto TributConfiguraOfGt]", null));
                }
                else
                {
                    return Ok(objeto);
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [Consultar Objeto TributConfiguraOfGt]", ex));
            }
        }

        [HttpPost]
        public IActionResult InserirTributConfiguraOfGt([FromBody]TributConfiguraOfGt objJson)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return StatusCode(400, new RetornoJsonErro(400, "Objeto inválido [Inserir TributConfiguraOfGt]", null));
                }
                _service.Inserir(objJson);

                return CreatedAtRoute("ConsultarObjetoTributConfiguraOfGt", new { id = objJson.Id }, objJson);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [Inserir TributConfiguraOfGt]", ex));
            }
        }

        [HttpPut("{id}")]
        public IActionResult AlterarTributConfiguraOfGt([FromBody]TributConfiguraOfGt objJson, int id)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return StatusCode(400, new RetornoJsonErro(400, "Objeto inválido [Alterar TributConfiguraOfGt]", null));
                }

                if (objJson.Id != id)
                {
                    return StatusCode(400, new RetornoJsonErro(400, "Objeto inválido [Alterar TributConfiguraOfGt] - ID do objeto difere do ID da URL.", null));
                }

                _service.Alterar(objJson);

                return ConsultarObjetoTributConfiguraOfGt(id);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [Alterar TributConfiguraOfGt]", ex));
            }
        }

        [HttpDelete("{id}")]
        public IActionResult ExcluirTributConfiguraOfGt(int id)
        {
            try
            {
                var objeto = _service.ConsultarObjeto(id);

                _service.Excluir(objeto);

                return Ok();
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [Excluir TributConfiguraOfGt]", ex));
            }
        }

        [HttpGet]
        [Route("consulta-tributacao")]
        public IActionResult ConsultarTributacao()
        {
            try
            {
                string idTributGrupoTributario = Request.Headers["idTributGrupoTributario"];
                string idTributOperacaoFiscal = Request.Headers["idTributOperacaoFiscal"];

                var objeto = _service.ConsultarTributacao(idTributGrupoTributario, idTributOperacaoFiscal);

                if (objeto == null)
                {
                    return StatusCode(404, new RetornoJsonErro(404, "Registro não localizado [Consultar Tributação]", null));
                }
                else
                {
                    return Ok(objeto);
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [Consultar Tributação]", ex));
            }
        }

    }
}