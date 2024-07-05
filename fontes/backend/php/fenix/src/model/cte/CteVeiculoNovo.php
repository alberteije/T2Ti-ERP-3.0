<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [CTE_VEICULO_NOVO] 
                                                                                
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

class CteVeiculoNovo extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'CTE_VEICULO_NOVO';

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

    public function getChassiAttribute() 
	{
		return $this->attributes['CHASSI'];
	}

	public function setChassiAttribute($chassi) 
	{
		$this->attributes['CHASSI'] = $chassi;
	}

    public function getCorAttribute() 
	{
		return $this->attributes['COR'];
	}

	public function setCorAttribute($cor) 
	{
		$this->attributes['COR'] = $cor;
	}

    public function getDescricaoCorAttribute() 
	{
		return $this->attributes['DESCRICAO_COR'];
	}

	public function setDescricaoCorAttribute($descricaoCor) 
	{
		$this->attributes['DESCRICAO_COR'] = $descricaoCor;
	}

    public function getCodigoMarcaModeloAttribute() 
	{
		return $this->attributes['CODIGO_MARCA_MODELO'];
	}

	public function setCodigoMarcaModeloAttribute($codigoMarcaModelo) 
	{
		$this->attributes['CODIGO_MARCA_MODELO'] = $codigoMarcaModelo;
	}

    public function getValorUnitarioAttribute() 
	{
		return $this->attributes['VALOR_UNITARIO'];
	}

	public function setValorUnitarioAttribute($valorUnitario) 
	{
		$this->attributes['VALOR_UNITARIO'] = $valorUnitario;
	}

    public function getValorFreteAttribute() 
	{
		return $this->attributes['VALOR_FRETE'];
	}

	public function setValorFreteAttribute($valorFrete) 
	{
		$this->attributes['VALOR_FRETE'] = $valorFrete;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdCteCabecalhoAttribute($objeto->idCteCabecalho);
			$this->setChassiAttribute($objeto->chassi);
			$this->setCorAttribute($objeto->cor);
			$this->setDescricaoCorAttribute($objeto->descricaoCor);
			$this->setCodigoMarcaModeloAttribute($objeto->codigoMarcaModelo);
			$this->setValorUnitarioAttribute($objeto->valorUnitario);
			$this->setValorFreteAttribute($objeto->valorFrete);

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
			'chassi' => $this->getChassiAttribute(),
			'cor' => $this->getCorAttribute(),
			'descricaoCor' => $this->getDescricaoCorAttribute(),
			'codigoMarcaModelo' => $this->getCodigoMarcaModeloAttribute(),
			'valorUnitario' => $this->getValorUnitarioAttribute(),
			'valorFrete' => $this->getValorFreteAttribute(),
        ];
    }
}