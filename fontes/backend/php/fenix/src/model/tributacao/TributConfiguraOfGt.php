<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [TRIBUT_CONFIGURA_OF_GT] 
                                                                                
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

class TributConfiguraOfGt extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'TRIBUT_CONFIGURA_OF_GT';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['tributCofins', 'listaTributIcmsUf', 'tributIpi', 'tributPis', 'tributGrupoTributario', 'tributOperacaoFiscal', ];
	
    /**
     * Relations
     */
    public function tributCofins()
    {
    	return $this->hasOne(TributCofins::class, 'ID_TRIBUT_CONFIGURA_OF_GT', 'ID');
    }

    public function listaTributIcmsUf()
    {
    	return $this->hasMany(TributIcmsUf::class, 'ID_TRIBUT_CONFIGURA_OF_GT', 'ID');
    }

    public function tributIpi()
    {
    	return $this->hasOne(TributIpi::class, 'ID_TRIBUT_CONFIGURA_OF_GT', 'ID');
    }

    public function tributPis()
    {
    	return $this->hasOne(TributPis::class, 'ID_TRIBUT_CONFIGURA_OF_GT', 'ID');
    }

    public function tributGrupoTributario()
    {
    	return $this->belongsTo(TributGrupoTributario::class, 'ID_TRIBUT_GRUPO_TRIBUTARIO', 'ID');
    }

    public function tributOperacaoFiscal()
    {
    	return $this->belongsTo(TributOperacaoFiscal::class, 'ID_TRIBUT_OPERACAO_FISCAL', 'ID');
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


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);


			// vincular objetos
			$tributGrupoTributario = new TributGrupoTributario();
			$tributGrupoTributario->mapear($objeto->tributGrupoTributario);
			$this->tributGrupoTributario()->associate($tributGrupoTributario);

			$tributOperacaoFiscal = new TributOperacaoFiscal();
			$tributOperacaoFiscal->mapear($objeto->tributOperacaoFiscal);
			$this->tributOperacaoFiscal()->associate($tributOperacaoFiscal);

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
			'tributCofins' => $this->tributCofins,
			'tributIpi' => $this->tributIpi,
			'tributPis' => $this->tributPis,
			'tributGrupoTributario' => $this->tributGrupoTributario,
			'tributOperacaoFiscal' => $this->tributOperacaoFiscal,
			'listaTributIcmsUf' => $this->listaTributIcmsUf,
        ];
    }
}