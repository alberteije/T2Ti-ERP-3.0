<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [BANCO_AGENCIA] 
                                                                                
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

class BancoAgencia extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'BANCO_AGENCIA';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['banco', ];
	
    /**
     * Relations
     */
    public function banco()
    {
    	return $this->belongsTo(Banco::class, 'ID_BANCO', 'ID');
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

    public function getNumeroAttribute() 
	{
		return $this->attributes['NUMERO'];
	}

	public function setNumeroAttribute($numero) 
	{
		$this->attributes['NUMERO'] = $numero;
	}

    public function getDigitoAttribute() 
	{
		return $this->attributes['DIGITO'];
	}

	public function setDigitoAttribute($digito) 
	{
		$this->attributes['DIGITO'] = $digito;
	}

    public function getNomeAttribute() 
	{
		return $this->attributes['NOME'];
	}

	public function setNomeAttribute($nome) 
	{
		$this->attributes['NOME'] = $nome;
	}

    public function getTelefoneAttribute() 
	{
		return $this->attributes['TELEFONE'];
	}

	public function setTelefoneAttribute($telefone) 
	{
		$this->attributes['TELEFONE'] = $telefone;
	}

    public function getContatoAttribute() 
	{
		return $this->attributes['CONTATO'];
	}

	public function setContatoAttribute($contato) 
	{
		$this->attributes['CONTATO'] = $contato;
	}

    public function getObservacaoAttribute() 
	{
		return $this->attributes['OBSERVACAO'];
	}

	public function setObservacaoAttribute($observacao) 
	{
		$this->attributes['OBSERVACAO'] = $observacao;
	}

    public function getGerenteAttribute() 
	{
		return $this->attributes['GERENTE'];
	}

	public function setGerenteAttribute($gerente) 
	{
		$this->attributes['GERENTE'] = $gerente;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setNumeroAttribute($objeto->numero);
			$this->setDigitoAttribute($objeto->digito);
			$this->setNomeAttribute($objeto->nome);
			$this->setTelefoneAttribute($objeto->telefone);
			$this->setContatoAttribute($objeto->contato);
			$this->setObservacaoAttribute($objeto->observacao);
			$this->setGerenteAttribute($objeto->gerente);

			// vincular objetos
			$banco = new Banco();
			$banco->mapear($objeto->banco);
			$this->banco()->associate($banco);

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
			'numero' => $this->getNumeroAttribute(),
			'digito' => $this->getDigitoAttribute(),
			'nome' => $this->getNomeAttribute(),
			'telefone' => $this->getTelefoneAttribute(),
			'contato' => $this->getContatoAttribute(),
			'observacao' => $this->getObservacaoAttribute(),
			'gerente' => $this->getGerenteAttribute(),
			'banco' => $this->banco,
        ];
    }
}