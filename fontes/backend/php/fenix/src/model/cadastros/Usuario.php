<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [USUARIO] 
                                                                                
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

class Usuario extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'USUARIO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['papel', ];
	
    /**
     * Relations
     */
    public function papel()
    {
    	return $this->belongsTo(Papel::class, 'ID_PAPEL', 'ID');
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

    public function getLoginAttribute() 
	{
		return $this->attributes['LOGIN'];
	}

	public function setLoginAttribute($login) 
	{
		$this->attributes['LOGIN'] = $login;
	}

    public function getSenhaAttribute() 
	{
		return $this->attributes['SENHA'];
	}

	public function setSenhaAttribute($senha) 
	{
		$this->attributes['SENHA'] = $senha;
	}

    public function getAdministradorAttribute() 
	{
		return $this->attributes['ADMINISTRADOR'];
	}

	public function setAdministradorAttribute($administrador) 
	{
		$this->attributes['ADMINISTRADOR'] = $administrador;
	}

    public function getDataCadastroAttribute() 
	{
		return $this->attributes['DATA_CADASTRO'];
	}

	public function setDataCadastroAttribute($dataCadastro) 
	{
		$this->attributes['DATA_CADASTRO'] = $dataCadastro;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setLoginAttribute($objeto->login);
			$this->setSenhaAttribute($objeto->senha);
			$this->setAdministradorAttribute($objeto->administrador);
			$this->setDataCadastroAttribute($objeto->dataCadastro);

			// vincular objetos
			$papel = new Papel();
			$papel->mapear($objeto->papel);
			$this->papel()->associate($papel);

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
			'login' => $this->getLoginAttribute(),
			'senha' => $this->getSenhaAttribute(),
			'administrador' => $this->getAdministradorAttribute(),
			'dataCadastro' => $this->getDataCadastroAttribute(),
			'papel' => $this->papel,
        ];
    }
}