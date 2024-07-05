<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [NFE_DECLARACAO_IMPORTACAO] 
                                                                                
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

class NfeDeclaracaoImportacao extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'NFE_DECLARACAO_IMPORTACAO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
	
    /**
     * Relations
     */
    public function nfeDetalhe()
    {
    	return $this->belongsTo(NfeDetalhe::class, 'ID_NFE_DETALHE', 'ID');
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

    public function getNumeroDocumentoAttribute() 
	{
		return $this->attributes['NUMERO_DOCUMENTO'];
	}

	public function setNumeroDocumentoAttribute($numeroDocumento) 
	{
		$this->attributes['NUMERO_DOCUMENTO'] = $numeroDocumento;
	}

    public function getDataRegistroAttribute() 
	{
		return $this->attributes['DATA_REGISTRO'];
	}

	public function setDataRegistroAttribute($dataRegistro) 
	{
		$this->attributes['DATA_REGISTRO'] = $dataRegistro;
	}

    public function getLocalDesembaracoAttribute() 
	{
		return $this->attributes['LOCAL_DESEMBARACO'];
	}

	public function setLocalDesembaracoAttribute($localDesembaraco) 
	{
		$this->attributes['LOCAL_DESEMBARACO'] = $localDesembaraco;
	}

    public function getUfDesembaracoAttribute() 
	{
		return $this->attributes['UF_DESEMBARACO'];
	}

	public function setUfDesembaracoAttribute($ufDesembaraco) 
	{
		$this->attributes['UF_DESEMBARACO'] = $ufDesembaraco;
	}

    public function getDataDesembaracoAttribute() 
	{
		return $this->attributes['DATA_DESEMBARACO'];
	}

	public function setDataDesembaracoAttribute($dataDesembaraco) 
	{
		$this->attributes['DATA_DESEMBARACO'] = $dataDesembaraco;
	}

    public function getViaTransporteAttribute() 
	{
		return $this->attributes['VIA_TRANSPORTE'];
	}

	public function setViaTransporteAttribute($viaTransporte) 
	{
		$this->attributes['VIA_TRANSPORTE'] = $viaTransporte;
	}

    public function getValorAfrmmAttribute() 
	{
		return (double)$this->attributes['VALOR_AFRMM'];
	}

	public function setValorAfrmmAttribute($valorAfrmm) 
	{
		$this->attributes['VALOR_AFRMM'] = $valorAfrmm;
	}

    public function getFormaIntermediacaoAttribute() 
	{
		return $this->attributes['FORMA_INTERMEDIACAO'];
	}

	public function setFormaIntermediacaoAttribute($formaIntermediacao) 
	{
		$this->attributes['FORMA_INTERMEDIACAO'] = $formaIntermediacao;
	}

    public function getCnpjAttribute() 
	{
		return $this->attributes['CNPJ'];
	}

	public function setCnpjAttribute($cnpj) 
	{
		$this->attributes['CNPJ'] = $cnpj;
	}

    public function getUfTerceiroAttribute() 
	{
		return $this->attributes['UF_TERCEIRO'];
	}

	public function setUfTerceiroAttribute($ufTerceiro) 
	{
		$this->attributes['UF_TERCEIRO'] = $ufTerceiro;
	}

    public function getCodigoExportadorAttribute() 
	{
		return $this->attributes['CODIGO_EXPORTADOR'];
	}

	public function setCodigoExportadorAttribute($codigoExportador) 
	{
		$this->attributes['CODIGO_EXPORTADOR'] = $codigoExportador;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setNumeroDocumentoAttribute($objeto->numeroDocumento);
			$this->setDataRegistroAttribute($objeto->dataRegistro);
			$this->setLocalDesembaracoAttribute($objeto->localDesembaraco);
			$this->setUfDesembaracoAttribute($objeto->ufDesembaraco);
			$this->setDataDesembaracoAttribute($objeto->dataDesembaraco);
			$this->setViaTransporteAttribute($objeto->viaTransporte);
			$this->setValorAfrmmAttribute($objeto->valorAfrmm);
			$this->setFormaIntermediacaoAttribute($objeto->formaIntermediacao);
			$this->setCnpjAttribute($objeto->cnpj);
			$this->setUfTerceiroAttribute($objeto->ufTerceiro);
			$this->setCodigoExportadorAttribute($objeto->codigoExportador);

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
			'numeroDocumento' => $this->getNumeroDocumentoAttribute(),
			'dataRegistro' => $this->getDataRegistroAttribute(),
			'localDesembaraco' => $this->getLocalDesembaracoAttribute(),
			'ufDesembaraco' => $this->getUfDesembaracoAttribute(),
			'dataDesembaraco' => $this->getDataDesembaracoAttribute(),
			'viaTransporte' => $this->getViaTransporteAttribute(),
			'valorAfrmm' => $this->getValorAfrmmAttribute(),
			'formaIntermediacao' => $this->getFormaIntermediacaoAttribute(),
			'cnpj' => $this->getCnpjAttribute(),
			'ufTerceiro' => $this->getUfTerceiroAttribute(),
			'codigoExportador' => $this->getCodigoExportadorAttribute(),
        ];
    }
}