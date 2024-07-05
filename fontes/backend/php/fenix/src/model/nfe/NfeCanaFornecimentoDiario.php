<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [NFE_CANA_FORNECIMENTO_DIARIO] 
                                                                                
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

class NfeCanaFornecimentoDiario extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'NFE_CANA_FORNECIMENTO_DIARIO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
	
    /**
     * Relations
     */
    public function nfeCana()
    {
    	return $this->belongsTo(NfeCana::class, 'ID_NFE_CANA', 'ID');
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

    public function getDiaAttribute() 
	{
		return $this->attributes['DIA'];
	}

	public function setDiaAttribute($dia) 
	{
		$this->attributes['DIA'] = $dia;
	}

    public function getQuantidadeAttribute() 
	{
		return (double)$this->attributes['QUANTIDADE'];
	}

	public function setQuantidadeAttribute($quantidade) 
	{
		$this->attributes['QUANTIDADE'] = $quantidade;
	}

    public function getQuantidadeTotalMesAttribute() 
	{
		return (double)$this->attributes['QUANTIDADE_TOTAL_MES'];
	}

	public function setQuantidadeTotalMesAttribute($quantidadeTotalMes) 
	{
		$this->attributes['QUANTIDADE_TOTAL_MES'] = $quantidadeTotalMes;
	}

    public function getQuantidadeTotalAnteriorAttribute() 
	{
		return (double)$this->attributes['QUANTIDADE_TOTAL_ANTERIOR'];
	}

	public function setQuantidadeTotalAnteriorAttribute($quantidadeTotalAnterior) 
	{
		$this->attributes['QUANTIDADE_TOTAL_ANTERIOR'] = $quantidadeTotalAnterior;
	}

    public function getQuantidadeTotalGeralAttribute() 
	{
		return (double)$this->attributes['QUANTIDADE_TOTAL_GERAL'];
	}

	public function setQuantidadeTotalGeralAttribute($quantidadeTotalGeral) 
	{
		$this->attributes['QUANTIDADE_TOTAL_GERAL'] = $quantidadeTotalGeral;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setDiaAttribute($objeto->dia);
			$this->setQuantidadeAttribute($objeto->quantidade);
			$this->setQuantidadeTotalMesAttribute($objeto->quantidadeTotalMes);
			$this->setQuantidadeTotalAnteriorAttribute($objeto->quantidadeTotalAnterior);
			$this->setQuantidadeTotalGeralAttribute($objeto->quantidadeTotalGeral);

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
			'dia' => $this->getDiaAttribute(),
			'quantidade' => $this->getQuantidadeAttribute(),
			'quantidadeTotalMes' => $this->getQuantidadeTotalMesAttribute(),
			'quantidadeTotalAnterior' => $this->getQuantidadeTotalAnteriorAttribute(),
			'quantidadeTotalGeral' => $this->getQuantidadeTotalGeralAttribute(),
        ];
    }
}