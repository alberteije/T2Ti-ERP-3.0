<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [CTE_AEREO] 
                                                                                
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

class CteAereo extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'CTE_AEREO';

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

    public function getIdCteCabecalhoAttribute() 
	{
		return $this->attributes['ID_CTE_CABECALHO'];
	}

	public function setIdCteCabecalhoAttribute($idCteCabecalho) 
	{
		$this->attributes['ID_CTE_CABECALHO'] = $idCteCabecalho;
	}

    public function getNumeroMinutaAttribute() 
	{
		return $this->attributes['NUMERO_MINUTA'];
	}

	public function setNumeroMinutaAttribute($numeroMinuta) 
	{
		$this->attributes['NUMERO_MINUTA'] = $numeroMinuta;
	}

    public function getNumeroConhecimentoAttribute() 
	{
		return $this->attributes['NUMERO_CONHECIMENTO'];
	}

	public function setNumeroConhecimentoAttribute($numeroConhecimento) 
	{
		$this->attributes['NUMERO_CONHECIMENTO'] = $numeroConhecimento;
	}

    public function getDataPrevistaEntregaAttribute() 
	{
		return $this->attributes['DATA_PREVISTA_ENTREGA'];
	}

	public function setDataPrevistaEntregaAttribute($dataPrevistaEntrega) 
	{
		$this->attributes['DATA_PREVISTA_ENTREGA'] = $dataPrevistaEntrega;
	}

    public function getTarifaClasseAttribute() 
	{
		return $this->attributes['TARIFA_CLASSE'];
	}

	public function setTarifaClasseAttribute($tarifaClasse) 
	{
		$this->attributes['TARIFA_CLASSE'] = $tarifaClasse;
	}

    public function getTarifaCodigoAttribute() 
	{
		return $this->attributes['TARIFA_CODIGO'];
	}

	public function setTarifaCodigoAttribute($tarifaCodigo) 
	{
		$this->attributes['TARIFA_CODIGO'] = $tarifaCodigo;
	}

    public function getTarifaValorAttribute() 
	{
		return $this->attributes['TARIFA_VALOR'];
	}

	public function setTarifaValorAttribute($tarifaValor) 
	{
		$this->attributes['TARIFA_VALOR'] = $tarifaValor;
	}

    public function getCargaDimensaoAttribute() 
	{
		return $this->attributes['CARGA_DIMENSAO'];
	}

	public function setCargaDimensaoAttribute($cargaDimensao) 
	{
		$this->attributes['CARGA_DIMENSAO'] = $cargaDimensao;
	}

    public function getCargaInformacaoManuseioAttribute() 
	{
		return $this->attributes['CARGA_INFORMACAO_MANUSEIO'];
	}

	public function setCargaInformacaoManuseioAttribute($cargaInformacaoManuseio) 
	{
		$this->attributes['CARGA_INFORMACAO_MANUSEIO'] = $cargaInformacaoManuseio;
	}

    public function getCargaEspecialAttribute() 
	{
		return $this->attributes['CARGA_ESPECIAL'];
	}

	public function setCargaEspecialAttribute($cargaEspecial) 
	{
		$this->attributes['CARGA_ESPECIAL'] = $cargaEspecial;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdCteCabecalhoAttribute($objeto->idCteCabecalho);
			$this->setNumeroMinutaAttribute($objeto->numeroMinuta);
			$this->setNumeroConhecimentoAttribute($objeto->numeroConhecimento);
			$this->setDataPrevistaEntregaAttribute($objeto->dataPrevistaEntrega);
			$this->setTarifaClasseAttribute($objeto->tarifaClasse);
			$this->setTarifaCodigoAttribute($objeto->tarifaCodigo);
			$this->setTarifaValorAttribute($objeto->tarifaValor);
			$this->setCargaDimensaoAttribute($objeto->cargaDimensao);
			$this->setCargaInformacaoManuseioAttribute($objeto->cargaInformacaoManuseio);
			$this->setCargaEspecialAttribute($objeto->cargaEspecial);

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
			'idCteCabecalho' => $this->getIdCteCabecalhoAttribute(),
			'numeroMinuta' => $this->getNumeroMinutaAttribute(),
			'numeroConhecimento' => $this->getNumeroConhecimentoAttribute(),
			'dataPrevistaEntrega' => $this->getDataPrevistaEntregaAttribute(),
			'tarifaClasse' => $this->getTarifaClasseAttribute(),
			'tarifaCodigo' => $this->getTarifaCodigoAttribute(),
			'tarifaValor' => $this->getTarifaValorAttribute(),
			'cargaDimensao' => $this->getCargaDimensaoAttribute(),
			'cargaInformacaoManuseio' => $this->getCargaInformacaoManuseioAttribute(),
			'cargaEspecial' => $this->getCargaEspecialAttribute(),
        ];
    }
}