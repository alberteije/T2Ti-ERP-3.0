<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [PESSOA] 
                                                                                
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

class Pessoa extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'PESSOA';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['cliente', 'colaborador', 'listaPessoaContato', 'pessoaFisica', 'pessoaJuridica', ];
	
    /**
     * Relations
     */
    public function cliente()
    {
    	return $this->hasOne(Cliente::class, 'ID_PESSOA', 'ID');
    }

    public function colaborador()
    {
    	return $this->hasOne(Colaborador::class, 'ID_PESSOA', 'ID');
    }

    public function listaPessoaContato()
    {
    	return $this->hasMany(PessoaContato::class, 'ID_PESSOA', 'ID');
    }

    public function pessoaFisica()
    {
    	return $this->hasOne(PessoaFisica::class, 'ID_PESSOA', 'ID');
    }

    public function pessoaJuridica()
    {
    	return $this->hasOne(PessoaJuridica::class, 'ID_PESSOA', 'ID');
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

    public function getNomeAttribute() 
	{
		return $this->attributes['NOME'];
	}

	public function setNomeAttribute($nome) 
	{
		$this->attributes['NOME'] = $nome;
	}

    public function getTipoAttribute() 
	{
		return $this->attributes['TIPO'];
	}

	public function setTipoAttribute($tipo) 
	{
		$this->attributes['TIPO'] = $tipo;
	}

    public function getSiteAttribute() 
	{
		return $this->attributes['SITE'];
	}

	public function setSiteAttribute($site) 
	{
		$this->attributes['SITE'] = $site;
	}

    public function getEmailAttribute() 
	{
		return $this->attributes['EMAIL'];
	}

	public function setEmailAttribute($email) 
	{
		$this->attributes['EMAIL'] = $email;
	}

    public function getEhClienteAttribute() 
	{
		return $this->attributes['EH_CLIENTE'];
	}

	public function setEhClienteAttribute($ehCliente) 
	{
		$this->attributes['EH_CLIENTE'] = $ehCliente;
	}

    public function getEhFornecedorAttribute() 
	{
		return $this->attributes['EH_FORNECEDOR'];
	}

	public function setEhFornecedorAttribute($ehFornecedor) 
	{
		$this->attributes['EH_FORNECEDOR'] = $ehFornecedor;
	}

    public function getEhTransportadoraAttribute() 
	{
		return $this->attributes['EH_TRANSPORTADORA'];
	}

	public function setEhTransportadoraAttribute($ehTransportadora) 
	{
		$this->attributes['EH_TRANSPORTADORA'] = $ehTransportadora;
	}

    public function getEhColaboradorAttribute() 
	{
		return $this->attributes['EH_COLABORADOR'];
	}

	public function setEhColaboradorAttribute($ehColaborador) 
	{
		$this->attributes['EH_COLABORADOR'] = $ehColaborador;
	}

    public function getEhContadorAttribute() 
	{
		return $this->attributes['EH_CONTADOR'];
	}

	public function setEhContadorAttribute($ehContador) 
	{
		$this->attributes['EH_CONTADOR'] = $ehContador;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setNomeAttribute($objeto->nome);
			$this->setTipoAttribute($objeto->tipo);
			$this->setSiteAttribute($objeto->site);
			$this->setEmailAttribute($objeto->email);
			$this->setEhClienteAttribute($objeto->ehCliente);
			$this->setEhFornecedorAttribute($objeto->ehFornecedor);
			$this->setEhTransportadoraAttribute($objeto->ehTransportadora);
			$this->setEhColaboradorAttribute($objeto->ehColaborador);
			$this->setEhContadorAttribute($objeto->ehContador);

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
			'nome' => $this->getNomeAttribute(),
			'tipo' => $this->getTipoAttribute(),
			'site' => $this->getSiteAttribute(),
			'email' => $this->getEmailAttribute(),
			'ehCliente' => $this->getEhClienteAttribute(),
			'ehFornecedor' => $this->getEhFornecedorAttribute(),
			'ehTransportadora' => $this->getEhTransportadoraAttribute(),
			'ehColaborador' => $this->getEhColaboradorAttribute(),
			'ehContador' => $this->getEhContadorAttribute(),
			'cliente' => $this->cliente,
			'colaborador' => $this->colaborador,
			'pessoaFisica' => $this->pessoaFisica,
			'pessoaJuridica' => $this->pessoaJuridica,
			'listaPessoaContato' => $this->listaPessoaContato,
        ];
    }
}