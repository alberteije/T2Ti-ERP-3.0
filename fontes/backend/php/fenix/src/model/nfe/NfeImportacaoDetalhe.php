<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [NFE_IMPORTACAO_DETALHE] 
                                                                                
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

class NfeImportacaoDetalhe extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'NFE_IMPORTACAO_DETALHE';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
	
    /**
     * Relations
     */
    public function nfeDeclaracaoImportacao()
    {
    	return $this->belongsTo(NfeDeclaracaoImportacao::class, 'ID_NFE_DECLARACAO_IMPORTACAO', 'ID');
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

    public function getNumeroAdicaoAttribute() 
	{
		return $this->attributes['NUMERO_ADICAO'];
	}

	public function setNumeroAdicaoAttribute($numeroAdicao) 
	{
		$this->attributes['NUMERO_ADICAO'] = $numeroAdicao;
	}

    public function getNumeroSequencialAttribute() 
	{
		return $this->attributes['NUMERO_SEQUENCIAL'];
	}

	public function setNumeroSequencialAttribute($numeroSequencial) 
	{
		$this->attributes['NUMERO_SEQUENCIAL'] = $numeroSequencial;
	}

    public function getCodigoFabricanteEstrangeiroAttribute() 
	{
		return $this->attributes['CODIGO_FABRICANTE_ESTRANGEIRO'];
	}

	public function setCodigoFabricanteEstrangeiroAttribute($codigoFabricanteEstrangeiro) 
	{
		$this->attributes['CODIGO_FABRICANTE_ESTRANGEIRO'] = $codigoFabricanteEstrangeiro;
	}

    public function getValorDescontoAttribute() 
	{
		return (double)$this->attributes['VALOR_DESCONTO'];
	}

	public function setValorDescontoAttribute($valorDesconto) 
	{
		$this->attributes['VALOR_DESCONTO'] = $valorDesconto;
	}

    public function getDrawbackAttribute() 
	{
		return $this->attributes['DRAWBACK'];
	}

	public function setDrawbackAttribute($drawback) 
	{
		$this->attributes['DRAWBACK'] = $drawback;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setNumeroAdicaoAttribute($objeto->numeroAdicao);
			$this->setNumeroSequencialAttribute($objeto->numeroSequencial);
			$this->setCodigoFabricanteEstrangeiroAttribute($objeto->codigoFabricanteEstrangeiro);
			$this->setValorDescontoAttribute($objeto->valorDesconto);
			$this->setDrawbackAttribute($objeto->drawback);

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
			'numeroAdicao' => $this->getNumeroAdicaoAttribute(),
			'numeroSequencial' => $this->getNumeroSequencialAttribute(),
			'codigoFabricanteEstrangeiro' => $this->getCodigoFabricanteEstrangeiroAttribute(),
			'valorDesconto' => $this->getValorDescontoAttribute(),
			'drawback' => $this->getDrawbackAttribute(),
        ];
    }
}