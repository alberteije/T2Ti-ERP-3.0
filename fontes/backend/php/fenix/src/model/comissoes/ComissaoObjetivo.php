<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [COMISSAO_OBJETIVO] 
                                                                                
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

class ComissaoObjetivo extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'COMISSAO_OBJETIVO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['comissaoPerfil', 'produto', ];
	
    /**
     * Relations
     */
    public function comissaoPerfil()
    {
    	return $this->belongsTo(ComissaoPerfil::class, 'ID_COMISSAO_PERFIL', 'ID');
    }

    public function produto()
    {
    	return $this->belongsTo(Produto::class, 'ID_PRODUTO', 'ID');
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

    public function getCodigoAttribute() 
	{
		return $this->attributes['CODIGO'];
	}

	public function setCodigoAttribute($codigo) 
	{
		$this->attributes['CODIGO'] = $codigo;
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

    public function getFormaPagamentoAttribute() 
	{
		return $this->attributes['FORMA_PAGAMENTO'];
	}

	public function setFormaPagamentoAttribute($formaPagamento) 
	{
		$this->attributes['FORMA_PAGAMENTO'] = $formaPagamento;
	}

    public function getTaxaPagamentoAttribute() 
	{
		return $this->attributes['TAXA_PAGAMENTO'];
	}

	public function setTaxaPagamentoAttribute($taxaPagamento) 
	{
		$this->attributes['TAXA_PAGAMENTO'] = $taxaPagamento;
	}

    public function getValorPagamentoAttribute() 
	{
		return $this->attributes['VALOR_PAGAMENTO'];
	}

	public function setValorPagamentoAttribute($valorPagamento) 
	{
		$this->attributes['VALOR_PAGAMENTO'] = $valorPagamento;
	}

    public function getValorMetaAttribute() 
	{
		return $this->attributes['VALOR_META'];
	}

	public function setValorMetaAttribute($valorMeta) 
	{
		$this->attributes['VALOR_META'] = $valorMeta;
	}

    public function getQuantidadeAttribute() 
	{
		return $this->attributes['QUANTIDADE'];
	}

	public function setQuantidadeAttribute($quantidade) 
	{
		$this->attributes['QUANTIDADE'] = $quantidade;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setCodigoAttribute($objeto->codigo);
			$this->setNomeAttribute($objeto->nome);
			$this->setDescricaoAttribute($objeto->descricao);
			$this->setFormaPagamentoAttribute($objeto->formaPagamento);
			$this->setTaxaPagamentoAttribute($objeto->taxaPagamento);
			$this->setValorPagamentoAttribute($objeto->valorPagamento);
			$this->setValorMetaAttribute($objeto->valorMeta);
			$this->setQuantidadeAttribute($objeto->quantidade);

			// vincular objetos
			$comissaoPerfil = new ComissaoPerfil();
			$comissaoPerfil->mapear($objeto->comissaoPerfil);
			$this->comissaoPerfil()->associate($comissaoPerfil);

			$produto = new Produto();
			$produto->mapear($objeto->produto);
			$this->produto()->associate($produto);

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
			'codigo' => $this->getCodigoAttribute(),
			'nome' => $this->getNomeAttribute(),
			'descricao' => $this->getDescricaoAttribute(),
			'formaPagamento' => $this->getFormaPagamentoAttribute(),
			'taxaPagamento' => $this->getTaxaPagamentoAttribute(),
			'valorPagamento' => $this->getValorPagamentoAttribute(),
			'valorMeta' => $this->getValorMetaAttribute(),
			'quantidade' => $this->getQuantidadeAttribute(),
			'comissaoPerfil' => $this->comissaoPerfil,
			'produto' => $this->produto,
        ];
    }
}