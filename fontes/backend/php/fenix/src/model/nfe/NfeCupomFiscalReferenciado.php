<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [NFE_CUPOM_FISCAL_REFERENCIADO] 
                                                                                
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

class NfeCupomFiscalReferenciado extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'NFE_CUPOM_FISCAL_REFERENCIADO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
	
    /**
     * Relations
     */
    public function nfeCabecalho()
    {
    	return $this->belongsTo(NfeCabecalho::class, 'ID_NFE_CABECALHO', 'ID');
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

    public function getModeloDocumentoFiscalAttribute() 
	{
		return $this->attributes['MODELO_DOCUMENTO_FISCAL'];
	}

	public function setModeloDocumentoFiscalAttribute($modeloDocumentoFiscal) 
	{
		$this->attributes['MODELO_DOCUMENTO_FISCAL'] = $modeloDocumentoFiscal;
	}

    public function getNumeroOrdemEcfAttribute() 
	{
		return $this->attributes['NUMERO_ORDEM_ECF'];
	}

	public function setNumeroOrdemEcfAttribute($numeroOrdemEcf) 
	{
		$this->attributes['NUMERO_ORDEM_ECF'] = $numeroOrdemEcf;
	}

    public function getCooAttribute() 
	{
		return $this->attributes['COO'];
	}

	public function setCooAttribute($coo) 
	{
		$this->attributes['COO'] = $coo;
	}

    public function getDataEmissaoCupomAttribute() 
	{
		return $this->attributes['DATA_EMISSAO_CUPOM'];
	}

	public function setDataEmissaoCupomAttribute($dataEmissaoCupom) 
	{
		$this->attributes['DATA_EMISSAO_CUPOM'] = $dataEmissaoCupom;
	}

    public function getNumeroCaixaAttribute() 
	{
		return $this->attributes['NUMERO_CAIXA'];
	}

	public function setNumeroCaixaAttribute($numeroCaixa) 
	{
		$this->attributes['NUMERO_CAIXA'] = $numeroCaixa;
	}

    public function getNumeroSerieEcfAttribute() 
	{
		return $this->attributes['NUMERO_SERIE_ECF'];
	}

	public function setNumeroSerieEcfAttribute($numeroSerieEcf) 
	{
		$this->attributes['NUMERO_SERIE_ECF'] = $numeroSerieEcf;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setModeloDocumentoFiscalAttribute($objeto->modeloDocumentoFiscal);
			$this->setNumeroOrdemEcfAttribute($objeto->numeroOrdemEcf);
			$this->setCooAttribute($objeto->coo);
			$this->setDataEmissaoCupomAttribute($objeto->dataEmissaoCupom);
			$this->setNumeroCaixaAttribute($objeto->numeroCaixa);
			$this->setNumeroSerieEcfAttribute($objeto->numeroSerieEcf);

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
			'modeloDocumentoFiscal' => $this->getModeloDocumentoFiscalAttribute(),
			'numeroOrdemEcf' => $this->getNumeroOrdemEcfAttribute(),
			'coo' => $this->getCooAttribute(),
			'dataEmissaoCupom' => $this->getDataEmissaoCupomAttribute(),
			'numeroCaixa' => $this->getNumeroCaixaAttribute(),
			'numeroSerieEcf' => $this->getNumeroSerieEcfAttribute(),
        ];
    }
}