<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [PRODUTO] 
                                                                                
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

class Produto extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'PRODUTO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['produtoSubgrupo', 'produtoMarca', 'produtoUnidade', 'tributIcmsCustomCab', 'tributGrupoTributario', ];
	
    /**
     * Relations
     */
    public function produtoSubgrupo()
    {
    	return $this->belongsTo(ProdutoSubgrupo::class, 'ID_PRODUTO_SUBGRUPO', 'ID');
    }

    public function produtoMarca()
    {
    	return $this->belongsTo(ProdutoMarca::class, 'ID_PRODUTO_MARCA', 'ID');
    }

    public function produtoUnidade()
    {
    	return $this->belongsTo(ProdutoUnidade::class, 'ID_PRODUTO_UNIDADE', 'ID');
    }

    public function tributIcmsCustomCab()
    {
    	return $this->belongsTo(TributIcmsCustomCab::class, 'ID_TRIBUT_ICMS_CUSTOM_CAB', 'ID');
    }

    public function tributGrupoTributario()
    {
    	return $this->belongsTo(TributGrupoTributario::class, 'ID_TRIBUT_GRUPO_TRIBUTARIO', 'ID');
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

    public function getGtinAttribute() 
	{
		return $this->attributes['GTIN'];
	}

	public function setGtinAttribute($gtin) 
	{
		$this->attributes['GTIN'] = $gtin;
	}

    public function getCodigoInternoAttribute() 
	{
		return $this->attributes['CODIGO_INTERNO'];
	}

	public function setCodigoInternoAttribute($codigoInterno) 
	{
		$this->attributes['CODIGO_INTERNO'] = $codigoInterno;
	}

    public function getValorCompraAttribute() 
	{
		return (double)$this->attributes['VALOR_COMPRA'];
	}

	public function setValorCompraAttribute($valorCompra) 
	{
		$this->attributes['VALOR_COMPRA'] = $valorCompra;
	}

    public function getValorVendaAttribute() 
	{
		return (double)$this->attributes['VALOR_VENDA'];
	}

	public function setValorVendaAttribute($valorVenda) 
	{
		$this->attributes['VALOR_VENDA'] = $valorVenda;
	}

    public function getCodigoNcmAttribute() 
	{
		return $this->attributes['CODIGO_NCM'];
	}

	public function setCodigoNcmAttribute($codigoNcm) 
	{
		$this->attributes['CODIGO_NCM'] = $codigoNcm;
	}

    public function getEstoqueMinimoAttribute() 
	{
		return (double)$this->attributes['ESTOQUE_MINIMO'];
	}

	public function setEstoqueMinimoAttribute($estoqueMinimo) 
	{
		$this->attributes['ESTOQUE_MINIMO'] = $estoqueMinimo;
	}

    public function getEstoqueMaximoAttribute() 
	{
		return (double)$this->attributes['ESTOQUE_MAXIMO'];
	}

	public function setEstoqueMaximoAttribute($estoqueMaximo) 
	{
		$this->attributes['ESTOQUE_MAXIMO'] = $estoqueMaximo;
	}

    public function getQuantidadeEstoqueAttribute() 
	{
		return (double)$this->attributes['QUANTIDADE_ESTOQUE'];
	}

	public function setQuantidadeEstoqueAttribute($quantidadeEstoque) 
	{
		$this->attributes['QUANTIDADE_ESTOQUE'] = $quantidadeEstoque;
	}

    public function getDataCadastroAttribute() 
	{
		return $this->attributes['DATA_CADASTRO'];
	}

	public function setDataCadastroAttribute($dataCadastro) 
	{
		$this->attributes['DATA_CADASTRO'] = $dataCadastro;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setNomeAttribute($objeto->nome);
			$this->setDescricaoAttribute($objeto->descricao);
			$this->setGtinAttribute($objeto->gtin);
			$this->setCodigoInternoAttribute($objeto->codigoInterno);
			$this->setValorCompraAttribute($objeto->valorCompra);
			$this->setValorVendaAttribute($objeto->valorVenda);
			$this->setCodigoNcmAttribute($objeto->codigoNcm);
			$this->setEstoqueMinimoAttribute($objeto->estoqueMinimo);
			$this->setEstoqueMaximoAttribute($objeto->estoqueMaximo);
			$this->setQuantidadeEstoqueAttribute($objeto->quantidadeEstoque);
			$this->setDataCadastroAttribute($objeto->dataCadastro);

			// vincular objetos
			$produtoSubgrupo = new ProdutoSubgrupo();
			$produtoSubgrupo->mapear($objeto->produtoSubgrupo);
			$this->produtoSubgrupo()->associate($produtoSubgrupo);

			$produtoMarca = new ProdutoMarca();
			$produtoMarca->mapear($objeto->produtoMarca);
			$this->produtoMarca()->associate($produtoMarca);

			$produtoUnidade = new ProdutoUnidade();
			$produtoUnidade->mapear($objeto->produtoUnidade);
			$this->produtoUnidade()->associate($produtoUnidade);

			$tributIcmsCustomCab = new TributIcmsCustomCab();
			$tributIcmsCustomCab->mapear($objeto->tributIcmsCustomCab);
			$this->tributIcmsCustomCab()->associate($tributIcmsCustomCab);

			$tributGrupoTributario = new TributGrupoTributario();
			$tributGrupoTributario->mapear($objeto->tributGrupoTributario);
			$this->tributGrupoTributario()->associate($tributGrupoTributario);

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
			'nome' => $this->getNomeAttribute(),
			'descricao' => $this->getDescricaoAttribute(),
			'gtin' => $this->getGtinAttribute(),
			'codigoInterno' => $this->getCodigoInternoAttribute(),
			'valorCompra' => $this->getValorCompraAttribute(),
			'valorVenda' => $this->getValorVendaAttribute(),
			'codigoNcm' => $this->getCodigoNcmAttribute(),
			'estoqueMinimo' => $this->getEstoqueMinimoAttribute(),
			'estoqueMaximo' => $this->getEstoqueMaximoAttribute(),
			'quantidadeEstoque' => $this->getQuantidadeEstoqueAttribute(),
			'dataCadastro' => $this->getDataCadastroAttribute(),
			'produtoSubgrupo' => $this->produtoSubgrupo,
			'produtoMarca' => $this->produtoMarca,
			'produtoUnidade' => $this->produtoUnidade,
			'tributIcmsCustomCab' => $this->tributIcmsCustomCab,
			'tributGrupoTributario' => $this->tributGrupoTributario,
        ];
    }
}