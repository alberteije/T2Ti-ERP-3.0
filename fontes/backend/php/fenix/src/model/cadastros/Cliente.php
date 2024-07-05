<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [CLIENTE] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.COM                                          
                                                                                
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

class Cliente extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'CLIENTE';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
	protected $with = ['viewPessoaCliente'];
	
    /**
     * Relations
     */
    public function pessoa()
    {
        return $this->belongsTo(Pessoa::class, 'ID_PESSOA', 'ID');
	}

	 public function viewPessoaCliente()
	 {
		 return $this->hasOne(ViewPessoaCliente::class, 'ID_PESSOA', 'ID');
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

    public function getDesdeAttribute() 
	{
		return $this->attributes['DESDE'];
	}
	public function setDesdeAttribute($desde) 
	{
		$this->attributes['DESDE'] = $desde;
	}

    public function getDataCadastroAttribute() 
	{
		return $this->attributes['DATA_CADASTRO'];
	}
	public function setDataCadastroAttribute($dataCadastro) 
	{
		$this->attributes['DATA_CADASTRO'] = $dataCadastro;
	}

    public function getTaxaDescontoAttribute() 
	{
		return (double)$this->attributes['TAXA_DESCONTO'];
	}

	public function setTaxaDescontoAttribute($taxaDesconto) 
	{
		$this->attributes['TAXA_DESCONTO'] = $taxaDesconto;
	}

    public function getLimiteCreditoAttribute() 
	{
		return (double)$this->attributes['LIMITE_CREDITO'];
	}

	public function setLimiteCreditoAttribute($limiteCredito) 
	{
		$this->attributes['LIMITE_CREDITO'] = $limiteCredito;
	}

    public function getObservacaoAttribute() 
	{
		return $this->attributes['OBSERVACAO'];
	}

	public function setObservacaoAttribute($observacao) 
	{
		$this->attributes['OBSERVACAO'] = $observacao;
	}

    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);
			$this->setDesdeAttribute($objeto->desde);
			$this->setDataCadastroAttribute($objeto->dataCadastro);
			$this->setTaxaDescontoAttribute($objeto->taxaDesconto);
			$this->setLimiteCreditoAttribute($objeto->limiteCredito);
			$this->setObservacaoAttribute($objeto->observacao);
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
			'desde' => $this->getDesdeAttribute(),
			'dataCadastro' => $this->getDataCadastroAttribute(),
			'taxaDesconto' => $this->getTaxaDescontoAttribute(),
			'limiteCredito' => $this->getLimiteCreditoAttribute(),
			'observacao' => $this->getObservacaoAttribute(),
			'viewPessoaCliente' => $this->viewPessoaCliente,
			//'tabelaPreco' => $this->getTabelaPrecoAttribute(),
        ];
    }
}
