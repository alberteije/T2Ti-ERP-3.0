<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [MDFE_RODOVIARIO_PEDAGIO] 
                                                                                
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

class MdfeRodoviarioPedagio extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'MDFE_RODOVIARIO_PEDAGIO';

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

    public function getIdMdfeRodoviarioAttribute() 
	{
		return $this->attributes['ID_MDFE_RODOVIARIO'];
	}

	public function setIdMdfeRodoviarioAttribute($idMdfeRodoviario) 
	{
		$this->attributes['ID_MDFE_RODOVIARIO'] = $idMdfeRodoviario;
	}

    public function getCnpjFornecedorAttribute() 
	{
		return $this->attributes['CNPJ_FORNECEDOR'];
	}

	public function setCnpjFornecedorAttribute($cnpjFornecedor) 
	{
		$this->attributes['CNPJ_FORNECEDOR'] = $cnpjFornecedor;
	}

    public function getCnpjResponsavelAttribute() 
	{
		return $this->attributes['CNPJ_RESPONSAVEL'];
	}

	public function setCnpjResponsavelAttribute($cnpjResponsavel) 
	{
		$this->attributes['CNPJ_RESPONSAVEL'] = $cnpjResponsavel;
	}

    public function getCpfResponsavelAttribute() 
	{
		return $this->attributes['CPF_RESPONSAVEL'];
	}

	public function setCpfResponsavelAttribute($cpfResponsavel) 
	{
		$this->attributes['CPF_RESPONSAVEL'] = $cpfResponsavel;
	}

    public function getNumeroComprovanteAttribute() 
	{
		return $this->attributes['NUMERO_COMPROVANTE'];
	}

	public function setNumeroComprovanteAttribute($numeroComprovante) 
	{
		$this->attributes['NUMERO_COMPROVANTE'] = $numeroComprovante;
	}

    public function getValorAttribute() 
	{
		return $this->attributes['VALOR'];
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

			$this->setIdMdfeRodoviarioAttribute($objeto->idMdfeRodoviario);
			$this->setCnpjFornecedorAttribute($objeto->cnpjFornecedor);
			$this->setCnpjResponsavelAttribute($objeto->cnpjResponsavel);
			$this->setCpfResponsavelAttribute($objeto->cpfResponsavel);
			$this->setNumeroComprovanteAttribute($objeto->numeroComprovante);
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
			'idMdfeRodoviario' => $this->getIdMdfeRodoviarioAttribute(),
			'cnpjFornecedor' => $this->getCnpjFornecedorAttribute(),
			'cnpjResponsavel' => $this->getCnpjResponsavelAttribute(),
			'cpfResponsavel' => $this->getCpfResponsavelAttribute(),
			'numeroComprovante' => $this->getNumeroComprovanteAttribute(),
			'valor' => $this->getValorAttribute(),
        ];
    }
}