<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [PCP_OP_DETALHE] 
                                                                                
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

class PcpOpDetalhe extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'PCP_OP_DETALHE';

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

    public function getIdPcpOpCabecalhoAttribute() 
	{
		return $this->attributes['ID_PCP_OP_CABECALHO'];
	}

	public function setIdPcpOpCabecalhoAttribute($idPcpOpCabecalho) 
	{
		$this->attributes['ID_PCP_OP_CABECALHO'] = $idPcpOpCabecalho;
	}

    public function getIdProdutoAttribute() 
	{
		return $this->attributes['ID_PRODUTO'];
	}

	public function setIdProdutoAttribute($idProduto) 
	{
		$this->attributes['ID_PRODUTO'] = $idProduto;
	}

    public function getQuantidadeProduzirAttribute() 
	{
		return $this->attributes['QUANTIDADE_PRODUZIR'];
	}

	public function setQuantidadeProduzirAttribute($quantidadeProduzir) 
	{
		$this->attributes['QUANTIDADE_PRODUZIR'] = $quantidadeProduzir;
	}

    public function getQuantidadeProduzidaAttribute() 
	{
		return $this->attributes['QUANTIDADE_PRODUZIDA'];
	}

	public function setQuantidadeProduzidaAttribute($quantidadeProduzida) 
	{
		$this->attributes['QUANTIDADE_PRODUZIDA'] = $quantidadeProduzida;
	}

    public function getQuantidadeEntregueAttribute() 
	{
		return $this->attributes['QUANTIDADE_ENTREGUE'];
	}

	public function setQuantidadeEntregueAttribute($quantidadeEntregue) 
	{
		$this->attributes['QUANTIDADE_ENTREGUE'] = $quantidadeEntregue;
	}

    public function getCustoPrevistoAttribute() 
	{
		return $this->attributes['CUSTO_PREVISTO'];
	}

	public function setCustoPrevistoAttribute($custoPrevisto) 
	{
		$this->attributes['CUSTO_PREVISTO'] = $custoPrevisto;
	}

    public function getCustoRealizadoAttribute() 
	{
		return $this->attributes['CUSTO_REALIZADO'];
	}

	public function setCustoRealizadoAttribute($custoRealizado) 
	{
		$this->attributes['CUSTO_REALIZADO'] = $custoRealizado;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdPcpOpCabecalhoAttribute($objeto->idPcpOpCabecalho);
			$this->setIdProdutoAttribute($objeto->idProduto);
			$this->setQuantidadeProduzirAttribute($objeto->quantidadeProduzir);
			$this->setQuantidadeProduzidaAttribute($objeto->quantidadeProduzida);
			$this->setQuantidadeEntregueAttribute($objeto->quantidadeEntregue);
			$this->setCustoPrevistoAttribute($objeto->custoPrevisto);
			$this->setCustoRealizadoAttribute($objeto->custoRealizado);

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
			'idPcpOpCabecalho' => $this->getIdPcpOpCabecalhoAttribute(),
			'idProduto' => $this->getIdProdutoAttribute(),
			'quantidadeProduzir' => $this->getQuantidadeProduzirAttribute(),
			'quantidadeProduzida' => $this->getQuantidadeProduzidaAttribute(),
			'quantidadeEntregue' => $this->getQuantidadeEntregueAttribute(),
			'custoPrevisto' => $this->getCustoPrevistoAttribute(),
			'custoRealizado' => $this->getCustoRealizadoAttribute(),
        ];
    }
}