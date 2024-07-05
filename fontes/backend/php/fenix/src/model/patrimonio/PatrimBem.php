<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [PATRIM_BEM] 
                                                                                
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

class PatrimBem extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'PATRIM_BEM';

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

    public function getIdCentroResultadoAttribute() 
	{
		return $this->attributes['ID_CENTRO_RESULTADO'];
	}

	public function setIdCentroResultadoAttribute($idCentroResultado) 
	{
		$this->attributes['ID_CENTRO_RESULTADO'] = $idCentroResultado;
	}

    public function getIdPatrimTipoAquisicaoBemAttribute() 
	{
		return $this->attributes['ID_PATRIM_TIPO_AQUISICAO_BEM'];
	}

	public function setIdPatrimTipoAquisicaoBemAttribute($idPatrimTipoAquisicaoBem) 
	{
		$this->attributes['ID_PATRIM_TIPO_AQUISICAO_BEM'] = $idPatrimTipoAquisicaoBem;
	}

    public function getIdPatrimEstadoConservacaoAttribute() 
	{
		return $this->attributes['ID_PATRIM_ESTADO_CONSERVACAO'];
	}

	public function setIdPatrimEstadoConservacaoAttribute($idPatrimEstadoConservacao) 
	{
		$this->attributes['ID_PATRIM_ESTADO_CONSERVACAO'] = $idPatrimEstadoConservacao;
	}

    public function getIdPatrimGrupoBemAttribute() 
	{
		return $this->attributes['ID_PATRIM_GRUPO_BEM'];
	}

	public function setIdPatrimGrupoBemAttribute($idPatrimGrupoBem) 
	{
		$this->attributes['ID_PATRIM_GRUPO_BEM'] = $idPatrimGrupoBem;
	}

    public function getIdFornecedorAttribute() 
	{
		return $this->attributes['ID_FORNECEDOR'];
	}

	public function setIdFornecedorAttribute($idFornecedor) 
	{
		$this->attributes['ID_FORNECEDOR'] = $idFornecedor;
	}

    public function getIdColaboradorAttribute() 
	{
		return $this->attributes['ID_COLABORADOR'];
	}

	public function setIdColaboradorAttribute($idColaborador) 
	{
		$this->attributes['ID_COLABORADOR'] = $idColaborador;
	}

    public function getIdSetorAttribute() 
	{
		return $this->attributes['ID_SETOR'];
	}

	public function setIdSetorAttribute($idSetor) 
	{
		$this->attributes['ID_SETOR'] = $idSetor;
	}

    public function getNumeroNbAttribute() 
	{
		return $this->attributes['NUMERO_NB'];
	}

	public function setNumeroNbAttribute($numeroNb) 
	{
		$this->attributes['NUMERO_NB'] = $numeroNb;
	}

    public function getNomeAttribute() 
	{
		return $this->attributes['NOME'];
	}

	public function setNomeAttribute($nome) 
	{
		$this->attributes['NOME'] = $nome;
	}

    public function getDescricaoAttribute() 
	{
		return $this->attributes['DESCRICAO'];
	}

	public function setDescricaoAttribute($descricao) 
	{
		$this->attributes['DESCRICAO'] = $descricao;
	}

    public function getNumeroSerieAttribute() 
	{
		return $this->attributes['NUMERO_SERIE'];
	}

	public function setNumeroSerieAttribute($numeroSerie) 
	{
		$this->attributes['NUMERO_SERIE'] = $numeroSerie;
	}

    public function getDataAquisicaoAttribute() 
	{
		return $this->attributes['DATA_AQUISICAO'];
	}

	public function setDataAquisicaoAttribute($dataAquisicao) 
	{
		$this->attributes['DATA_AQUISICAO'] = $dataAquisicao;
	}

    public function getDataAceiteAttribute() 
	{
		return $this->attributes['DATA_ACEITE'];
	}

	public function setDataAceiteAttribute($dataAceite) 
	{
		$this->attributes['DATA_ACEITE'] = $dataAceite;
	}

    public function getDataCadastroAttribute() 
	{
		return $this->attributes['DATA_CADASTRO'];
	}

	public function setDataCadastroAttribute($dataCadastro) 
	{
		$this->attributes['DATA_CADASTRO'] = $dataCadastro;
	}

    public function getDataContabilizadoAttribute() 
	{
		return $this->attributes['DATA_CONTABILIZADO'];
	}

	public function setDataContabilizadoAttribute($dataContabilizado) 
	{
		$this->attributes['DATA_CONTABILIZADO'] = $dataContabilizado;
	}

    public function getDataVistoriaAttribute() 
	{
		return $this->attributes['DATA_VISTORIA'];
	}

	public function setDataVistoriaAttribute($dataVistoria) 
	{
		$this->attributes['DATA_VISTORIA'] = $dataVistoria;
	}

    public function getDataMarcacaoAttribute() 
	{
		return $this->attributes['DATA_MARCACAO'];
	}

	public function setDataMarcacaoAttribute($dataMarcacao) 
	{
		$this->attributes['DATA_MARCACAO'] = $dataMarcacao;
	}

    public function getDataBaixaAttribute() 
	{
		return $this->attributes['DATA_BAIXA'];
	}

	public function setDataBaixaAttribute($dataBaixa) 
	{
		$this->attributes['DATA_BAIXA'] = $dataBaixa;
	}

    public function getVencimentoGarantiaAttribute() 
	{
		return $this->attributes['VENCIMENTO_GARANTIA'];
	}

	public function setVencimentoGarantiaAttribute($vencimentoGarantia) 
	{
		$this->attributes['VENCIMENTO_GARANTIA'] = $vencimentoGarantia;
	}

    public function getNumeroNotaFiscalAttribute() 
	{
		return $this->attributes['NUMERO_NOTA_FISCAL'];
	}

	public function setNumeroNotaFiscalAttribute($numeroNotaFiscal) 
	{
		$this->attributes['NUMERO_NOTA_FISCAL'] = $numeroNotaFiscal;
	}

    public function getChaveNfeAttribute() 
	{
		return $this->attributes['CHAVE_NFE'];
	}

	public function setChaveNfeAttribute($chaveNfe) 
	{
		$this->attributes['CHAVE_NFE'] = $chaveNfe;
	}

    public function getValorOriginalAttribute() 
	{
		return $this->attributes['VALOR_ORIGINAL'];
	}

	public function setValorOriginalAttribute($valorOriginal) 
	{
		$this->attributes['VALOR_ORIGINAL'] = $valorOriginal;
	}

    public function getValorCompraAttribute() 
	{
		return $this->attributes['VALOR_COMPRA'];
	}

	public function setValorCompraAttribute($valorCompra) 
	{
		$this->attributes['VALOR_COMPRA'] = $valorCompra;
	}

    public function getValorAtualizadoAttribute() 
	{
		return $this->attributes['VALOR_ATUALIZADO'];
	}

	public function setValorAtualizadoAttribute($valorAtualizado) 
	{
		$this->attributes['VALOR_ATUALIZADO'] = $valorAtualizado;
	}

    public function getValorBaixaAttribute() 
	{
		return $this->attributes['VALOR_BAIXA'];
	}

	public function setValorBaixaAttribute($valorBaixa) 
	{
		$this->attributes['VALOR_BAIXA'] = $valorBaixa;
	}

    public function getDepreciaAttribute() 
	{
		return $this->attributes['DEPRECIA'];
	}

	public function setDepreciaAttribute($deprecia) 
	{
		$this->attributes['DEPRECIA'] = $deprecia;
	}

    public function getMetodoDepreciacaoAttribute() 
	{
		return $this->attributes['METODO_DEPRECIACAO'];
	}

	public function setMetodoDepreciacaoAttribute($metodoDepreciacao) 
	{
		$this->attributes['METODO_DEPRECIACAO'] = $metodoDepreciacao;
	}

    public function getInicioDepreciacaoAttribute() 
	{
		return $this->attributes['INICIO_DEPRECIACAO'];
	}

	public function setInicioDepreciacaoAttribute($inicioDepreciacao) 
	{
		$this->attributes['INICIO_DEPRECIACAO'] = $inicioDepreciacao;
	}

    public function getUltimaDepreciacaoAttribute() 
	{
		return $this->attributes['ULTIMA_DEPRECIACAO'];
	}

	public function setUltimaDepreciacaoAttribute($ultimaDepreciacao) 
	{
		$this->attributes['ULTIMA_DEPRECIACAO'] = $ultimaDepreciacao;
	}

    public function getTipoDepreciacaoAttribute() 
	{
		return $this->attributes['TIPO_DEPRECIACAO'];
	}

	public function setTipoDepreciacaoAttribute($tipoDepreciacao) 
	{
		$this->attributes['TIPO_DEPRECIACAO'] = $tipoDepreciacao;
	}

    public function getTaxaAnualDepreciacaoAttribute() 
	{
		return $this->attributes['TAXA_ANUAL_DEPRECIACAO'];
	}

	public function setTaxaAnualDepreciacaoAttribute($taxaAnualDepreciacao) 
	{
		$this->attributes['TAXA_ANUAL_DEPRECIACAO'] = $taxaAnualDepreciacao;
	}

    public function getTaxaMensalDepreciacaoAttribute() 
	{
		return $this->attributes['TAXA_MENSAL_DEPRECIACAO'];
	}

	public function setTaxaMensalDepreciacaoAttribute($taxaMensalDepreciacao) 
	{
		$this->attributes['TAXA_MENSAL_DEPRECIACAO'] = $taxaMensalDepreciacao;
	}

    public function getTaxaDepreciacaoAceleradaAttribute() 
	{
		return $this->attributes['TAXA_DEPRECIACAO_ACELERADA'];
	}

	public function setTaxaDepreciacaoAceleradaAttribute($taxaDepreciacaoAcelerada) 
	{
		$this->attributes['TAXA_DEPRECIACAO_ACELERADA'] = $taxaDepreciacaoAcelerada;
	}

    public function getTaxaDepreciacaoIncentivadaAttribute() 
	{
		return $this->attributes['TAXA_DEPRECIACAO_INCENTIVADA'];
	}

	public function setTaxaDepreciacaoIncentivadaAttribute($taxaDepreciacaoIncentivada) 
	{
		$this->attributes['TAXA_DEPRECIACAO_INCENTIVADA'] = $taxaDepreciacaoIncentivada;
	}

    public function getFuncaoAttribute() 
	{
		return $this->attributes['FUNCAO'];
	}

	public function setFuncaoAttribute($funcao) 
	{
		$this->attributes['FUNCAO'] = $funcao;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdCentroResultadoAttribute($objeto->idCentroResultado);
			$this->setIdPatrimTipoAquisicaoBemAttribute($objeto->idPatrimTipoAquisicaoBem);
			$this->setIdPatrimEstadoConservacaoAttribute($objeto->idPatrimEstadoConservacao);
			$this->setIdPatrimGrupoBemAttribute($objeto->idPatrimGrupoBem);
			$this->setIdFornecedorAttribute($objeto->idFornecedor);
			$this->setIdColaboradorAttribute($objeto->idColaborador);
			$this->setIdSetorAttribute($objeto->idSetor);
			$this->setNumeroNbAttribute($objeto->numeroNb);
			$this->setNomeAttribute($objeto->nome);
			$this->setDescricaoAttribute($objeto->descricao);
			$this->setNumeroSerieAttribute($objeto->numeroSerie);
			$this->setDataAquisicaoAttribute($objeto->dataAquisicao);
			$this->setDataAceiteAttribute($objeto->dataAceite);
			$this->setDataCadastroAttribute($objeto->dataCadastro);
			$this->setDataContabilizadoAttribute($objeto->dataContabilizado);
			$this->setDataVistoriaAttribute($objeto->dataVistoria);
			$this->setDataMarcacaoAttribute($objeto->dataMarcacao);
			$this->setDataBaixaAttribute($objeto->dataBaixa);
			$this->setVencimentoGarantiaAttribute($objeto->vencimentoGarantia);
			$this->setNumeroNotaFiscalAttribute($objeto->numeroNotaFiscal);
			$this->setChaveNfeAttribute($objeto->chaveNfe);
			$this->setValorOriginalAttribute($objeto->valorOriginal);
			$this->setValorCompraAttribute($objeto->valorCompra);
			$this->setValorAtualizadoAttribute($objeto->valorAtualizado);
			$this->setValorBaixaAttribute($objeto->valorBaixa);
			$this->setDepreciaAttribute($objeto->deprecia);
			$this->setMetodoDepreciacaoAttribute($objeto->metodoDepreciacao);
			$this->setInicioDepreciacaoAttribute($objeto->inicioDepreciacao);
			$this->setUltimaDepreciacaoAttribute($objeto->ultimaDepreciacao);
			$this->setTipoDepreciacaoAttribute($objeto->tipoDepreciacao);
			$this->setTaxaAnualDepreciacaoAttribute($objeto->taxaAnualDepreciacao);
			$this->setTaxaMensalDepreciacaoAttribute($objeto->taxaMensalDepreciacao);
			$this->setTaxaDepreciacaoAceleradaAttribute($objeto->taxaDepreciacaoAcelerada);
			$this->setTaxaDepreciacaoIncentivadaAttribute($objeto->taxaDepreciacaoIncentivada);
			$this->setFuncaoAttribute($objeto->funcao);

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
			'idCentroResultado' => $this->getIdCentroResultadoAttribute(),
			'idPatrimTipoAquisicaoBem' => $this->getIdPatrimTipoAquisicaoBemAttribute(),
			'idPatrimEstadoConservacao' => $this->getIdPatrimEstadoConservacaoAttribute(),
			'idPatrimGrupoBem' => $this->getIdPatrimGrupoBemAttribute(),
			'idFornecedor' => $this->getIdFornecedorAttribute(),
			'idColaborador' => $this->getIdColaboradorAttribute(),
			'idSetor' => $this->getIdSetorAttribute(),
			'numeroNb' => $this->getNumeroNbAttribute(),
			'nome' => $this->getNomeAttribute(),
			'descricao' => $this->getDescricaoAttribute(),
			'numeroSerie' => $this->getNumeroSerieAttribute(),
			'dataAquisicao' => $this->getDataAquisicaoAttribute(),
			'dataAceite' => $this->getDataAceiteAttribute(),
			'dataCadastro' => $this->getDataCadastroAttribute(),
			'dataContabilizado' => $this->getDataContabilizadoAttribute(),
			'dataVistoria' => $this->getDataVistoriaAttribute(),
			'dataMarcacao' => $this->getDataMarcacaoAttribute(),
			'dataBaixa' => $this->getDataBaixaAttribute(),
			'vencimentoGarantia' => $this->getVencimentoGarantiaAttribute(),
			'numeroNotaFiscal' => $this->getNumeroNotaFiscalAttribute(),
			'chaveNfe' => $this->getChaveNfeAttribute(),
			'valorOriginal' => $this->getValorOriginalAttribute(),
			'valorCompra' => $this->getValorCompraAttribute(),
			'valorAtualizado' => $this->getValorAtualizadoAttribute(),
			'valorBaixa' => $this->getValorBaixaAttribute(),
			'deprecia' => $this->getDepreciaAttribute(),
			'metodoDepreciacao' => $this->getMetodoDepreciacaoAttribute(),
			'inicioDepreciacao' => $this->getInicioDepreciacaoAttribute(),
			'ultimaDepreciacao' => $this->getUltimaDepreciacaoAttribute(),
			'tipoDepreciacao' => $this->getTipoDepreciacaoAttribute(),
			'taxaAnualDepreciacao' => $this->getTaxaAnualDepreciacaoAttribute(),
			'taxaMensalDepreciacao' => $this->getTaxaMensalDepreciacaoAttribute(),
			'taxaDepreciacaoAcelerada' => $this->getTaxaDepreciacaoAceleradaAttribute(),
			'taxaDepreciacaoIncentivada' => $this->getTaxaDepreciacaoIncentivadaAttribute(),
			'funcao' => $this->getFuncaoAttribute(),
        ];
    }
}