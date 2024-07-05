<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [FOLHA_INSS_RETENCAO] 
                                                                                
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

class FolhaInssRetencao extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'FOLHA_INSS_RETENCAO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['folhaInssServico', ];
	
    /**
     * Relations
     */
    public function folhaInss()
    {
    	return $this->belongsTo(FolhaInss::class, 'ID_FOLHA_INSS', 'ID');
    }

    public function folhaInssServico()
    {
    	return $this->belongsTo(FolhaInssServico::class, 'ID_FOLHA_INSS_SERVICO', 'ID');
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

    public function getValorMensalAttribute() 
	{
		return $this->attributes['VALOR_MENSAL'];
	}

	public function setValorMensalAttribute($valorMensal) 
	{
		$this->attributes['VALOR_MENSAL'] = $valorMensal;
	}

    public function getValor13Attribute() 
	{
		return $this->attributes['VALOR_13'];
	}

	public function setValor13Attribute($valor13) 
	{
		$this->attributes['VALOR_13'] = $valor13;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setValorMensalAttribute($objeto->valorMensal);
			$this->setValor13Attribute($objeto->valor13);

			// vincular objetos
			$folhaInssServico = new FolhaInssServico();
			$folhaInssServico->mapear($objeto->folhaInssServico);
			$this->folhaInssServico()->associate($folhaInssServico);

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
			'valorMensal' => $this->getValorMensalAttribute(),
			'valor13' => $this->getValor13Attribute(),
			'folhaInssServico' => $this->folhaInssServico,
        ];
    }
}