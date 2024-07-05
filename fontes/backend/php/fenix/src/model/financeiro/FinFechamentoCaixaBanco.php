<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [FIN_FECHAMENTO_CAIXA_BANCO] 
                                                                                
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

class FinFechamentoCaixaBanco extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'FIN_FECHAMENTO_CAIXA_BANCO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['bancoContaCaixa', ];
	
    /**
     * Relations
     */
    public function bancoContaCaixa()
    {
    	return $this->belongsTo(BancoContaCaixa::class, 'ID_BANCO_CONTA_CAIXA', 'ID');
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

    public function getDataFechamentoAttribute() 
	{
		return $this->attributes['DATA_FECHAMENTO'];
	}

	public function setDataFechamentoAttribute($dataFechamento) 
	{
		$this->attributes['DATA_FECHAMENTO'] = $dataFechamento;
	}

    public function getMesAnoAttribute() 
	{
		return $this->attributes['MES_ANO'];
	}

	public function setMesAnoAttribute($mesAno) 
	{
		$this->attributes['MES_ANO'] = $mesAno;
	}

    public function getMesAttribute() 
	{
		return $this->attributes['MES'];
	}

	public function setMesAttribute($mes) 
	{
		$this->attributes['MES'] = $mes;
	}

    public function getAnoAttribute() 
	{
		return $this->attributes['ANO'];
	}

	public function setAnoAttribute($ano) 
	{
		$this->attributes['ANO'] = $ano;
	}

    public function getSaldoAnteriorAttribute() 
	{
		return $this->attributes['SALDO_ANTERIOR'];
	}

	public function setSaldoAnteriorAttribute($saldoAnterior) 
	{
		$this->attributes['SALDO_ANTERIOR'] = $saldoAnterior;
	}

    public function getRecebimentosAttribute() 
	{
		return $this->attributes['RECEBIMENTOS'];
	}

	public function setRecebimentosAttribute($recebimentos) 
	{
		$this->attributes['RECEBIMENTOS'] = $recebimentos;
	}

    public function getPagamentosAttribute() 
	{
		return $this->attributes['PAGAMENTOS'];
	}

	public function setPagamentosAttribute($pagamentos) 
	{
		$this->attributes['PAGAMENTOS'] = $pagamentos;
	}

    public function getSaldoContaAttribute() 
	{
		return $this->attributes['SALDO_CONTA'];
	}

	public function setSaldoContaAttribute($saldoConta) 
	{
		$this->attributes['SALDO_CONTA'] = $saldoConta;
	}

    public function getChequeNaoCompensadoAttribute() 
	{
		return $this->attributes['CHEQUE_NAO_COMPENSADO'];
	}

	public function setChequeNaoCompensadoAttribute($chequeNaoCompensado) 
	{
		$this->attributes['CHEQUE_NAO_COMPENSADO'] = $chequeNaoCompensado;
	}

    public function getSaldoDisponivelAttribute() 
	{
		return $this->attributes['SALDO_DISPONIVEL'];
	}

	public function setSaldoDisponivelAttribute($saldoDisponivel) 
	{
		$this->attributes['SALDO_DISPONIVEL'] = $saldoDisponivel;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setDataFechamentoAttribute($objeto->dataFechamento);
			$this->setMesAnoAttribute($objeto->mesAno);
			$this->setMesAttribute($objeto->mes);
			$this->setAnoAttribute($objeto->ano);
			$this->setSaldoAnteriorAttribute($objeto->saldoAnterior);
			$this->setRecebimentosAttribute($objeto->recebimentos);
			$this->setPagamentosAttribute($objeto->pagamentos);
			$this->setSaldoContaAttribute($objeto->saldoConta);
			$this->setChequeNaoCompensadoAttribute($objeto->chequeNaoCompensado);
			$this->setSaldoDisponivelAttribute($objeto->saldoDisponivel);

			// vincular objetos
			$bancoContaCaixa = new BancoContaCaixa();
			$bancoContaCaixa->mapear($objeto->bancoContaCaixa);
			$this->bancoContaCaixa()->associate($bancoContaCaixa);

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
			'dataFechamento' => $this->getDataFechamentoAttribute(),
			'mesAno' => $this->getMesAnoAttribute(),
			'mes' => $this->getMesAttribute(),
			'ano' => $this->getAnoAttribute(),
			'saldoAnterior' => $this->getSaldoAnteriorAttribute(),
			'recebimentos' => $this->getRecebimentosAttribute(),
			'pagamentos' => $this->getPagamentosAttribute(),
			'saldoConta' => $this->getSaldoContaAttribute(),
			'chequeNaoCompensado' => $this->getChequeNaoCompensadoAttribute(),
			'saldoDisponivel' => $this->getSaldoDisponivelAttribute(),
			'bancoContaCaixa' => $this->bancoContaCaixa,
        ];
    }
}