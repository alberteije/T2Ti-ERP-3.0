/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [VIEW_FIN_CHEQUE_NAO_COMPENSADO] 
                                                                                
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
    [Route("view-fin-cheque-nao-compensado")]
    [Produces("application/json")]
    public class ViewFinChequeNaoCompensadoController : Controller
    {
		private readonly ViewFinChequeNaoCompensadoService _service;

        public ViewFinChequeNaoCompensadoController()
        {
            _service = new ViewFinChequeNaoCompensadoService();
        }

        [HttpGet]
        public IActionResult ConsultarListaViewFinChequeNaoCompensado([FromQuery]string filter)
        {
            try
            {
                IEnumerable<ViewFinChequeNaoCompensado> lista;
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
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [Consultar Lista ViewFinChequeNaoCompensado]", ex));
            }
        }

        [HttpGet("{id}", Name = "ConsultarObjetoViewFinChequeNaoCompensado")]
        public IActionResult ConsultarObjetoViewFinChequeNaoCompensado(int id)
        {
            try
            {
                var objeto = _service.ConsultarObjeto(id);

                if (objeto == null)
                {
                    return StatusCode(404, new RetornoJsonErro(404, "Registro não localizado [Consultar Objeto ViewFinChequeNaoCompensado]", null));
                }
                else
                {
                    return Ok(objeto);
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [Consultar Objeto ViewFinChequeNaoCompensado]", ex));
            }
        }

        [HttpPost]
        public IActionResult InserirViewFinChequeNaoCompensado([FromBody]ViewFinChequeNaoCompensado objJson)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return StatusCode(400, new RetornoJsonErro(400, "Objeto inválido [Inserir ViewFinChequeNaoCompensado]", null));
                }
                _service.Inserir(objJson);

                return CreatedAtRoute("ConsultarObjetoViewFinChequeNaoCompensado", new { id = objJson.Id }, objJson);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [Inserir ViewFinChequeNaoCompensado]", ex));
            }
        }

        [HttpPut("{id}")]
        public IActionResult AlterarViewFinChequeNaoCompensado([FromBody]ViewFinChequeNaoCompensado objJson, int id)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return StatusCode(400, new RetornoJsonErro(400, "Objeto inválido [Alterar ViewFinChequeNaoCompensado]", null));
                }

                if (objJson.Id != id)
                {
                    return StatusCode(400, new RetornoJsonErro(400, "Objeto inválido [Alterar ViewFinChequeNaoCompensado] - ID do objeto difere do ID da URL.", null));
                }

                _service.Alterar(objJson);

                return ConsultarObjetoViewFinChequeNaoCompensado(id);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [Alterar ViewFinChequeNaoCompensado]", ex));
            }
        }

        [HttpDelete("{id}")]
        public IActionResult ExcluirViewFinChequeNaoCompensado(int id)
        {
            try
            {
                var objeto = _service.ConsultarObjeto(id);

                _service.Excluir(objeto);

                return Ok();
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Erro no Servidor [Excluir ViewFinChequeNaoCompensado]", ex));
            }
        }

    }
}