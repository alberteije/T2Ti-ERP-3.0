<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [CTE_PERIGOSO] 
                                                                                
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

class CtePerigoso extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'CTE_PERIGOSO';

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

    public function getNumeroOnuAttribute() 
	{
		return $this->attributes['NUMERO_ONU'];
	}

	public function setNumeroOnuAttribute($numeroOnu) 
	{
		$this->attributes['NUMERO_ONU'] = $numeroOnu;
	}

    public function getNomeApropriadoAttribute() 
	{
		return $this->attributes['NOME_APROPRIADO'];
	}

	public function setNomeApropriadoAttribute($nomeApropriado) 
	{
		$this->attributes['NOME_APROPRIADO'] = $nomeApropriado;
	}

    public function getClasseRiscoAttribute() 
	{
		return $this->attributes['CLASSE_RISCO'];
	}

	public function setClasseRiscoAttribute($classeRisco) 
	{
		$this->attributes['CLASSE_RISCO'] = $classeRisco;
	}

    public function getGrupoEmbalagemAttribute() 
	{
		return $this->attributes['GRUPO_EMBALAGEM'];
	}

	public function setGrupoEmbalagemAttribute($grupoEmbalagem) 
	{
		$this->attributes['GRUPO_EMBALAGEM'] = $grupoEmbalagem;
	}

    public function getQuantidadeTotalProdutoAttribute() 
	{
		return $this->attributes['QUANTIDADE_TOTAL_PRODUTO'];
	}

	public function setQuantidadeTotalProdutoAttribute($quantidadeTotalProduto) 
	{
		$this->attributes['QUANTIDADE_TOTAL_PRODUTO'] = $quantidadeTotalProduto;
	}

    public function getQuantidadeTipoVolumeAttribute() 
	{
		return $this->attributes['QUANTIDADE_TIPO_VOLUME'];
	}

	public function setQuantidadeTipoVolumeAttribute($quantidadeTipoVolume) 
	{
		$this->attributes['QUANTIDADE_TIPO_VOLUME'] = $quantidadeTipoVolume;
	}

    public function getPontoFulgorAttribute() 
	{
		return $this->attributes['PONTO_FULGOR'];
	}

	public function setPontoFulgorAttribute($pontoFulgor) 
	{
		$this->attributes['PONTO_FULGOR'] = $pontoFulgor;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdCteCabecalhoAttribute($objeto->idCteCabecalho);
			$this->setNumeroOnuAttribute($objeto->numeroOnu);
			$this->setNomeApropriadoAttribute($objeto->nomeApropriado);
			$this->setClasseRiscoAttribute($objeto->classeRisco);
			$this->setGrupoEmbalagemAttribute($objeto->grupoEmbalagem);
			$this->setQuantidadeTotalProdutoAttribute($objeto->quantidadeTotalProduto);
			$this->setQuantidadeTipoVolumeAttribute($objeto->quantidadeTipoVolume);
			$this->setPontoFulgorAttribute($objeto->pontoFulgor);

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
			'numeroOnu' => $this->getNumeroOnuAttribute(),
			'nomeApropriado' => $this->getNomeApropriadoAttribute(),
			'classeRisco' => $this->getClasseRiscoAttribute(),
			'grupoEmbalagem' => $this->getGrupoEmbalagemAttribute(),
			'quantidadeTotalProduto' => $this->getQuantidadeTotalProdutoAttribute(),
			'quantidadeTipoVolume' => $this->getQuantidadeTipoVolumeAttribute(),
			'pontoFulgor' => $this->getPontoFulgorAttribute(),
        ];
    }
}