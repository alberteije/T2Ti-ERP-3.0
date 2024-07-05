<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [FIN_CHEQUE_EMITIDO] 
                                                                                
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

class FinChequeEmitido extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'FIN_CHEQUE_EMITIDO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['cheque', ];
	
    /**
     * Relations
     */
    public function cheque()
    {
    	return $this->belongsTo(Cheque::class, 'ID_CHEQUE', 'ID');
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

    public function getDataEmissaoAttribute() 
	{
		return $this->attributes['DATA_EMISSAO'];
	}

	public function setDataEmissaoAttribute($dataEmissao) 
	{
		$this->attributes['DATA_EMISSAO'] = $dataEmissao;
	}

    public function getBomParaAttribute() 
	{
		return $this->attributes['BOM_PARA'];
	}

	public function setBomParaAttribute($bomPara) 
	{
		$this->attributes['BOM_PARA'] = $bomPara;
	}

    public function getDataCompensacaoAttribute() 
	{
		return $this->attributes['DATA_COMPENSACAO'];
	}

	public function setDataCompensacaoAttribute($dataCompensacao) 
	{
		$this->attributes['DATA_COMPENSACAO'] = $dataCompensacao;
	}

    public function getValorAttribute() 
	{
		return $this->attributes['VALOR'];
	}

	public function setValorAttribute($valor) 
	{
		$this->attributes['VALOR'] = $valor;
	}

    public function getNominalAAttribute() 
	{
		return $this->attributes['NOMINAL_A'];
	}

	public function setNominalAAttribute($nominalA) 
	{
		$this->attributes['NOMINAL_A'] = $nominalA;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setDataEmissaoAttribute($objeto->dataEmissao);
			$this->setBomParaAttribute($objeto->bomPara);
			$this->setDataCompensacaoAttribute($objeto->dataCompensacao);
			$this->setValorAttribute($objeto->valor);
			$this->setNominalAAttribute($objeto->nominalA);

			// vincular objetos
			$cheque = new Cheque();
			$cheque->mapear($objeto->cheque);
			$this->cheque()->associate($cheque);

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
			'dataEmissao' => $this->getDataEmissaoAttribute(),
			'bomPara' => $this->getBomParaAttribute(),
			'dataCompensacao' => $this->getDataCompensacaoAttribute(),
			'valor' => $this->getValorAttribute(),
			'nominalA' => $this->getNominalAAttribute(),
			'cheque' => $this->cheque,
        ];
    }
}