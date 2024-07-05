<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [MDFE_INFORMACAO_CTE] 
                                                                                
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
declare(strict_types=1);

class MdfeInformacaoCte extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'MDFE_INFORMACAO_CTE';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
	
    /**
     * Relations
     */

    /**
     * Gets e Sets
     */
    public function getIdAttribute() 
	{
		return $this->attributes['ID'];
	}

	public function setIdAttribute($id) 
	{
		$this->attributes['ID'] = $id;
	}

    public function getIdMdfeMunicipioDescarregaAttribute() 
	{
		return $this->attributes['ID_MDFE_MUNICIPIO_DESCARREGA'];
	}

	public function setIdMdfeMunicipioDescarregaAttribute($idMdfeMunicipioDescarrega) 
	{
		$this->attributes['ID_MDFE_MUNICIPIO_DESCARREGA'] = $idMdfeMunicipioDescarrega;
	}

    public function getChaveCteAttribute() 
	{
		return $this->attributes['CHAVE_CTE'];
	}

	public function setChaveCteAttribute($chaveCte) 
	{
		$this->attributes['CHAVE_CTE'] = $chaveCte;
	}

    public function getSegundoCodigoBarraAttribute() 
	{
		return $this->attributes['SEGUNDO_CODIGO_BARRA'];
	}

	public function setSegundoCodigoBarraAttribute($segundoCodigoBarra) 
	{
		$this->attributes['SEGUNDO_CODIGO_BARRA'] = $segundoCodigoBarra;
	}

    public function getIndicadorReentregaAttribute() 
	{
		return $this->attributes['INDICADOR_REENTREGA'];
	}

	public function setIndicadorReentregaAttribute($indicadorReentrega) 
	{
		$this->attributes['INDICADOR_REENTREGA'] = $indicadorReentrega;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdMdfeMunicipioDescarregaAttribute($objeto->idMdfeMunicipioDescarrega);
			$this->setChaveCteAttribute($objeto->chaveCte);
			$this->setSegundoCodigoBarraAttribute($objeto->segundoCodigoBarra);
			$this->setIndicadorReentregaAttribute($objeto->indicadorReentrega);

			// vincular objetos
        }
    }

    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getIdAttribute(),
			'idMdfeMunicipioDescarrega' => $this->getIdMdfeMunicipioDescarregaAttribute(),
			'chaveCte' => $this->getChaveCteAttribute(),
			'segundoCodigoBarra' => $this->getSegundoCodigoBarraAttribute(),
			'indicadorReentrega' => $this->getIndicadorReentregaAttribute(),
        ];
    }
}