<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [FIN_EXTRATO_CONTA_BANCO] 
                                                                                
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

class FinExtratoContaBanco extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'FIN_EXTRATO_CONTA_BANCO';

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

    public function getDataMovimentoAttribute() 
	{
		return $this->attributes['DATA_MOVIMENTO'];
	}

	public function setDataMovimentoAttribute($dataMovimento) 
	{
		$this->attributes['DATA_MOVIMENTO'] = $dataMovimento;
	}

    public function getDataBalanceteAttribute() 
	{
		return $this->attributes['DATA_BALANCETE'];
	}

	public function setDataBalanceteAttribute($dataBalancete) 
	{
		$this->attributes['DATA_BALANCETE'] = $dataBalancete;
	}

    public function getHistoricoAttribute() 
	{
		return $this->attributes['HISTORICO'];
	}

	public function setHistoricoAttribute($historico) 
	{
		$this->attributes['HISTORICO'] = $historico;
	}

    public function getDocumentoAttribute() 
	{
		return $this->attributes['DOCUMENTO'];
	}

	public function setDocumentoAttribute($documento) 
	{
		$this->attributes['DOCUMENTO'] = $documento;
	}

    public function getValorAttribute() 
	{
		return $this->attributes['VALOR'];
	}

	public function setValorAttribute($valor) 
	{
		$this->attributes['VALOR'] = $valor;
	}

    public function getConciliadoAttribute() 
	{
		return $this->attributes['CONCILIADO'];
	}

	public function setConciliadoAttribute($conciliado) 
	{
		$this->attributes['CONCILIADO'] = $conciliado;
	}

    public function getObservacaoAttribute() 
	{
		return $this->attributes['OBSERVACAO'];
	}

	public function setObservacaoAttribute($observacao) 
	{
		$this->attributes['OBSERVACAO'] = $observacao;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setMesAnoAttribute($objeto->mesAno);
			$this->setMesAttribute($objeto->mes);
			$this->setAnoAttribute($objeto->ano);
			$this->setDataMovimentoAttribute($objeto->dataMovimento);
			$this->setDataBalanceteAttribute($objeto->dataBalancete);
			$this->setHistoricoAttribute($objeto->historico);
			$this->setDocumentoAttribute($objeto->documento);
			$this->setValorAttribute($objeto->valor);
			$this->setConciliadoAttribute($objeto->conciliado);
			$this->setObservacaoAttribute($objeto->observacao);

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
			'mesAno' => $this->getMesAnoAttribute(),
			'mes' => $this->getMesAttribute(),
			'ano' => $this->getAnoAttribute(),
			'dataMovimento' => $this->getDataMovimentoAttribute(),
			'dataBalancete' => $this->getDataBalanceteAttribute(),
			'historico' => $this->getHistoricoAttribute(),
			'documento' => $this->getDocumentoAttribute(),
			'valor' => $this->getValorAttribute(),
			'conciliado' => $this->getConciliadoAttribute(),
			'observacao' => $this->getObservacaoAttribute(),
			'bancoContaCaixa' => $this->bancoContaCaixa,
        ];
    }
}