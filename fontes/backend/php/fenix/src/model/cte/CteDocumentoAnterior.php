<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [CTE_DOCUMENTO_ANTERIOR] 
                                                                                
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

class CteDocumentoAnterior extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'CTE_DOCUMENTO_ANTERIOR';

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

    public function getIdCteCabecalhoAttribute() 
	{
		return $this->attributes['ID_CTE_CABECALHO'];
	}

	public function setIdCteCabecalhoAttribute($idCteCabecalho) 
	{
		$this->attributes['ID_CTE_CABECALHO'] = $idCteCabecalho;
	}

    public function getCnpjAttribute() 
	{
		return $this->attributes['CNPJ'];
	}

	public function setCnpjAttribute($cnpj) 
	{
		$this->attributes['CNPJ'] = $cnpj;
	}

    public function getCpfAttribute() 
	{
		return $this->attributes['CPF'];
	}

	public function setCpfAttribute($cpf) 
	{
		$this->attributes['CPF'] = $cpf;
	}

    public function getIeAttribute() 
	{
		return $this->attributes['IE'];
	}

	public function setIeAttribute($ie) 
	{
		$this->attributes['IE'] = $ie;
	}

    public function getUfAttribute() 
	{
		return $this->attributes['UF'];
	}

	public function setUfAttribute($uf) 
	{
		$this->attributes['UF'] = $uf;
	}

    public function getNomeAttribute() 
	{
		return $this->attributes['NOME'];
	}

	public function setNomeAttribute($nome) 
	{
		$this->attributes['NOME'] = $nome;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdCteCabecalhoAttribute($objeto->idCteCabecalho);
			$this->setCnpjAttribute($objeto->cnpj);
			$this->setCpfAttribute($objeto->cpf);
			$this->setIeAttribute($objeto->ie);
			$this->setUfAttribute($objeto->uf);
			$this->setNomeAttribute($objeto->nome);

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
			'idCteCabecalho' => $this->getIdCteCabecalhoAttribute(),
			'cnpj' => $this->getCnpjAttribute(),
			'cpf' => $this->getCpfAttribute(),
			'ie' => $this->getIeAttribute(),
			'uf' => $this->getUfAttribute(),
			'nome' => $this->getNomeAttribute(),
        ];
    }
}