<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [FOLHA_RESCISAO] 
                                                                                
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

class FolhaRescisao extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'FOLHA_RESCISAO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['colaborador', ];
	
    /**
     * Relations
     */
    public function colaborador()
    {
    	return $this->belongsTo(Colaborador::class, 'ID_COLABORADOR', 'ID');
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

    public function getDataDemissaoAttribute() 
	{
		return $this->attributes['DATA_DEMISSAO'];
	}

	public function setDataDemissaoAttribute($dataDemissao) 
	{
		$this->attributes['DATA_DEMISSAO'] = $dataDemissao;
	}

    public function getDataPagamentoAttribute() 
	{
		return $this->attributes['DATA_PAGAMENTO'];
	}

	public function setDataPagamentoAttribute($dataPagamento) 
	{
		$this->attributes['DATA_PAGAMENTO'] = $dataPagamento;
	}

    public function getMotivoAttribute() 
	{
		return $this->attributes['MOTIVO'];
	}

	public function setMotivoAttribute($motivo) 
	{
		$this->attributes['MOTIVO'] = $motivo;
	}

    public function getMotivoEsocialAttribute() 
	{
		return $this->attributes['MOTIVO_ESOCIAL'];
	}

	public function setMotivoEsocialAttribute($motivoEsocial) 
	{
		$this->attributes['MOTIVO_ESOCIAL'] = $motivoEsocial;
	}

    public function getDataAvisoPrevioAttribute() 
	{
		return $this->attributes['DATA_AVISO_PREVIO'];
	}

	public function setDataAvisoPrevioAttribute($dataAvisoPrevio) 
	{
		$this->attributes['DATA_AVISO_PREVIO'] = $dataAvisoPrevio;
	}

    public function getDiasAvisoPrevioAttribute() 
	{
		return $this->attributes['DIAS_AVISO_PREVIO'];
	}

	public function setDiasAvisoPrevioAttribute($diasAvisoPrevio) 
	{
		$this->attributes['DIAS_AVISO_PREVIO'] = $diasAvisoPrevio;
	}

    public function getComprovouNovoEmpregoAttribute() 
	{
		return $this->attributes['COMPROVOU_NOVO_EMPREGO'];
	}

	public function setComprovouNovoEmpregoAttribute($comprovouNovoEmprego) 
	{
		$this->attributes['COMPROVOU_NOVO_EMPREGO'] = $comprovouNovoEmprego;
	}

    public function getDispensouEmpregadoAttribute() 
	{
		return $this->attributes['DISPENSOU_EMPREGADO'];
	}

	public function setDispensouEmpregadoAttribute($dispensouEmpregado) 
	{
		$this->attributes['DISPENSOU_EMPREGADO'] = $dispensouEmpregado;
	}

    public function getPensaoAlimenticiaAttribute() 
	{
		return $this->attributes['PENSAO_ALIMENTICIA'];
	}

	public function setPensaoAlimenticiaAttribute($pensaoAlimenticia) 
	{
		$this->attributes['PENSAO_ALIMENTICIA'] = $pensaoAlimenticia;
	}

    public function getPensaoAlimenticiaFgtsAttribute() 
	{
		return $this->attributes['PENSAO_ALIMENTICIA_FGTS'];
	}

	public function setPensaoAlimenticiaFgtsAttribute($pensaoAlimenticiaFgts) 
	{
		$this->attributes['PENSAO_ALIMENTICIA_FGTS'] = $pensaoAlimenticiaFgts;
	}

    public function getFgtsValorRescisaoAttribute() 
	{
		return $this->attributes['FGTS_VALOR_RESCISAO'];
	}

	public function setFgtsValorRescisaoAttribute($fgtsValorRescisao) 
	{
		$this->attributes['FGTS_VALOR_RESCISAO'] = $fgtsValorRescisao;
	}

    public function getFgtsSaldoBancoAttribute() 
	{
		return $this->attributes['FGTS_SALDO_BANCO'];
	}

	public function setFgtsSaldoBancoAttribute($fgtsSaldoBanco) 
	{
		$this->attributes['FGTS_SALDO_BANCO'] = $fgtsSaldoBanco;
	}

    public function getFgtsComplementoSaldoAttribute() 
	{
		return $this->attributes['FGTS_COMPLEMENTO_SALDO'];
	}

	public function setFgtsComplementoSaldoAttribute($fgtsComplementoSaldo) 
	{
		$this->attributes['FGTS_COMPLEMENTO_SALDO'] = $fgtsComplementoSaldo;
	}

    public function getFgtsCodigoAfastamentoAttribute() 
	{
		return $this->attributes['FGTS_CODIGO_AFASTAMENTO'];
	}

	public function setFgtsCodigoAfastamentoAttribute($fgtsCodigoAfastamento) 
	{
		$this->attributes['FGTS_CODIGO_AFASTAMENTO'] = $fgtsCodigoAfastamento;
	}

    public function getFgtsCodigoSaqueAttribute() 
	{
		return $this->attributes['FGTS_CODIGO_SAQUE'];
	}

	public function setFgtsCodigoSaqueAttribute($fgtsCodigoSaque) 
	{
		$this->attributes['FGTS_CODIGO_SAQUE'] = $fgtsCodigoSaque;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setDataDemissaoAttribute($objeto->dataDemissao);
			$this->setDataPagamentoAttribute($objeto->dataPagamento);
			$this->setMotivoAttribute($objeto->motivo);
			$this->setMotivoEsocialAttribute($objeto->motivoEsocial);
			$this->setDataAvisoPrevioAttribute($objeto->dataAvisoPrevio);
			$this->setDiasAvisoPrevioAttribute($objeto->diasAvisoPrevio);
			$this->setComprovouNovoEmpregoAttribute($objeto->comprovouNovoEmprego);
			$this->setDispensouEmpregadoAttribute($objeto->dispensouEmpregado);
			$this->setPensaoAlimenticiaAttribute($objeto->pensaoAlimenticia);
			$this->setPensaoAlimenticiaFgtsAttribute($objeto->pensaoAlimenticiaFgts);
			$this->setFgtsValorRescisaoAttribute($objeto->fgtsValorRescisao);
			$this->setFgtsSaldoBancoAttribute($objeto->fgtsSaldoBanco);
			$this->setFgtsComplementoSaldoAttribute($objeto->fgtsComplementoSaldo);
			$this->setFgtsCodigoAfastamentoAttribute($objeto->fgtsCodigoAfastamento);
			$this->setFgtsCodigoSaqueAttribute($objeto->fgtsCodigoSaque);

			// vincular objetos
			$colaborador = new Colaborador();
			$colaborador->mapear($objeto->colaborador);
			$this->colaborador()->associate($colaborador);

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
			'dataDemissao' => $this->getDataDemissaoAttribute(),
			'dataPagamento' => $this->getDataPagamentoAttribute(),
			'motivo' => $this->getMotivoAttribute(),
			'motivoEsocial' => $this->getMotivoEsocialAttribute(),
			'dataAvisoPrevio' => $this->getDataAvisoPrevioAttribute(),
			'diasAvisoPrevio' => $this->getDiasAvisoPrevioAttribute(),
			'comprovouNovoEmprego' => $this->getComprovouNovoEmpregoAttribute(),
			'dispensouEmpregado' => $this->getDispensouEmpregadoAttribute(),
			'pensaoAlimenticia' => $this->getPensaoAlimenticiaAttribute(),
			'pensaoAlimenticiaFgts' => $this->getPensaoAlimenticiaFgtsAttribute(),
			'fgtsValorRescisao' => $this->getFgtsValorRescisaoAttribute(),
			'fgtsSaldoBanco' => $this->getFgtsSaldoBancoAttribute(),
			'fgtsComplementoSaldo' => $this->getFgtsComplementoSaldoAttribute(),
			'fgtsCodigoAfastamento' => $this->getFgtsCodigoAfastamentoAttribute(),
			'fgtsCodigoSaque' => $this->getFgtsCodigoSaqueAttribute(),
			'colaborador' => $this->colaborador,
        ];
    }
}