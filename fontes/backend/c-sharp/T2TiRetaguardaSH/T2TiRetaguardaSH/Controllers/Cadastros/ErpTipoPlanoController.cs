using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using T2TiRetaguardaSH.Models;
using T2TiRetaguardaSH.Services;

namespace T2TiRetaguardaSH.Controllers
{
    [Route("erp-tipo-plano")]
    [Produces("application/json")]
    public class ErpTipoPlanoController : Controller
    {
		private readonly ErpTipoPlanoService _service;

        public ErpTipoPlanoController()
        {
            _service = new ErpTipoPlanoService();
        }

        [HttpGet]
        public IActionResult GetListErpTipoPlano([FromQuery]string filter)
        {
            try
            {
                IEnumerable<ErpTipoPlanoModel> resultList;
                if (filter == null)
                {
                    resultList = _service.GetList();
                }
                else
                {
                    // defines filter
                    Filtro filterObj = new Filtro(filter);
                    resultList = _service.GetListFilter(filterObj);
                }
                return Ok(resultList);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Error [GetList ErpTipoPlano]", ex));
            }
        }

        [HttpGet("{id}", Name = "GetObjectErpTipoPlano")]
        public IActionResult GetObjectErpTipoPlano(int id)
        {
            try
            {
                var obj = _service.GetObject(id);

                if (obj == null)
                {
                    return StatusCode(404, new RetornoJsonErro(404, "Not Found [GetObject ErpTipoPlano]", null));
                }
                else
                {
                    return Ok(obj);
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Error [GetObject ErpTipoPlano]", ex));
            }
        }

        [HttpPost]
        public IActionResult InsertErpTipoPlano([FromBody]ErpTipoPlanoModel objJson)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return StatusCode(400, new RetornoJsonErro(400, "Invalid Object [Insert ErpTipoPlano]", null));
                }
                _service.Insert(objJson);

                return CreatedAtRoute("GetObjectErpTipoPlano", new { id = objJson.Id }, objJson);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Error [Insert ErpTipoPlano]", ex));
            }
        }

        [HttpPut]
        public IActionResult UpdateErpTipoPlano([FromBody]ErpTipoPlanoModel objJson, int id)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return StatusCode(400, new RetornoJsonErro(400, "Invalid Object [Update ErpTipoPlano]", null));
                }

                _service.Update(objJson);

                return GetObjectErpTipoPlano(id);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Error [Update ErpTipoPlano]", ex));
            }
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteErpTipoPlano(int id)
        {
            try
            {
                var obj = _service.GetObject(id);

                _service.Delete(obj);

                return Ok();
            }
            catch (Exception ex)
            {
                return StatusCode(500, new RetornoJsonErro(500, "Error [Delete ErpTipoPlano]", ex));
            }
        }

    }
}