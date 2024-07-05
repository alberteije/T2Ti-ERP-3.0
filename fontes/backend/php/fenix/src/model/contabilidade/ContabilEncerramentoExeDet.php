<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [CONTABIL_ENCERRAMENTO_EXE_DET] 
                                                                                
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

class ContabilEncerramentoExeDet extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'CONTABIL_ENCERRAMENTO_EXE_DET';

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

    public function getIdContabilContaAttribute() 
	{
		return $this->attributes['ID_CONTABIL_CONTA'];
	}

	public function setIdContabilContaAttribute($idContabilConta) 
	{
		$this->attributes['ID_CONTABIL_CONTA'] = $idContabilConta;
	}

    public function getIdContabilEncerramentoExeAttribute() 
	{
		return $this->attributes['ID_CONTABIL_ENCERRAMENTO_EXE'];
	}

	public function setIdContabilEncerramentoExeAttribute($idContabilEncerramentoExe) 
	{
		$this->attributes['ID_CONTABIL_ENCERRAMENTO_EXE'] = $idContabilEncerramentoExe;
	}

    public function getSaldoAnteriorAttribute() 
	{
		return $this->attributes['SALDO_ANTERIOR'];
	}

	public function setSaldoAnteriorAttribute($saldoAnterior) 
	{
		$this->attributes['SALDO_ANTERIOR'] = $saldoAnterior;
	}

    public function getValorDebitoAttribute() 
	{
		return $this->attributes['VALOR_DEBITO'];
	}

	public function setValorDebitoAttribute($valorDebito) 
	{
		$this->attributes['VALOR_DEBITO'] = $valorDebito;
	}

    public function getValorCreditoAttribute() 
	{
		return $this->attributes['VALOR_CREDITO'];
	}

	public function setValorCreditoAttribute($valorCredito) 
	{
		$this->attributes['VALOR_CREDITO'] = $valorCredito;
	}

    public function getSaldoAttribute() 
	{
		return $this->attributes['SALDO'];
	}

	public function setSaldoAttribute($saldo) 
	{
		$this->attributes['SALDO'] = $saldo;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdContabilContaAttribute($objeto->idContabilConta);
			$this->setIdContabilEncerramentoExeAttribute($objeto->idContabilEncerramentoExe);
			$this->setSaldoAnteriorAttribute($objeto->saldoAnterior);
			$this->setValorDebitoAttribute($objeto->valorDebito);
			$this->setValorCreditoAttribute($objeto->valorCredito);
			$this->setSaldoAttribute($objeto->saldo);

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
			'idContabilConta' => $this->getIdContabilContaAttribute(),
			'idContabilEncerramentoExe' => $this->getIdContabilEncerramentoExeAttribute(),
			'saldoAnterior' => $this->getSaldoAnteriorAttribute(),
			'valorDebito' => $this->getValorDebitoAttribute(),
			'valorCredito' => $this->getValorCreditoAttribute(),
			'saldo' => $this->getSaldoAttribute(),
        ];
    }
}