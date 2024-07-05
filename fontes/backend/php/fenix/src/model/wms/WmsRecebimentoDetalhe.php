<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [WMS_RECEBIMENTO_DETALHE] 
                                                                                
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

class WmsRecebimentoDetalhe extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'WMS_RECEBIMENTO_DETALHE';

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

    public function getIdWmsRecebimentoCabecalhoAttribute() 
	{
		return $this->attributes['ID_WMS_RECEBIMENTO_CABECALHO'];
	}

	public function setIdWmsRecebimentoCabecalhoAttribute($idWmsRecebimentoCabecalho) 
	{
		$this->attributes['ID_WMS_RECEBIMENTO_CABECALHO'] = $idWmsRecebimentoCabecalho;
	}

    public function getIdProdutoAttribute() 
	{
		return $this->attributes['ID_PRODUTO'];
	}

	public function setIdProdutoAttribute($idProduto) 
	{
		$this->attributes['ID_PRODUTO'] = $idProduto;
	}

    public function getQuantidadeVolumeAttribute() 
	{
		return $this->attributes['QUANTIDADE_VOLUME'];
	}

	public function setQuantidadeVolumeAttribute($quantidadeVolume) 
	{
		$this->attributes['QUANTIDADE_VOLUME'] = $quantidadeVolume;
	}

    public function getQuantidadeItemPorVolumeAttribute() 
	{
		return $this->attributes['QUANTIDADE_ITEM_POR_VOLUME'];
	}

	public function setQuantidadeItemPorVolumeAttribute($quantidadeItemPorVolume) 
	{
		$this->attributes['QUANTIDADE_ITEM_POR_VOLUME'] = $quantidadeItemPorVolume;
	}

    public function getQuantidadeRecebidaAttribute() 
	{
		return $this->attributes['QUANTIDADE_RECEBIDA'];
	}

	public function setQuantidadeRecebidaAttribute($quantidadeRecebida) 
	{
		$this->attributes['QUANTIDADE_RECEBIDA'] = $quantidadeRecebida;
	}

    public function getDestinoAttribute() 
	{
		return $this->attributes['DESTINO'];
	}

	public function setDestinoAttribute($destino) 
	{
		$this->attributes['DESTINO'] = $destino;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdWmsRecebimentoCabecalhoAttribute($objeto->idWmsRecebimentoCabecalho);
			$this->setIdProdutoAttribute($objeto->idProduto);
			$this->setQuantidadeVolumeAttribute($objeto->quantidadeVolume);
			$this->setQuantidadeItemPorVolumeAttribute($objeto->quantidadeItemPorVolume);
			$this->setQuantidadeRecebidaAttribute($objeto->quantidadeRecebida);
			$this->setDestinoAttribute($objeto->destino);

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
			'idWmsRecebimentoCabecalho' => $this->getIdWmsRecebimentoCabecalhoAttribute(),
			'idProduto' => $this->getIdProdutoAttribute(),
			'quantidadeVolume' => $this->getQuantidadeVolumeAttribute(),
			'quantidadeItemPorVolume' => $this->getQuantidadeItemPorVolumeAttribute(),
			'quantidadeRecebida' => $this->getQuantidadeRecebidaAttribute(),
			'destino' => $this->getDestinoAttribute(),
        ];
    }
}