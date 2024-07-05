<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [FIN_CHEQUE_RECEBIDO] 
                                                                                
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

class FinChequeRecebido extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'FIN_CHEQUE_RECEBIDO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['pessoa', ];
	
    /**
     * Relations
     */
    public function pessoa()
    {
    	return $this->belongsTo(Pessoa::class, 'ID_PESSOA', 'ID');
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

    public function getCpfAttribute() 
	{
		return $this->attributes['CPF'];
	}

	public function setCpfAttribute($cpf) 
	{
		$this->attributes['CPF'] = $cpf;
	}

    public function getCnpjAttribute() 
	{
		return $this->attributes['CNPJ'];
	}

	public function setCnpjAttribute($cnpj) 
	{
		$this->attributes['CNPJ'] = $cnpj;
	}

    public function getNomeAttribute() 
	{
		return $this->attributes['NOME'];
	}

	public function setNomeAttribute($nome) 
	{
		$this->attributes['NOME'] = $nome;
	}

    public function getCodigoBancoAttribute() 
	{
		return $this->attributes['CODIGO_BANCO'];
	}

	public function setCodigoBancoAttribute($codigoBanco) 
	{
		$this->attributes['CODIGO_BANCO'] = $codigoBanco;
	}

    public function getCodigoAgenciaAttribute() 
	{
		return $this->attributes['CODIGO_AGENCIA'];
	}

	public function setCodigoAgenciaAttribute($codigoAgencia) 
	{
		$this->attributes['CODIGO_AGENCIA'] = $codigoAgencia;
	}

    public function getContaAttribute() 
	{
		return $this->attributes['CONTA'];
	}

	public function setContaAttribute($conta) 
	{
		$this->attributes['CONTA'] = $conta;
	}

    public function getNumeroAttribute() 
	{
		return $this->attributes['NUMERO'];
	}

	public function setNumeroAttribute($numero) 
	{
		$this->attributes['NUMERO'] = $numero;
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

    public function getCustodiaDataAttribute() 
	{
		return $this->attributes['CUSTODIA_DATA'];
	}

	public function setCustodiaDataAttribute($custodiaData) 
	{
		$this->attributes['CUSTODIA_DATA'] = $custodiaData;
	}

    public function getCustodiaTarifaAttribute() 
	{
		return $this->attributes['CUSTODIA_TARIFA'];
	}

	public function setCustodiaTarifaAttribute($custodiaTarifa) 
	{
		$this->attributes['CUSTODIA_TARIFA'] = $custodiaTarifa;
	}

    public function getCustodiaComissaoAttribute() 
	{
		return $this->attributes['CUSTODIA_COMISSAO'];
	}

	public function setCustodiaComissaoAttribute($custodiaComissao) 
	{
		$this->attributes['CUSTODIA_COMISSAO'] = $custodiaComissao;
	}

    public function getDescontoDataAttribute() 
	{
		return $this->attributes['DESCONTO_DATA'];
	}

	public function setDescontoDataAttribute($descontoData) 
	{
		$this->attributes['DESCONTO_DATA'] = $descontoData;
	}

    public function getDescontoTarifaAttribute() 
	{
		return $this->attributes['DESCONTO_TARIFA'];
	}

	public function setDescontoTarifaAttribute($descontoTarifa) 
	{
		$this->attributes['DESCONTO_TARIFA'] = $descontoTarifa;
	}

    public function getDescontoComissaoAttribute() 
	{
		return $this->attributes['DESCONTO_COMISSAO'];
	}

	public function setDescontoComissaoAttribute($descontoComissao) 
	{
		$this->attributes['DESCONTO_COMISSAO'] = $descontoComissao;
	}

    public function getValorRecebidoAttribute() 
	{
		return $this->attributes['VALOR_RECEBIDO'];
	}

	public function setValorRecebidoAttribute($valorRecebido) 
	{
		$this->attributes['VALOR_RECEBIDO'] = $valorRecebido;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setCpfAttribute($objeto->cpf);
			$this->setCnpjAttribute($objeto->cnpj);
			$this->setNomeAttribute($objeto->nome);
			$this->setCodigoBancoAttribute($objeto->codigoBanco);
			$this->setCodigoAgenciaAttribute($objeto->codigoAgencia);
			$this->setContaAttribute($objeto->conta);
			$this->setNumeroAttribute($objeto->numero);
			$this->setDataEmissaoAttribute($objeto->dataEmissao);
			$this->setBomParaAttribute($objeto->bomPara);
			$this->setDataCompensacaoAttribute($objeto->dataCompensacao);
			$this->setValorAttribute($objeto->valor);
			$this->setCustodiaDataAttribute($objeto->custodiaData);
			$this->setCustodiaTarifaAttribute($objeto->custodiaTarifa);
			$this->setCustodiaComissaoAttribute($objeto->custodiaComissao);
			$this->setDescontoDataAttribute($objeto->descontoData);
			$this->setDescontoTarifaAttribute($objeto->descontoTarifa);
			$this->setDescontoComissaoAttribute($objeto->descontoComissao);
			$this->setValorRecebidoAttribute($objeto->valorRecebido);

			// vincular objetos
			$pessoa = new Pessoa();
			$pessoa->mapear($objeto->pessoa);
			$this->pessoa()->associate($pessoa);

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
			'cpf' => $this->getCpfAttribute(),
			'cnpj' => $this->getCnpjAttribute(),
			'nome' => $this->getNomeAttribute(),
			'codigoBanco' => $this->getCodigoBancoAttribute(),
			'codigoAgencia' => $this->getCodigoAgenciaAttribute(),
			'conta' => $this->getContaAttribute(),
			'numero' => $this->getNumeroAttribute(),
			'dataEmissao' => $this->getDataEmissaoAttribute(),
			'bomPara' => $this->getBomParaAttribute(),
			'dataCompensacao' => $this->getDataCompensacaoAttribute(),
			'valor' => $this->getValorAttribute(),
			'custodiaData' => $this->getCustodiaDataAttribute(),
			'custodiaTarifa' => $this->getCustodiaTarifaAttribute(),
			'custodiaComissao' => $this->getCustodiaComissaoAttribute(),
			'descontoData' => $this->getDescontoDataAttribute(),
			'descontoTarifa' => $this->getDescontoTarifaAttribute(),
			'descontoComissao' => $this->getDescontoComissaoAttribute(),
			'valorRecebido' => $this->getValorRecebidoAttribute(),
			'pessoa' => $this->pessoa,
        ];
    }
}