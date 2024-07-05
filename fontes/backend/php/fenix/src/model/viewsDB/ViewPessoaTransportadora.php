<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [VIEW_PESSOA_TRANSPORTADORA] 
                                                                                
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

class ViewPessoaTransportadora extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'VIEW_PESSOA_TRANSPORTADORA';

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

    public function getEmailAttribute() 
	{
		return $this->attributes['EMAIL'];
	}

	public function setEmailAttribute($email) 
	{
		$this->attributes['EMAIL'] = $email;
	}

    public function getSiteAttribute() 
	{
		return $this->attributes['SITE'];
	}

	public function setSiteAttribute($site) 
	{
		$this->attributes['SITE'] = $site;
	}

    public function getCpfCnpjAttribute() 
	{
		return $this->attributes['CPF_CNPJ'];
	}

	public function setCpfCnpjAttribute($cpfCnpj) 
	{
		$this->attributes['CPF_CNPJ'] = $cpfCnpj;
	}

    public function getRgIeAttribute() 
	{
		return $this->attributes['RG_IE'];
	}

	public function setRgIeAttribute($rgIe) 
	{
		$this->attributes['RG_IE'] = $rgIe;
	}

    public function getDataCadastroAttribute() 
	{
		return $this->attributes['DATA_CADASTRO'];
	}

	public function setDataCadastroAttribute($dataCadastro) 
	{
		$this->attributes['DATA_CADASTRO'] = $dataCadastro;
	}

    public function getObservacaoAttribute() 
	{
		return $this->attributes['OBSERVACAO'];
	}

	public function setObservacaoAttribute($observacao) 
	{
		$this->attributes['OBSERVACAO'] = $observacao;
	}

    public function getIdPessoaAttribute() 
	{
		return $this->attributes['ID_PESSOA'];
	}

	public function setIdPessoaAttribute($idPessoa) 
	{
		$this->attributes['ID_PESSOA'] = $idPessoa;
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
			$this->setEmailAttribute($objeto->email);
			$this->setSiteAttribute($objeto->site);
			$this->setCpfCnpjAttribute($objeto->cpfCnpj);
			$this->setRgIeAttribute($objeto->rgIe);
			$this->setDataCadastroAttribute($objeto->dataCadastro);
			$this->setObservacaoAttribute($objeto->observacao);
			$this->setIdPessoaAttribute($objeto->idPessoa);

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
			'email' => $this->getEmailAttribute(),
			'site' => $this->getSiteAttribute(),
			'cpfCnpj' => $this->getCpfCnpjAttribute(),
			'rgIe' => $this->getRgIeAttribute(),
			'dataCadastro' => $this->getDataCadastroAttribute(),
			'observacao' => $this->getObservacaoAttribute(),
			'idPessoa' => $this->getIdPessoaAttribute(),
        ];
    }
}