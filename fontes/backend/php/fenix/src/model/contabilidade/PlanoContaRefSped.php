<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [PLANO_CONTA_REF_SPED] 
                                                                                
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

class PlanoContaRefSped extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'PLANO_CONTA_REF_SPED';

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

    public function getCodCtaRefAttribute() 
	{
		return $this->attributes['COD_CTA_REF'];
	}

	public function setCodCtaRefAttribute($codCtaRef) 
	{
		$this->attributes['COD_CTA_REF'] = $codCtaRef;
	}

    public function getDescricaoAttribute() 
	{
		return $this->attributes['DESCRICAO'];
	}

	public function setDescricaoAttribute($descricao) 
	{
		$this->attributes['DESCRICAO'] = $descricao;
	}

    public function getOrientacoesAttribute() 
	{
		return $this->attributes['ORIENTACOES'];
	}

	public function setOrientacoesAttribute($orientacoes) 
	{
		$this->attributes['ORIENTACOES'] = $orientacoes;
	}

    public function getInicioValidadeAttribute() 
	{
		return $this->attributes['INICIO_VALIDADE'];
	}

	public function setInicioValidadeAttribute($inicioValidade) 
	{
		$this->attributes['INICIO_VALIDADE'] = $inicioValidade;
	}

    public function getFimValidadeAttribute() 
	{
		return $this->attributes['FIM_VALIDADE'];
	}

	public function setFimValidadeAttribute($fimValidade) 
	{
		$this->attributes['FIM_VALIDADE'] = $fimValidade;
	}

    public function getTipoAttribute() 
	{
		return $this->attributes['TIPO'];
	}

	public function setTipoAttribute($tipo) 
	{
		$this->attributes['TIPO'] = $tipo;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setCodCtaRefAttribute($objeto->codCtaRef);
			$this->setDescricaoAttribute($objeto->descricao);
			$this->setOrientacoesAttribute($objeto->orientacoes);
			$this->setInicioValidadeAttribute($objeto->inicioValidade);
			$this->setFimValidadeAttribute($objeto->fimValidade);
			$this->setTipoAttribute($objeto->tipo);

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
			'codCtaRef' => $this->getCodCtaRefAttribute(),
			'descricao' => $this->getDescricaoAttribute(),
			'orientacoes' => $this->getOrientacoesAttribute(),
			'inicioValidade' => $this->getInicioValidadeAttribute(),
			'fimValidade' => $this->getFimValidadeAttribute(),
			'tipo' => $this->getTipoAttribute(),
        ];
    }
}