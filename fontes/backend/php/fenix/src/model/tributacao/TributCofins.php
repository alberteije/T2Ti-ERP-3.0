<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [TRIBUT_COFINS] 
                                                                                
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

class TributCofins extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'TRIBUT_COFINS';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
	
    /**
     * Relations
     */
    public function tributConfiguraOfGt()
    {
    	return $this->belongsTo(TributConfiguraOfGt::class, 'ID_TRIBUT_CONFIGURA_OF_GT', 'ID');
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

    public function getCstCofinsAttribute() 
	{
		return $this->attributes['CST_COFINS'];
	}

	public function setCstCofinsAttribute($cstCofins) 
	{
		$this->attributes['CST_COFINS'] = $cstCofins;
	}

    public function getEfdTabela435Attribute() 
	{
		return $this->attributes['EFD_TABELA_435'];
	}

	public function setEfdTabela435Attribute($efdTabela435) 
	{
		$this->attributes['EFD_TABELA_435'] = $efdTabela435;
	}

    public function getModalidadeBaseCalculoAttribute() 
	{
		return $this->attributes['MODALIDADE_BASE_CALCULO'];
	}

	public function setModalidadeBaseCalculoAttribute($modalidadeBaseCalculo) 
	{
		$this->attributes['MODALIDADE_BASE_CALCULO'] = $modalidadeBaseCalculo;
	}

    public function getPorcentoBaseCalculoAttribute() 
	{
		return (double)$this->attributes['PORCENTO_BASE_CALCULO'];
	}

	public function setPorcentoBaseCalculoAttribute($porcentoBaseCalculo) 
	{
		$this->attributes['PORCENTO_BASE_CALCULO'] = $porcentoBaseCalculo;
	}

    public function getAliquotaPorcentoAttribute() 
	{
		return (double)$this->attributes['ALIQUOTA_PORCENTO'];
	}

	public function setAliquotaPorcentoAttribute($aliquotaPorcento) 
	{
		$this->attributes['ALIQUOTA_PORCENTO'] = $aliquotaPorcento;
	}

    public function getAliquotaUnidadeAttribute() 
	{
		return (double)$this->attributes['ALIQUOTA_UNIDADE'];
	}

	public function setAliquotaUnidadeAttribute($aliquotaUnidade) 
	{
		$this->attributes['ALIQUOTA_UNIDADE'] = $aliquotaUnidade;
	}

    public function getValorPrecoMaximoAttribute() 
	{
		return (double)$this->attributes['VALOR_PRECO_MAXIMO'];
	}

	public function setValorPrecoMaximoAttribute($valorPrecoMaximo) 
	{
		$this->attributes['VALOR_PRECO_MAXIMO'] = $valorPrecoMaximo;
	}

    public function getValorPautaFiscalAttribute() 
	{
		return (double)$this->attributes['VALOR_PAUTA_FISCAL'];
	}

	public function setValorPautaFiscalAttribute($valorPautaFiscal) 
	{
		$this->attributes['VALOR_PAUTA_FISCAL'] = $valorPautaFiscal;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setCstCofinsAttribute($objeto->cstCofins);
			$this->setEfdTabela435Attribute($objeto->efdTabela435);
			$this->setModalidadeBaseCalculoAttribute($objeto->modalidadeBaseCalculo);
			$this->setPorcentoBaseCalculoAttribute($objeto->porcentoBaseCalculo);
			$this->setAliquotaPorcentoAttribute($objeto->aliquotaPorcento);
			$this->setAliquotaUnidadeAttribute($objeto->aliquotaUnidade);
			$this->setValorPrecoMaximoAttribute($objeto->valorPrecoMaximo);
			$this->setValorPautaFiscalAttribute($objeto->valorPautaFiscal);

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
			'cstCofins' => $this->getCstCofinsAttribute(),
			'efdTabela435' => $this->getEfdTabela435Attribute(),
			'modalidadeBaseCalculo' => $this->getModalidadeBaseCalculoAttribute(),
			'porcentoBaseCalculo' => $this->getPorcentoBaseCalculoAttribute(),
			'aliquotaPorcento' => $this->getAliquotaPorcentoAttribute(),
			'aliquotaUnidade' => $this->getAliquotaUnidadeAttribute(),
			'valorPrecoMaximo' => $this->getValorPrecoMaximoAttribute(),
			'valorPautaFiscal' => $this->getValorPautaFiscalAttribute(),
        ];
    }
}