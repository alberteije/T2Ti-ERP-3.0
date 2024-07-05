<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_ICMS_UFDEST] 
                                                                                
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

class NfeDetalheImpostoIcmsUfdest extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'NFE_DETALHE_IMPOSTO_ICMS_UFDEST';

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

    public function getValorBcIcmsUfDestinoAttribute() 
	{
		return (double)$this->attributes['VALOR_BC_ICMS_UF_DESTINO'];
	}

	public function setValorBcIcmsUfDestinoAttribute($valorBcIcmsUfDestino) 
	{
		$this->attributes['VALOR_BC_ICMS_UF_DESTINO'] = $valorBcIcmsUfDestino;
	}

    public function getValorBcFcpUfDestinoAttribute() 
	{
		return (double)$this->attributes['VALOR_BC_FCP_UF_DESTINO'];
	}

	public function setValorBcFcpUfDestinoAttribute($valorBcFcpUfDestino) 
	{
		$this->attributes['VALOR_BC_FCP_UF_DESTINO'] = $valorBcFcpUfDestino;
	}

    public function getPercentualFcpUfDestinoAttribute() 
	{
		return (double)$this->attributes['PERCENTUAL_FCP_UF_DESTINO'];
	}

	public function setPercentualFcpUfDestinoAttribute($percentualFcpUfDestino) 
	{
		$this->attributes['PERCENTUAL_FCP_UF_DESTINO'] = $percentualFcpUfDestino;
	}

    public function getAliquotaInternaUfDestinoAttribute() 
	{
		return (double)$this->attributes['ALIQUOTA_INTERNA_UF_DESTINO'];
	}

	public function setAliquotaInternaUfDestinoAttribute($aliquotaInternaUfDestino) 
	{
		$this->attributes['ALIQUOTA_INTERNA_UF_DESTINO'] = $aliquotaInternaUfDestino;
	}

    public function getAliquotaInteresdatualUfEnvolvidasAttribute() 
	{
		return (double)$this->attributes['ALIQUOTA_INTERESDATUAL_UF_ENVOLVIDAS'];
	}

	public function setAliquotaInteresdatualUfEnvolvidasAttribute($aliquotaInteresdatualUfEnvolvidas) 
	{
		$this->attributes['ALIQUOTA_INTERESDATUAL_UF_ENVOLVIDAS'] = $aliquotaInteresdatualUfEnvolvidas;
	}

    public function getPercentualProvisorioPartilhaIcmsAttribute() 
	{
		return (double)$this->attributes['PERCENTUAL_PROVISORIO_PARTILHA_ICMS'];
	}

	public function setPercentualProvisorioPartilhaIcmsAttribute($percentualProvisorioPartilhaIcms) 
	{
		$this->attributes['PERCENTUAL_PROVISORIO_PARTILHA_ICMS'] = $percentualProvisorioPartilhaIcms;
	}

    public function getValorIcmsFcpUfDestinoAttribute() 
	{
		return (double)$this->attributes['VALOR_ICMS_FCP_UF_DESTINO'];
	}

	public function setValorIcmsFcpUfDestinoAttribute($valorIcmsFcpUfDestino) 
	{
		$this->attributes['VALOR_ICMS_FCP_UF_DESTINO'] = $valorIcmsFcpUfDestino;
	}

    public function getValorInterestadualUfDestinoAttribute() 
	{
		return (double)$this->attributes['VALOR_INTERESTADUAL_UF_DESTINO'];
	}

	public function setValorInterestadualUfDestinoAttribute($valorInterestadualUfDestino) 
	{
		$this->attributes['VALOR_INTERESTADUAL_UF_DESTINO'] = $valorInterestadualUfDestino;
	}

    public function getValorInterestadualUfRemetenteAttribute() 
	{
		return (double)$this->attributes['VALOR_INTERESTADUAL_UF_REMETENTE'];
	}

	public function setValorInterestadualUfRemetenteAttribute($valorInterestadualUfRemetente) 
	{
		$this->attributes['VALOR_INTERESTADUAL_UF_REMETENTE'] = $valorInterestadualUfRemetente;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setValorBcIcmsUfDestinoAttribute($objeto->valorBcIcmsUfDestino);
			$this->setValorBcFcpUfDestinoAttribute($objeto->valorBcFcpUfDestino);
			$this->setPercentualFcpUfDestinoAttribute($objeto->percentualFcpUfDestino);
			$this->setAliquotaInternaUfDestinoAttribute($objeto->aliquotaInternaUfDestino);
			$this->setAliquotaInteresdatualUfEnvolvidasAttribute($objeto->aliquotaInteresdatualUfEnvolvidas);
			$this->setPercentualProvisorioPartilhaIcmsAttribute($objeto->percentualProvisorioPartilhaIcms);
			$this->setValorIcmsFcpUfDestinoAttribute($objeto->valorIcmsFcpUfDestino);
			$this->setValorInterestadualUfDestinoAttribute($objeto->valorInterestadualUfDestino);
			$this->setValorInterestadualUfRemetenteAttribute($objeto->valorInterestadualUfRemetente);

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
			'valorBcIcmsUfDestino' => $this->getValorBcIcmsUfDestinoAttribute(),
			'valorBcFcpUfDestino' => $this->getValorBcFcpUfDestinoAttribute(),
			'percentualFcpUfDestino' => $this->getPercentualFcpUfDestinoAttribute(),
			'aliquotaInternaUfDestino' => $this->getAliquotaInternaUfDestinoAttribute(),
			'aliquotaInteresdatualUfEnvolvidas' => $this->getAliquotaInteresdatualUfEnvolvidasAttribute(),
			'percentualProvisorioPartilhaIcms' => $this->getPercentualProvisorioPartilhaIcmsAttribute(),
			'valorIcmsFcpUfDestino' => $this->getValorIcmsFcpUfDestinoAttribute(),
			'valorInterestadualUfDestino' => $this->getValorInterestadualUfDestinoAttribute(),
			'valorInterestadualUfRemetente' => $this->getValorInterestadualUfRemetenteAttribute(),
        ];
    }
}