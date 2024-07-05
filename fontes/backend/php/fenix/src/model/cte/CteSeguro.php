<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [CTE_SEGURO] 
                                                                                
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

class CteSeguro extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'CTE_SEGURO';

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

    public function getIdCteCabecalhoAttribute() 
	{
		return $this->attributes['ID_CTE_CABECALHO'];
	}

	public function setIdCteCabecalhoAttribute($idCteCabecalho) 
	{
		$this->attributes['ID_CTE_CABECALHO'] = $idCteCabecalho;
	}

    public function getResponsavelAttribute() 
	{
		return $this->attributes['RESPONSAVEL'];
	}

	public function setResponsavelAttribute($responsavel) 
	{
		$this->attributes['RESPONSAVEL'] = $responsavel;
	}

    public function getSeguradoraAttribute() 
	{
		return $this->attributes['SEGURADORA'];
	}

	public function setSeguradoraAttribute($seguradora) 
	{
		$this->attributes['SEGURADORA'] = $seguradora;
	}

    public function getApoliceAttribute() 
	{
		return $this->attributes['APOLICE'];
	}

	public function setApoliceAttribute($apolice) 
	{
		$this->attributes['APOLICE'] = $apolice;
	}

    public function getAverbacaoAttribute() 
	{
		return $this->attributes['AVERBACAO'];
	}

	public function setAverbacaoAttribute($averbacao) 
	{
		$this->attributes['AVERBACAO'] = $averbacao;
	}

    public function getValorCargaAttribute() 
	{
		return $this->attributes['VALOR_CARGA'];
	}

	public function setValorCargaAttribute($valorCarga) 
	{
		$this->attributes['VALOR_CARGA'] = $valorCarga;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdCteCabecalhoAttribute($objeto->idCteCabecalho);
			$this->setResponsavelAttribute($objeto->responsavel);
			$this->setSeguradoraAttribute($objeto->seguradora);
			$this->setApoliceAttribute($objeto->apolice);
			$this->setAverbacaoAttribute($objeto->averbacao);
			$this->setValorCargaAttribute($objeto->valorCarga);

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
			'idCteCabecalho' => $this->getIdCteCabecalhoAttribute(),
			'responsavel' => $this->getResponsavelAttribute(),
			'seguradora' => $this->getSeguradoraAttribute(),
			'apolice' => $this->getApoliceAttribute(),
			'averbacao' => $this->getAverbacaoAttribute(),
			'valorCarga' => $this->getValorCargaAttribute(),
        ];
    }
}