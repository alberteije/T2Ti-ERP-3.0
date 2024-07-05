<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_ISSQN] 
                                                                                
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

class NfeDetalheImpostoIssqn extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'NFE_DETALHE_IMPOSTO_ISSQN';

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

    public function getBaseCalculoIssqnAttribute() 
	{
		return (double)$this->attributes['BASE_CALCULO_ISSQN'];
	}

	public function setBaseCalculoIssqnAttribute($baseCalculoIssqn) 
	{
		$this->attributes['BASE_CALCULO_ISSQN'] = $baseCalculoIssqn;
	}

    public function getAliquotaIssqnAttribute() 
	{
		return (double)$this->attributes['ALIQUOTA_ISSQN'];
	}

	public function setAliquotaIssqnAttribute($aliquotaIssqn) 
	{
		$this->attributes['ALIQUOTA_ISSQN'] = $aliquotaIssqn;
	}

    public function getValorIssqnAttribute() 
	{
		return (double)$this->attributes['VALOR_ISSQN'];
	}

	public function setValorIssqnAttribute($valorIssqn) 
	{
		$this->attributes['VALOR_ISSQN'] = $valorIssqn;
	}

    public function getMunicipioIssqnAttribute() 
	{
		return $this->attributes['MUNICIPIO_ISSQN'];
	}

	public function setMunicipioIssqnAttribute($municipioIssqn) 
	{
		$this->attributes['MUNICIPIO_ISSQN'] = $municipioIssqn;
	}

    public function getItemListaServicosAttribute() 
	{
		return $this->attributes['ITEM_LISTA_SERVICOS'];
	}

	public function setItemListaServicosAttribute($itemListaServicos) 
	{
		$this->attributes['ITEM_LISTA_SERVICOS'] = $itemListaServicos;
	}

    public function getValorDeducaoAttribute() 
	{
		return (double)$this->attributes['VALOR_DEDUCAO'];
	}

	public function setValorDeducaoAttribute($valorDeducao) 
	{
		$this->attributes['VALOR_DEDUCAO'] = $valorDeducao;
	}

    public function getValorOutrasRetencoesAttribute() 
	{
		return (double)$this->attributes['VALOR_OUTRAS_RETENCOES'];
	}

	public function setValorOutrasRetencoesAttribute($valorOutrasRetencoes) 
	{
		$this->attributes['VALOR_OUTRAS_RETENCOES'] = $valorOutrasRetencoes;
	}

    public function getValorDescontoIncondicionadoAttribute() 
	{
		return (double)$this->attributes['VALOR_DESCONTO_INCONDICIONADO'];
	}

	public function setValorDescontoIncondicionadoAttribute($valorDescontoIncondicionado) 
	{
		$this->attributes['VALOR_DESCONTO_INCONDICIONADO'] = $valorDescontoIncondicionado;
	}

    public function getValorDescontoCondicionadoAttribute() 
	{
		return (double)$this->attributes['VALOR_DESCONTO_CONDICIONADO'];
	}

	public function setValorDescontoCondicionadoAttribute($valorDescontoCondicionado) 
	{
		$this->attributes['VALOR_DESCONTO_CONDICIONADO'] = $valorDescontoCondicionado;
	}

    public function getValorRetencaoIssAttribute() 
	{
		return (double)$this->attributes['VALOR_RETENCAO_ISS'];
	}

	public function setValorRetencaoIssAttribute($valorRetencaoIss) 
	{
		$this->attributes['VALOR_RETENCAO_ISS'] = $valorRetencaoIss;
	}

    public function getIndicadorExigibilidadeIssAttribute() 
	{
		return $this->attributes['INDICADOR_EXIGIBILIDADE_ISS'];
	}

	public function setIndicadorExigibilidadeIssAttribute($indicadorExigibilidadeIss) 
	{
		$this->attributes['INDICADOR_EXIGIBILIDADE_ISS'] = $indicadorExigibilidadeIss;
	}

    public function getCodigoServicoAttribute() 
	{
		return $this->attributes['CODIGO_SERVICO'];
	}

	public function setCodigoServicoAttribute($codigoServico) 
	{
		$this->attributes['CODIGO_SERVICO'] = $codigoServico;
	}

    public function getMunicipioIncidenciaAttribute() 
	{
		return $this->attributes['MUNICIPIO_INCIDENCIA'];
	}

	public function setMunicipioIncidenciaAttribute($municipioIncidencia) 
	{
		$this->attributes['MUNICIPIO_INCIDENCIA'] = $municipioIncidencia;
	}

    public function getPaisSevicoPrestadoAttribute() 
	{
		return $this->attributes['PAIS_SEVICO_PRESTADO'];
	}

	public function setPaisSevicoPrestadoAttribute($paisSevicoPrestado) 
	{
		$this->attributes['PAIS_SEVICO_PRESTADO'] = $paisSevicoPrestado;
	}

    public function getNumeroProcessoAttribute() 
	{
		return $this->attributes['NUMERO_PROCESSO'];
	}

	public function setNumeroProcessoAttribute($numeroProcesso) 
	{
		$this->attributes['NUMERO_PROCESSO'] = $numeroProcesso;
	}

    public function getIndicadorIncentivoFiscalAttribute() 
	{
		return $this->attributes['INDICADOR_INCENTIVO_FISCAL'];
	}

	public function setIndicadorIncentivoFiscalAttribute($indicadorIncentivoFiscal) 
	{
		$this->attributes['INDICADOR_INCENTIVO_FISCAL'] = $indicadorIncentivoFiscal;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setBaseCalculoIssqnAttribute($objeto->baseCalculoIssqn);
			$this->setAliquotaIssqnAttribute($objeto->aliquotaIssqn);
			$this->setValorIssqnAttribute($objeto->valorIssqn);
			$this->setMunicipioIssqnAttribute($objeto->municipioIssqn);
			$this->setItemListaServicosAttribute($objeto->itemListaServicos);
			$this->setValorDeducaoAttribute($objeto->valorDeducao);
			$this->setValorOutrasRetencoesAttribute($objeto->valorOutrasRetencoes);
			$this->setValorDescontoIncondicionadoAttribute($objeto->valorDescontoIncondicionado);
			$this->setValorDescontoCondicionadoAttribute($objeto->valorDescontoCondicionado);
			$this->setValorRetencaoIssAttribute($objeto->valorRetencaoIss);
			$this->setIndicadorExigibilidadeIssAttribute($objeto->indicadorExigibilidadeIss);
			$this->setCodigoServicoAttribute($objeto->codigoServico);
			$this->setMunicipioIncidenciaAttribute($objeto->municipioIncidencia);
			$this->setPaisSevicoPrestadoAttribute($objeto->paisSevicoPrestado);
			$this->setNumeroProcessoAttribute($objeto->numeroProcesso);
			$this->setIndicadorIncentivoFiscalAttribute($objeto->indicadorIncentivoFiscal);

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
			'baseCalculoIssqn' => $this->getBaseCalculoIssqnAttribute(),
			'aliquotaIssqn' => $this->getAliquotaIssqnAttribute(),
			'valorIssqn' => $this->getValorIssqnAttribute(),
			'municipioIssqn' => $this->getMunicipioIssqnAttribute(),
			'itemListaServicos' => $this->getItemListaServicosAttribute(),
			'valorDeducao' => $this->getValorDeducaoAttribute(),
			'valorOutrasRetencoes' => $this->getValorOutrasRetencoesAttribute(),
			'valorDescontoIncondicionado' => $this->getValorDescontoIncondicionadoAttribute(),
			'valorDescontoCondicionado' => $this->getValorDescontoCondicionadoAttribute(),
			'valorRetencaoIss' => $this->getValorRetencaoIssAttribute(),
			'indicadorExigibilidadeIss' => $this->getIndicadorExigibilidadeIssAttribute(),
			'codigoServico' => $this->getCodigoServicoAttribute(),
			'municipioIncidencia' => $this->getMunicipioIncidenciaAttribute(),
			'paisSevicoPrestado' => $this->getPaisSevicoPrestadoAttribute(),
			'numeroProcesso' => $this->getNumeroProcessoAttribute(),
			'indicadorIncentivoFiscal' => $this->getIndicadorIncentivoFiscalAttribute(),
        ];
    }
}