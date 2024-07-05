<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [IBPT] 
                                                                                
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

class Ibpt extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'IBPT';

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

    public function getNcmAttribute() 
	{
		return $this->attributes['NCM'];
	}

	public function setNcmAttribute($ncm) 
	{
		$this->attributes['NCM'] = $ncm;
	}

    public function getExAttribute() 
	{
		return $this->attributes['EX'];
	}

	public function setExAttribute($ex) 
	{
		$this->attributes['EX'] = $ex;
	}

    public function getTipoAttribute() 
	{
		return $this->attributes['TIPO'];
	}

	public function setTipoAttribute($tipo) 
	{
		$this->attributes['TIPO'] = $tipo;
	}

    public function getDescricaoAttribute() 
	{
		return $this->attributes['DESCRICAO'];
	}

	public function setDescricaoAttribute($descricao) 
	{
		$this->attributes['DESCRICAO'] = $descricao;
	}

    public function getNacionalFederalAttribute() 
	{
		return $this->attributes['NACIONAL_FEDERAL'];
	}

	public function setNacionalFederalAttribute($nacionalFederal) 
	{
		$this->attributes['NACIONAL_FEDERAL'] = $nacionalFederal;
	}

    public function getImportadosFederalAttribute() 
	{
		return $this->attributes['IMPORTADOS_FEDERAL'];
	}

	public function setImportadosFederalAttribute($importadosFederal) 
	{
		$this->attributes['IMPORTADOS_FEDERAL'] = $importadosFederal;
	}

    public function getEstadualAttribute() 
	{
		return $this->attributes['ESTADUAL'];
	}

	public function setEstadualAttribute($estadual) 
	{
		$this->attributes['ESTADUAL'] = $estadual;
	}

    public function getMunicipalAttribute() 
	{
		return $this->attributes['MUNICIPAL'];
	}

	public function setMunicipalAttribute($municipal) 
	{
		$this->attributes['MUNICIPAL'] = $municipal;
	}

    public function getVigenciaInicioAttribute() 
	{
		return $this->attributes['VIGENCIA_INICIO'];
	}

	public function setVigenciaInicioAttribute($vigenciaInicio) 
	{
		$this->attributes['VIGENCIA_INICIO'] = $vigenciaInicio;
	}

    public function getVigenciaFimAttribute() 
	{
		return $this->attributes['VIGENCIA_FIM'];
	}

	public function setVigenciaFimAttribute($vigenciaFim) 
	{
		$this->attributes['VIGENCIA_FIM'] = $vigenciaFim;
	}

    public function getChaveAttribute() 
	{
		return $this->attributes['CHAVE'];
	}

	public function setChaveAttribute($chave) 
	{
		$this->attributes['CHAVE'] = $chave;
	}

    public function getVersaoAttribute() 
	{
		return $this->attributes['VERSAO'];
	}

	public function setVersaoAttribute($versao) 
	{
		$this->attributes['VERSAO'] = $versao;
	}

    public function getFonteAttribute() 
	{
		return $this->attributes['FONTE'];
	}

	public function setFonteAttribute($fonte) 
	{
		$this->attributes['FONTE'] = $fonte;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setNcmAttribute($objeto->ncm);
			$this->setExAttribute($objeto->ex);
			$this->setTipoAttribute($objeto->tipo);
			$this->setDescricaoAttribute($objeto->descricao);
			$this->setNacionalFederalAttribute($objeto->nacionalFederal);
			$this->setImportadosFederalAttribute($objeto->importadosFederal);
			$this->setEstadualAttribute($objeto->estadual);
			$this->setMunicipalAttribute($objeto->municipal);
			$this->setVigenciaInicioAttribute($objeto->vigenciaInicio);
			$this->setVigenciaFimAttribute($objeto->vigenciaFim);
			$this->setChaveAttribute($objeto->chave);
			$this->setVersaoAttribute($objeto->versao);
			$this->setFonteAttribute($objeto->fonte);

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
			'ncm' => $this->getNcmAttribute(),
			'ex' => $this->getExAttribute(),
			'tipo' => $this->getTipoAttribute(),
			'descricao' => $this->getDescricaoAttribute(),
			'nacionalFederal' => $this->getNacionalFederalAttribute(),
			'importadosFederal' => $this->getImportadosFederalAttribute(),
			'estadual' => $this->getEstadualAttribute(),
			'municipal' => $this->getMunicipalAttribute(),
			'vigenciaInicio' => $this->getVigenciaInicioAttribute(),
			'vigenciaFim' => $this->getVigenciaFimAttribute(),
			'chave' => $this->getChaveAttribute(),
			'versao' => $this->getVersaoAttribute(),
			'fonte' => $this->getFonteAttribute(),
        ];
    }
}