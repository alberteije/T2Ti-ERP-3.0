<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [VIEW_FIN_CHEQUE_NAO_COMPENSADO] 
                                                                                
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

class ViewFinChequeNaoCompensado extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'VIEW_FIN_CHEQUE_NAO_COMPENSADO';

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

    public function getIdContaCaixaAttribute() 
	{
		return $this->attributes['ID_CONTA_CAIXA'];
	}

	public function setIdContaCaixaAttribute($idContaCaixa) 
	{
		$this->attributes['ID_CONTA_CAIXA'] = $idContaCaixa;
	}

    public function getNomeContaCaixaAttribute() 
	{
		return $this->attributes['NOME_CONTA_CAIXA'];
	}

	public function setNomeContaCaixaAttribute($nomeContaCaixa) 
	{
		$this->attributes['NOME_CONTA_CAIXA'] = $nomeContaCaixa;
	}

    public function getTalaoAttribute() 
	{
		return $this->attributes['TALAO'];
	}

	public function setTalaoAttribute($talao) 
	{
		$this->attributes['TALAO'] = $talao;
	}

    public function getNumeroTalaoAttribute() 
	{
		return $this->attributes['NUMERO_TALAO'];
	}

	public function setNumeroTalaoAttribute($numeroTalao) 
	{
		$this->attributes['NUMERO_TALAO'] = $numeroTalao;
	}

    public function getNumeroChequeAttribute() 
	{
		return $this->attributes['NUMERO_CHEQUE'];
	}

	public function setNumeroChequeAttribute($numeroCheque) 
	{
		$this->attributes['NUMERO_CHEQUE'] = $numeroCheque;
	}

    public function getStatusChequeAttribute() 
	{
		return $this->attributes['STATUS_CHEQUE'];
	}

	public function setStatusChequeAttribute($statusCheque) 
	{
		$this->attributes['STATUS_CHEQUE'] = $statusCheque;
	}

    public function getDataStatusAttribute() 
	{
		return $this->attributes['DATA_STATUS'];
	}

	public function setDataStatusAttribute($dataStatus) 
	{
		$this->attributes['DATA_STATUS'] = $dataStatus;
	}

    public function getValorAttribute() 
	{
		return (double)$this->attributes['VALOR'];
	}

	public function setValorAttribute($valor) 
	{
		$this->attributes['VALOR'] = $valor;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdContaCaixaAttribute($objeto->idContaCaixa);
			$this->setNomeContaCaixaAttribute($objeto->nomeContaCaixa);
			$this->setTalaoAttribute($objeto->talao);
			$this->setNumeroTalaoAttribute($objeto->numeroTalao);
			$this->setNumeroChequeAttribute($objeto->numeroCheque);
			$this->setStatusChequeAttribute($objeto->statusCheque);
			$this->setDataStatusAttribute($objeto->dataStatus);
			$this->setValorAttribute($objeto->valor);

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
			'idContaCaixa' => $this->getIdContaCaixaAttribute(),
			'nomeContaCaixa' => $this->getNomeContaCaixaAttribute(),
			'talao' => $this->getTalaoAttribute(),
			'numeroTalao' => $this->getNumeroTalaoAttribute(),
			'numeroCheque' => $this->getNumeroChequeAttribute(),
			'statusCheque' => $this->getStatusChequeAttribute(),
			'dataStatus' => $this->getDataStatusAttribute(),
			'valor' => $this->getValorAttribute(),
        ];
    }
}