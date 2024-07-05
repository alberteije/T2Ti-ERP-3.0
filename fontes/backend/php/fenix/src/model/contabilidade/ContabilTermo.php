<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [CONTABIL_TERMO] 
                                                                                
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

class ContabilTermo extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'CONTABIL_TERMO';

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

    public function getIdContabilLivroAttribute() 
	{
		return $this->attributes['ID_CONTABIL_LIVRO'];
	}

	public function setIdContabilLivroAttribute($idContabilLivro) 
	{
		$this->attributes['ID_CONTABIL_LIVRO'] = $idContabilLivro;
	}

    public function getAberturaEncerramentoAttribute() 
	{
		return $this->attributes['ABERTURA_ENCERRAMENTO'];
	}

	public function setAberturaEncerramentoAttribute($aberturaEncerramento) 
	{
		$this->attributes['ABERTURA_ENCERRAMENTO'] = $aberturaEncerramento;
	}

    public function getNumeroAttribute() 
	{
		return $this->attributes['NUMERO'];
	}

	public function setNumeroAttribute($numero) 
	{
		$this->attributes['NUMERO'] = $numero;
	}

    public function getPaginaInicialAttribute() 
	{
		return $this->attributes['PAGINA_INICIAL'];
	}

	public function setPaginaInicialAttribute($paginaInicial) 
	{
		$this->attributes['PAGINA_INICIAL'] = $paginaInicial;
	}

    public function getPaginaFinalAttribute() 
	{
		return $this->attributes['PAGINA_FINAL'];
	}

	public function setPaginaFinalAttribute($paginaFinal) 
	{
		$this->attributes['PAGINA_FINAL'] = $paginaFinal;
	}

    public function getRegistradoAttribute() 
	{
		return $this->attributes['REGISTRADO'];
	}

	public function setRegistradoAttribute($registrado) 
	{
		$this->attributes['REGISTRADO'] = $registrado;
	}

    public function getNumeroRegistroAttribute() 
	{
		return $this->attributes['NUMERO_REGISTRO'];
	}

	public function setNumeroRegistroAttribute($numeroRegistro) 
	{
		$this->attributes['NUMERO_REGISTRO'] = $numeroRegistro;
	}

    public function getDataDespachoAttribute() 
	{
		return $this->attributes['DATA_DESPACHO'];
	}

	public function setDataDespachoAttribute($dataDespacho) 
	{
		$this->attributes['DATA_DESPACHO'] = $dataDespacho;
	}

    public function getDataAberturaAttribute() 
	{
		return $this->attributes['DATA_ABERTURA'];
	}

	public function setDataAberturaAttribute($dataAbertura) 
	{
		$this->attributes['DATA_ABERTURA'] = $dataAbertura;
	}

    public function getDataEncerramentoAttribute() 
	{
		return $this->attributes['DATA_ENCERRAMENTO'];
	}

	public function setDataEncerramentoAttribute($dataEncerramento) 
	{
		$this->attributes['DATA_ENCERRAMENTO'] = $dataEncerramento;
	}

    public function getEscrituracaoInicioAttribute() 
	{
		return $this->attributes['ESCRITURACAO_INICIO'];
	}

	public function setEscrituracaoInicioAttribute($escrituracaoInicio) 
	{
		$this->attributes['ESCRITURACAO_INICIO'] = $escrituracaoInicio;
	}

    public function getEscrituracaoFimAttribute() 
	{
		return $this->attributes['ESCRITURACAO_FIM'];
	}

	public function setEscrituracaoFimAttribute($escrituracaoFim) 
	{
		$this->attributes['ESCRITURACAO_FIM'] = $escrituracaoFim;
	}

    public function getTextoAttribute() 
	{
		return $this->attributes['TEXTO'];
	}

	public function setTextoAttribute($texto) 
	{
		$this->attributes['TEXTO'] = $texto;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdContabilLivroAttribute($objeto->idContabilLivro);
			$this->setAberturaEncerramentoAttribute($objeto->aberturaEncerramento);
			$this->setNumeroAttribute($objeto->numero);
			$this->setPaginaInicialAttribute($objeto->paginaInicial);
			$this->setPaginaFinalAttribute($objeto->paginaFinal);
			$this->setRegistradoAttribute($objeto->registrado);
			$this->setNumeroRegistroAttribute($objeto->numeroRegistro);
			$this->setDataDespachoAttribute($objeto->dataDespacho);
			$this->setDataAberturaAttribute($objeto->dataAbertura);
			$this->setDataEncerramentoAttribute($objeto->dataEncerramento);
			$this->setEscrituracaoInicioAttribute($objeto->escrituracaoInicio);
			$this->setEscrituracaoFimAttribute($objeto->escrituracaoFim);
			$this->setTextoAttribute($objeto->texto);

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
			'idContabilLivro' => $this->getIdContabilLivroAttribute(),
			'aberturaEncerramento' => $this->getAberturaEncerramentoAttribute(),
			'numero' => $this->getNumeroAttribute(),
			'paginaInicial' => $this->getPaginaInicialAttribute(),
			'paginaFinal' => $this->getPaginaFinalAttribute(),
			'registrado' => $this->getRegistradoAttribute(),
			'numeroRegistro' => $this->getNumeroRegistroAttribute(),
			'dataDespacho' => $this->getDataDespachoAttribute(),
			'dataAbertura' => $this->getDataAberturaAttribute(),
			'dataEncerramento' => $this->getDataEncerramentoAttribute(),
			'escrituracaoInicio' => $this->getEscrituracaoInicioAttribute(),
			'escrituracaoFim' => $this->getEscrituracaoFimAttribute(),
			'texto' => $this->getTextoAttribute(),
        ];
    }
}