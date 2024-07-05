<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [VENDA_CONDICOES_PAGAMENTO] 
                                                                                
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

class VendaCondicoesPagamento extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'VENDA_CONDICOES_PAGAMENTO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['listaVendaCondicoesParcelas', ];
	
    /**
     * Relations
     */
    public function listaVendaCondicoesParcelas()
    {
    	return $this->hasMany(VendaCondicoesParcelas::class, 'ID_VENDA_CONDICOES_PAGAMENTO', 'ID');
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

    public function getFaturamentoMinimoAttribute() 
	{
		return (double)$this->attributes['FATURAMENTO_MINIMO'];
	}

	public function setFaturamentoMinimoAttribute($faturamentoMinimo) 
	{
		$this->attributes['FATURAMENTO_MINIMO'] = $faturamentoMinimo;
	}

    public function getFaturamentoMaximoAttribute() 
	{
		return (double)$this->attributes['FATURAMENTO_MAXIMO'];
	}

	public function setFaturamentoMaximoAttribute($faturamentoMaximo) 
	{
		$this->attributes['FATURAMENTO_MAXIMO'] = $faturamentoMaximo;
	}

    public function getIndiceCorrecaoAttribute() 
	{
		return (double)$this->attributes['INDICE_CORRECAO'];
	}

	public function setIndiceCorrecaoAttribute($indiceCorrecao) 
	{
		$this->attributes['INDICE_CORRECAO'] = $indiceCorrecao;
	}

    public function getDiasToleranciaAttribute() 
	{
		return $this->attributes['DIAS_TOLERANCIA'];
	}

	public function setDiasToleranciaAttribute($diasTolerancia) 
	{
		$this->attributes['DIAS_TOLERANCIA'] = $diasTolerancia;
	}

    public function getValorToleranciaAttribute() 
	{
		return (double)$this->attributes['VALOR_TOLERANCIA'];
	}

	public function setValorToleranciaAttribute($valorTolerancia) 
	{
		$this->attributes['VALOR_TOLERANCIA'] = $valorTolerancia;
	}

    public function getPrazoMedioAttribute() 
	{
		return $this->attributes['PRAZO_MEDIO'];
	}

	public function setPrazoMedioAttribute($prazoMedio) 
	{
		$this->attributes['PRAZO_MEDIO'] = $prazoMedio;
	}

    public function getVistaPrazoAttribute() 
	{
		return $this->attributes['VISTA_PRAZO'];
	}

	public function setVistaPrazoAttribute($vistaPrazo) 
	{
		$this->attributes['VISTA_PRAZO'] = $vistaPrazo;
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
			$this->setFaturamentoMinimoAttribute($objeto->faturamentoMinimo);
			$this->setFaturamentoMaximoAttribute($objeto->faturamentoMaximo);
			$this->setIndiceCorrecaoAttribute($objeto->indiceCorrecao);
			$this->setDiasToleranciaAttribute($objeto->diasTolerancia);
			$this->setValorToleranciaAttribute($objeto->valorTolerancia);
			$this->setPrazoMedioAttribute($objeto->prazoMedio);
			$this->setVistaPrazoAttribute($objeto->vistaPrazo);

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
			'nome' => $this->getNomeAttribute(),
			'descricao' => $this->getDescricaoAttribute(),
			'faturamentoMinimo' => $this->getFaturamentoMinimoAttribute(),
			'faturamentoMaximo' => $this->getFaturamentoMaximoAttribute(),
			'indiceCorrecao' => $this->getIndiceCorrecaoAttribute(),
			'diasTolerancia' => $this->getDiasToleranciaAttribute(),
			'valorTolerancia' => $this->getValorToleranciaAttribute(),
			'prazoMedio' => $this->getPrazoMedioAttribute(),
			'vistaPrazo' => $this->getVistaPrazoAttribute(),
			'listaVendaCondicoesParcelas' => $this->listaVendaCondicoesParcelas,
        ];
    }
}