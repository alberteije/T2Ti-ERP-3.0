<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [NFE_CANA_DEDUCOES_SAFRA] 
                                                                                
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

class NfeCanaDeducoesSafra extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'NFE_CANA_DEDUCOES_SAFRA';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
	
    /**
     * Relations
     */
    public function nfeCana()
    {
    	return $this->belongsTo(NfeCana::class, 'ID_NFE_CANA', 'ID');
    }


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

    public function getDecricaoAttribute() 
	{
		return $this->attributes['DECRICAO'];
	}

	public function setDecricaoAttribute($decricao) 
	{
		$this->attributes['DECRICAO'] = $decricao;
	}

    public function getValorDeducaoAttribute() 
	{
		return (double)$this->attributes['VALOR_DEDUCAO'];
	}

	public function setValorDeducaoAttribute($valorDeducao) 
	{
		$this->attributes['VALOR_DEDUCAO'] = $valorDeducao;
	}

    public function getValorFornecimentoAttribute() 
	{
		return (double)$this->attributes['VALOR_FORNECIMENTO'];
	}

	public function setValorFornecimentoAttribute($valorFornecimento) 
	{
		$this->attributes['VALOR_FORNECIMENTO'] = $valorFornecimento;
	}

    public function getValorTotalDeducaoAttribute() 
	{
		return (double)$this->attributes['VALOR_TOTAL_DEDUCAO'];
	}

	public function setValorTotalDeducaoAttribute($valorTotalDeducao) 
	{
		$this->attributes['VALOR_TOTAL_DEDUCAO'] = $valorTotalDeducao;
	}

    public function getValorLiquidoFornecimentoAttribute() 
	{
		return (double)$this->attributes['VALOR_LIQUIDO_FORNECIMENTO'];
	}

	public function setValorLiquidoFornecimentoAttribute($valorLiquidoFornecimento) 
	{
		$this->attributes['VALOR_LIQUIDO_FORNECIMENTO'] = $valorLiquidoFornecimento;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setDecricaoAttribute($objeto->decricao);
			$this->setValorDeducaoAttribute($objeto->valorDeducao);
			$this->setValorFornecimentoAttribute($objeto->valorFornecimento);
			$this->setValorTotalDeducaoAttribute($objeto->valorTotalDeducao);
			$this->setValorLiquidoFornecimentoAttribute($objeto->valorLiquidoFornecimento);

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
			'decricao' => $this->getDecricaoAttribute(),
			'valorDeducao' => $this->getValorDeducaoAttribute(),
			'valorFornecimento' => $this->getValorFornecimentoAttribute(),
			'valorTotalDeducao' => $this->getValorTotalDeducaoAttribute(),
			'valorLiquidoFornecimento' => $this->getValorLiquidoFornecimentoAttribute(),
        ];
    }
}