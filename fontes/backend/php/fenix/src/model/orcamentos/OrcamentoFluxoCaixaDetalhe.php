<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [ORCAMENTO_FLUXO_CAIXA_DETALHE] 
                                                                                
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

class OrcamentoFluxoCaixaDetalhe extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'ORCAMENTO_FLUXO_CAIXA_DETALHE';

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

    public function getIdOrcamentoFluxoCaixaAttribute() 
	{
		return $this->attributes['ID_ORCAMENTO_FLUXO_CAIXA'];
	}

	public function setIdOrcamentoFluxoCaixaAttribute($idOrcamentoFluxoCaixa) 
	{
		$this->attributes['ID_ORCAMENTO_FLUXO_CAIXA'] = $idOrcamentoFluxoCaixa;
	}

    public function getIdFinNaturezaFinanceiraAttribute() 
	{
		return $this->attributes['ID_FIN_NATUREZA_FINANCEIRA'];
	}

	public function setIdFinNaturezaFinanceiraAttribute($idFinNaturezaFinanceira) 
	{
		$this->attributes['ID_FIN_NATUREZA_FINANCEIRA'] = $idFinNaturezaFinanceira;
	}

    public function getPeriodoAttribute() 
	{
		return $this->attributes['PERIODO'];
	}

	public function setPeriodoAttribute($periodo) 
	{
		$this->attributes['PERIODO'] = $periodo;
	}

    public function getValorOrcadoAttribute() 
	{
		return $this->attributes['VALOR_ORCADO'];
	}

	public function setValorOrcadoAttribute($valorOrcado) 
	{
		$this->attributes['VALOR_ORCADO'] = $valorOrcado;
	}

    public function getValorRealizadoAttribute() 
	{
		return $this->attributes['VALOR_REALIZADO'];
	}

	public function setValorRealizadoAttribute($valorRealizado) 
	{
		$this->attributes['VALOR_REALIZADO'] = $valorRealizado;
	}

    public function getTaxaVariacaoAttribute() 
	{
		return $this->attributes['TAXA_VARIACAO'];
	}

	public function setTaxaVariacaoAttribute($taxaVariacao) 
	{
		$this->attributes['TAXA_VARIACAO'] = $taxaVariacao;
	}

    public function getValorVariacaoAttribute() 
	{
		return $this->attributes['VALOR_VARIACAO'];
	}

	public function setValorVariacaoAttribute($valorVariacao) 
	{
		$this->attributes['VALOR_VARIACAO'] = $valorVariacao;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdOrcamentoFluxoCaixaAttribute($objeto->idOrcamentoFluxoCaixa);
			$this->setIdFinNaturezaFinanceiraAttribute($objeto->idFinNaturezaFinanceira);
			$this->setPeriodoAttribute($objeto->periodo);
			$this->setValorOrcadoAttribute($objeto->valorOrcado);
			$this->setValorRealizadoAttribute($objeto->valorRealizado);
			$this->setTaxaVariacaoAttribute($objeto->taxaVariacao);
			$this->setValorVariacaoAttribute($objeto->valorVariacao);

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
			'idOrcamentoFluxoCaixa' => $this->getIdOrcamentoFluxoCaixaAttribute(),
			'idFinNaturezaFinanceira' => $this->getIdFinNaturezaFinanceiraAttribute(),
			'periodo' => $this->getPeriodoAttribute(),
			'valorOrcado' => $this->getValorOrcadoAttribute(),
			'valorRealizado' => $this->getValorRealizadoAttribute(),
			'taxaVariacao' => $this->getTaxaVariacaoAttribute(),
			'valorVariacao' => $this->getValorVariacaoAttribute(),
        ];
    }
}