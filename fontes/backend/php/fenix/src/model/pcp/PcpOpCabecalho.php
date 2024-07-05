<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [PCP_OP_CABECALHO] 
                                                                                
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

class PcpOpCabecalho extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'PCP_OP_CABECALHO';

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

    public function getInicioAttribute() 
	{
		return $this->attributes['INICIO'];
	}

	public function setInicioAttribute($inicio) 
	{
		$this->attributes['INICIO'] = $inicio;
	}

    public function getPrevisaoEntregaAttribute() 
	{
		return $this->attributes['PREVISAO_ENTREGA'];
	}

	public function setPrevisaoEntregaAttribute($previsaoEntrega) 
	{
		$this->attributes['PREVISAO_ENTREGA'] = $previsaoEntrega;
	}

    public function getTerminoAttribute() 
	{
		return $this->attributes['TERMINO'];
	}

	public function setTerminoAttribute($termino) 
	{
		$this->attributes['TERMINO'] = $termino;
	}

    public function getCustoTotalPrevistoAttribute() 
	{
		return $this->attributes['CUSTO_TOTAL_PREVISTO'];
	}

	public function setCustoTotalPrevistoAttribute($custoTotalPrevisto) 
	{
		$this->attributes['CUSTO_TOTAL_PREVISTO'] = $custoTotalPrevisto;
	}

    public function getCustoTotalRealizadoAttribute() 
	{
		return $this->attributes['CUSTO_TOTAL_REALIZADO'];
	}

	public function setCustoTotalRealizadoAttribute($custoTotalRealizado) 
	{
		$this->attributes['CUSTO_TOTAL_REALIZADO'] = $custoTotalRealizado;
	}

    public function getPorcentoVendaAttribute() 
	{
		return $this->attributes['PORCENTO_VENDA'];
	}

	public function setPorcentoVendaAttribute($porcentoVenda) 
	{
		$this->attributes['PORCENTO_VENDA'] = $porcentoVenda;
	}

    public function getPorcentoEstoqueAttribute() 
	{
		return $this->attributes['PORCENTO_ESTOQUE'];
	}

	public function setPorcentoEstoqueAttribute($porcentoEstoque) 
	{
		$this->attributes['PORCENTO_ESTOQUE'] = $porcentoEstoque;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setInicioAttribute($objeto->inicio);
			$this->setPrevisaoEntregaAttribute($objeto->previsaoEntrega);
			$this->setTerminoAttribute($objeto->termino);
			$this->setCustoTotalPrevistoAttribute($objeto->custoTotalPrevisto);
			$this->setCustoTotalRealizadoAttribute($objeto->custoTotalRealizado);
			$this->setPorcentoVendaAttribute($objeto->porcentoVenda);
			$this->setPorcentoEstoqueAttribute($objeto->porcentoEstoque);

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
			'inicio' => $this->getInicioAttribute(),
			'previsaoEntrega' => $this->getPrevisaoEntregaAttribute(),
			'termino' => $this->getTerminoAttribute(),
			'custoTotalPrevisto' => $this->getCustoTotalPrevistoAttribute(),
			'custoTotalRealizado' => $this->getCustoTotalRealizadoAttribute(),
			'porcentoVenda' => $this->getPorcentoVendaAttribute(),
			'porcentoEstoque' => $this->getPorcentoEstoqueAttribute(),
        ];
    }
}