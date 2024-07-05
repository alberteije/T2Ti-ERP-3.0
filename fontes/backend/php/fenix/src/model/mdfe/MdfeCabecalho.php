<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [MDFE_CABECALHO] 
                                                                                
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

class MdfeCabecalho extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'MDFE_CABECALHO';

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

    public function getUfAttribute() 
	{
		return $this->attributes['UF'];
	}

	public function setUfAttribute($uf) 
	{
		$this->attributes['UF'] = $uf;
	}

    public function getTipoAmbienteAttribute() 
	{
		return $this->attributes['TIPO_AMBIENTE'];
	}

	public function setTipoAmbienteAttribute($tipoAmbiente) 
	{
		$this->attributes['TIPO_AMBIENTE'] = $tipoAmbiente;
	}

    public function getTipoEmitenteAttribute() 
	{
		return $this->attributes['TIPO_EMITENTE'];
	}

	public function setTipoEmitenteAttribute($tipoEmitente) 
	{
		$this->attributes['TIPO_EMITENTE'] = $tipoEmitente;
	}

    public function getTipoTransportadoraAttribute() 
	{
		return $this->attributes['TIPO_TRANSPORTADORA'];
	}

	public function setTipoTransportadoraAttribute($tipoTransportadora) 
	{
		$this->attributes['TIPO_TRANSPORTADORA'] = $tipoTransportadora;
	}

    public function getModeloAttribute() 
	{
		return $this->attributes['MODELO'];
	}

	public function setModeloAttribute($modelo) 
	{
		$this->attributes['MODELO'] = $modelo;
	}

    public function getSerieAttribute() 
	{
		return $this->attributes['SERIE'];
	}

	public function setSerieAttribute($serie) 
	{
		$this->attributes['SERIE'] = $serie;
	}

    public function getNumeroMdfeAttribute() 
	{
		return $this->attributes['NUMERO_MDFE'];
	}

	public function setNumeroMdfeAttribute($numeroMdfe) 
	{
		$this->attributes['NUMERO_MDFE'] = $numeroMdfe;
	}

    public function getCodigoNumericoAttribute() 
	{
		return $this->attributes['CODIGO_NUMERICO'];
	}

	public function setCodigoNumericoAttribute($codigoNumerico) 
	{
		$this->attributes['CODIGO_NUMERICO'] = $codigoNumerico;
	}

    public function getChaveAcessoAttribute() 
	{
		return $this->attributes['CHAVE_ACESSO'];
	}

	public function setChaveAcessoAttribute($chaveAcesso) 
	{
		$this->attributes['CHAVE_ACESSO'] = $chaveAcesso;
	}

    public function getDigitoVerificadorAttribute() 
	{
		return $this->attributes['DIGITO_VERIFICADOR'];
	}

	public function setDigitoVerificadorAttribute($digitoVerificador) 
	{
		$this->attributes['DIGITO_VERIFICADOR'] = $digitoVerificador;
	}

    public function getModalAttribute() 
	{
		return $this->attributes['MODAL'];
	}

	public function setModalAttribute($modal) 
	{
		$this->attributes['MODAL'] = $modal;
	}

    public function getDataHoraEmissaoAttribute() 
	{
		return $this->attributes['DATA_HORA_EMISSAO'];
	}

	public function setDataHoraEmissaoAttribute($dataHoraEmissao) 
	{
		$this->attributes['DATA_HORA_EMISSAO'] = $dataHoraEmissao;
	}

    public function getTipoEmissaoAttribute() 
	{
		return $this->attributes['TIPO_EMISSAO'];
	}

	public function setTipoEmissaoAttribute($tipoEmissao) 
	{
		$this->attributes['TIPO_EMISSAO'] = $tipoEmissao;
	}

    public function getProcessoEmissaoAttribute() 
	{
		return $this->attributes['PROCESSO_EMISSAO'];
	}

	public function setProcessoEmissaoAttribute($processoEmissao) 
	{
		$this->attributes['PROCESSO_EMISSAO'] = $processoEmissao;
	}

    public function getVersaoProcessoEmissaoAttribute() 
	{
		return $this->attributes['VERSAO_PROCESSO_EMISSAO'];
	}

	public function setVersaoProcessoEmissaoAttribute($versaoProcessoEmissao) 
	{
		$this->attributes['VERSAO_PROCESSO_EMISSAO'] = $versaoProcessoEmissao;
	}

    public function getUfInicioAttribute() 
	{
		return $this->attributes['UF_INICIO'];
	}

	public function setUfInicioAttribute($ufInicio) 
	{
		$this->attributes['UF_INICIO'] = $ufInicio;
	}

    public function getUfFimAttribute() 
	{
		return $this->attributes['UF_FIM'];
	}

	public function setUfFimAttribute($ufFim) 
	{
		$this->attributes['UF_FIM'] = $ufFim;
	}

    public function getDataHoraPrevisaoViagemAttribute() 
	{
		return $this->attributes['DATA_HORA_PREVISAO_VIAGEM'];
	}

	public function setDataHoraPrevisaoViagemAttribute($dataHoraPrevisaoViagem) 
	{
		$this->attributes['DATA_HORA_PREVISAO_VIAGEM'] = $dataHoraPrevisaoViagem;
	}

    public function getQuantidadeTotalCteAttribute() 
	{
		return $this->attributes['QUANTIDADE_TOTAL_CTE'];
	}

	public function setQuantidadeTotalCteAttribute($quantidadeTotalCte) 
	{
		$this->attributes['QUANTIDADE_TOTAL_CTE'] = $quantidadeTotalCte;
	}

    public function getQuantidadeTotalNfeAttribute() 
	{
		return $this->attributes['QUANTIDADE_TOTAL_NFE'];
	}

	public function setQuantidadeTotalNfeAttribute($quantidadeTotalNfe) 
	{
		$this->attributes['QUANTIDADE_TOTAL_NFE'] = $quantidadeTotalNfe;
	}

    public function getQuantidadeTotalMdfeAttribute() 
	{
		return $this->attributes['QUANTIDADE_TOTAL_MDFE'];
	}

	public function setQuantidadeTotalMdfeAttribute($quantidadeTotalMdfe) 
	{
		$this->attributes['QUANTIDADE_TOTAL_MDFE'] = $quantidadeTotalMdfe;
	}

    public function getCodigoUnidadeMedidaAttribute() 
	{
		return $this->attributes['CODIGO_UNIDADE_MEDIDA'];
	}

	public function setCodigoUnidadeMedidaAttribute($codigoUnidadeMedida) 
	{
		$this->attributes['CODIGO_UNIDADE_MEDIDA'] = $codigoUnidadeMedida;
	}

    public function getPesoBrutoCargaAttribute() 
	{
		return $this->attributes['PESO_BRUTO_CARGA'];
	}

	public function setPesoBrutoCargaAttribute($pesoBrutoCarga) 
	{
		$this->attributes['PESO_BRUTO_CARGA'] = $pesoBrutoCarga;
	}

    public function getValorCargaAttribute() 
	{
		return $this->attributes['VALOR_CARGA'];
	}

	public function setValorCargaAttribute($valorCarga) 
	{
		$this->attributes['VALOR_CARGA'] = $valorCarga;
	}

    public function getNumeroProtocoloAttribute() 
	{
		return $this->attributes['NUMERO_PROTOCOLO'];
	}

	public function setNumeroProtocoloAttribute($numeroProtocolo) 
	{
		$this->attributes['NUMERO_PROTOCOLO'] = $numeroProtocolo;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setUfAttribute($objeto->uf);
			$this->setTipoAmbienteAttribute($objeto->tipoAmbiente);
			$this->setTipoEmitenteAttribute($objeto->tipoEmitente);
			$this->setTipoTransportadoraAttribute($objeto->tipoTransportadora);
			$this->setModeloAttribute($objeto->modelo);
			$this->setSerieAttribute($objeto->serie);
			$this->setNumeroMdfeAttribute($objeto->numeroMdfe);
			$this->setCodigoNumericoAttribute($objeto->codigoNumerico);
			$this->setChaveAcessoAttribute($objeto->chaveAcesso);
			$this->setDigitoVerificadorAttribute($objeto->digitoVerificador);
			$this->setModalAttribute($objeto->modal);
			$this->setDataHoraEmissaoAttribute($objeto->dataHoraEmissao);
			$this->setTipoEmissaoAttribute($objeto->tipoEmissao);
			$this->setProcessoEmissaoAttribute($objeto->processoEmissao);
			$this->setVersaoProcessoEmissaoAttribute($objeto->versaoProcessoEmissao);
			$this->setUfInicioAttribute($objeto->ufInicio);
			$this->setUfFimAttribute($objeto->ufFim);
			$this->setDataHoraPrevisaoViagemAttribute($objeto->dataHoraPrevisaoViagem);
			$this->setQuantidadeTotalCteAttribute($objeto->quantidadeTotalCte);
			$this->setQuantidadeTotalNfeAttribute($objeto->quantidadeTotalNfe);
			$this->setQuantidadeTotalMdfeAttribute($objeto->quantidadeTotalMdfe);
			$this->setCodigoUnidadeMedidaAttribute($objeto->codigoUnidadeMedida);
			$this->setPesoBrutoCargaAttribute($objeto->pesoBrutoCarga);
			$this->setValorCargaAttribute($objeto->valorCarga);
			$this->setNumeroProtocoloAttribute($objeto->numeroProtocolo);

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
			'uf' => $this->getUfAttribute(),
			'tipoAmbiente' => $this->getTipoAmbienteAttribute(),
			'tipoEmitente' => $this->getTipoEmitenteAttribute(),
			'tipoTransportadora' => $this->getTipoTransportadoraAttribute(),
			'modelo' => $this->getModeloAttribute(),
			'serie' => $this->getSerieAttribute(),
			'numeroMdfe' => $this->getNumeroMdfeAttribute(),
			'codigoNumerico' => $this->getCodigoNumericoAttribute(),
			'chaveAcesso' => $this->getChaveAcessoAttribute(),
			'digitoVerificador' => $this->getDigitoVerificadorAttribute(),
			'modal' => $this->getModalAttribute(),
			'dataHoraEmissao' => $this->getDataHoraEmissaoAttribute(),
			'tipoEmissao' => $this->getTipoEmissaoAttribute(),
			'processoEmissao' => $this->getProcessoEmissaoAttribute(),
			'versaoProcessoEmissao' => $this->getVersaoProcessoEmissaoAttribute(),
			'ufInicio' => $this->getUfInicioAttribute(),
			'ufFim' => $this->getUfFimAttribute(),
			'dataHoraPrevisaoViagem' => $this->getDataHoraPrevisaoViagemAttribute(),
			'quantidadeTotalCte' => $this->getQuantidadeTotalCteAttribute(),
			'quantidadeTotalNfe' => $this->getQuantidadeTotalNfeAttribute(),
			'quantidadeTotalMdfe' => $this->getQuantidadeTotalMdfeAttribute(),
			'codigoUnidadeMedida' => $this->getCodigoUnidadeMedidaAttribute(),
			'pesoBrutoCarga' => $this->getPesoBrutoCargaAttribute(),
			'valorCarga' => $this->getValorCargaAttribute(),
			'numeroProtocolo' => $this->getNumeroProtocoloAttribute(),
        ];
    }
}