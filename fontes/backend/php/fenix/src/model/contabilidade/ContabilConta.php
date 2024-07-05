<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [CONTABIL_CONTA] 
                                                                                
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

class ContabilConta extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'CONTABIL_CONTA';

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

    public function getIdPlanoContaAttribute() 
	{
		return $this->attributes['ID_PLANO_CONTA'];
	}

	public function setIdPlanoContaAttribute($idPlanoConta) 
	{
		$this->attributes['ID_PLANO_CONTA'] = $idPlanoConta;
	}

    public function getIdContabilContaAttribute() 
	{
		return $this->attributes['ID_CONTABIL_CONTA'];
	}

	public function setIdContabilContaAttribute($idContabilConta) 
	{
		$this->attributes['ID_CONTABIL_CONTA'] = $idContabilConta;
	}

    public function getIdPlanoContaRefSpedAttribute() 
	{
		return $this->attributes['ID_PLANO_CONTA_REF_SPED'];
	}

	public function setIdPlanoContaRefSpedAttribute($idPlanoContaRefSped) 
	{
		$this->attributes['ID_PLANO_CONTA_REF_SPED'] = $idPlanoContaRefSped;
	}

    public function getClassificacaoAttribute() 
	{
		return $this->attributes['CLASSIFICACAO'];
	}

	public function setClassificacaoAttribute($classificacao) 
	{
		$this->attributes['CLASSIFICACAO'] = $classificacao;
	}

    public function getTipoAttribute() 
	{
		return $this->attributes['TIPO'];
	}

	public function setTipoAttribute($tipo) 
	{
		$this->attributes['TIPO'] = $tipo;
	}

    public function getDescricaoAttribute() 
	{
		return $this->attributes['DESCRICAO'];
	}

	public function setDescricaoAttribute($descricao) 
	{
		$this->attributes['DESCRICAO'] = $descricao;
	}

    public function getDataInclusaoAttribute() 
	{
		return $this->attributes['DATA_INCLUSAO'];
	}

	public function setDataInclusaoAttribute($dataInclusao) 
	{
		$this->attributes['DATA_INCLUSAO'] = $dataInclusao;
	}

    public function getSituacaoAttribute() 
	{
		return $this->attributes['SITUACAO'];
	}

	public function setSituacaoAttribute($situacao) 
	{
		$this->attributes['SITUACAO'] = $situacao;
	}

    public function getNaturezaAttribute() 
	{
		return $this->attributes['NATUREZA'];
	}

	public function setNaturezaAttribute($natureza) 
	{
		$this->attributes['NATUREZA'] = $natureza;
	}

    public function getPatrimonioResultadoAttribute() 
	{
		return $this->attributes['PATRIMONIO_RESULTADO'];
	}

	public function setPatrimonioResultadoAttribute($patrimonioResultado) 
	{
		$this->attributes['PATRIMONIO_RESULTADO'] = $patrimonioResultado;
	}

    public function getLivroCaixaAttribute() 
	{
		return $this->attributes['LIVRO_CAIXA'];
	}

	public function setLivroCaixaAttribute($livroCaixa) 
	{
		$this->attributes['LIVRO_CAIXA'] = $livroCaixa;
	}

    public function getDfcAttribute() 
	{
		return $this->attributes['DFC'];
	}

	public function setDfcAttribute($dfc) 
	{
		$this->attributes['DFC'] = $dfc;
	}

    public function getOrdemAttribute() 
	{
		return $this->attributes['ORDEM'];
	}

	public function setOrdemAttribute($ordem) 
	{
		$this->attributes['ORDEM'] = $ordem;
	}

    public function getCodigoReduzidoAttribute() 
	{
		return $this->attributes['CODIGO_REDUZIDO'];
	}

	public function setCodigoReduzidoAttribute($codigoReduzido) 
	{
		$this->attributes['CODIGO_REDUZIDO'] = $codigoReduzido;
	}

    public function getCodigoEfdAttribute() 
	{
		return $this->attributes['CODIGO_EFD'];
	}

	public function setCodigoEfdAttribute($codigoEfd) 
	{
		$this->attributes['CODIGO_EFD'] = $codigoEfd;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdPlanoContaAttribute($objeto->idPlanoConta);
			$this->setIdContabilContaAttribute($objeto->idContabilConta);
			$this->setIdPlanoContaRefSpedAttribute($objeto->idPlanoContaRefSped);
			$this->setClassificacaoAttribute($objeto->classificacao);
			$this->setTipoAttribute($objeto->tipo);
			$this->setDescricaoAttribute($objeto->descricao);
			$this->setDataInclusaoAttribute($objeto->dataInclusao);
			$this->setSituacaoAttribute($objeto->situacao);
			$this->setNaturezaAttribute($objeto->natureza);
			$this->setPatrimonioResultadoAttribute($objeto->patrimonioResultado);
			$this->setLivroCaixaAttribute($objeto->livroCaixa);
			$this->setDfcAttribute($objeto->dfc);
			$this->setOrdemAttribute($objeto->ordem);
			$this->setCodigoReduzidoAttribute($objeto->codigoReduzido);
			$this->setCodigoEfdAttribute($objeto->codigoEfd);

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
			'idPlanoConta' => $this->getIdPlanoContaAttribute(),
			'idContabilConta' => $this->getIdContabilContaAttribute(),
			'idPlanoContaRefSped' => $this->getIdPlanoContaRefSpedAttribute(),
			'classificacao' => $this->getClassificacaoAttribute(),
			'tipo' => $this->getTipoAttribute(),
			'descricao' => $this->getDescricaoAttribute(),
			'dataInclusao' => $this->getDataInclusaoAttribute(),
			'situacao' => $this->getSituacaoAttribute(),
			'natureza' => $this->getNaturezaAttribute(),
			'patrimonioResultado' => $this->getPatrimonioResultadoAttribute(),
			'livroCaixa' => $this->getLivroCaixaAttribute(),
			'dfc' => $this->getDfcAttribute(),
			'ordem' => $this->getOrdemAttribute(),
			'codigoReduzido' => $this->getCodigoReduzidoAttribute(),
			'codigoEfd' => $this->getCodigoEfdAttribute(),
        ];
    }
}