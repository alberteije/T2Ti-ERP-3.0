<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [ETIQUETA_TEMPLATE] 
                                                                                
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

class EtiquetaTemplate extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'ETIQUETA_TEMPLATE';

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

    public function getIdEtiquetaLayoutAttribute() 
	{
		return $this->attributes['ID_ETIQUETA_LAYOUT'];
	}

	public function setIdEtiquetaLayoutAttribute($idEtiquetaLayout) 
	{
		$this->attributes['ID_ETIQUETA_LAYOUT'] = $idEtiquetaLayout;
	}

    public function getTabelaAttribute() 
	{
		return $this->attributes['TABELA'];
	}

	public function setTabelaAttribute($tabela) 
	{
		$this->attributes['TABELA'] = $tabela;
	}

    public function getCampoAttribute() 
	{
		return $this->attributes['CAMPO'];
	}

	public function setCampoAttribute($campo) 
	{
		$this->attributes['CAMPO'] = $campo;
	}

    public function getFormatoAttribute() 
	{
		return $this->attributes['FORMATO'];
	}

	public function setFormatoAttribute($formato) 
	{
		$this->attributes['FORMATO'] = $formato;
	}

    public function getQuantidadeRepeticoesAttribute() 
	{
		return $this->attributes['QUANTIDADE_REPETICOES'];
	}

	public function setQuantidadeRepeticoesAttribute($quantidadeRepeticoes) 
	{
		$this->attributes['QUANTIDADE_REPETICOES'] = $quantidadeRepeticoes;
	}

    public function getFiltroAttribute() 
	{
		return $this->attributes['FILTRO'];
	}

	public function setFiltroAttribute($filtro) 
	{
		$this->attributes['FILTRO'] = $filtro;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdEtiquetaLayoutAttribute($objeto->idEtiquetaLayout);
			$this->setTabelaAttribute($objeto->tabela);
			$this->setCampoAttribute($objeto->campo);
			$this->setFormatoAttribute($objeto->formato);
			$this->setQuantidadeRepeticoesAttribute($objeto->quantidadeRepeticoes);
			$this->setFiltroAttribute($objeto->filtro);

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
			'idEtiquetaLayout' => $this->getIdEtiquetaLayoutAttribute(),
			'tabela' => $this->getTabelaAttribute(),
			'campo' => $this->getCampoAttribute(),
			'formato' => $this->getFormatoAttribute(),
			'quantidadeRepeticoes' => $this->getQuantidadeRepeticoesAttribute(),
			'filtro' => $this->getFiltroAttribute(),
        ];
    }
}