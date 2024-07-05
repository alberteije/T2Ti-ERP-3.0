<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [CTE_FERROVIARIO] 
                                                                                
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

class CteFerroviario extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'CTE_FERROVIARIO';

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

    public function getTipoTrafegoAttribute() 
	{
		return $this->attributes['TIPO_TRAFEGO'];
	}

	public function setTipoTrafegoAttribute($tipoTrafego) 
	{
		$this->attributes['TIPO_TRAFEGO'] = $tipoTrafego;
	}

    public function getResponsavelFaturamentoAttribute() 
	{
		return $this->attributes['RESPONSAVEL_FATURAMENTO'];
	}

	public function setResponsavelFaturamentoAttribute($responsavelFaturamento) 
	{
		$this->attributes['RESPONSAVEL_FATURAMENTO'] = $responsavelFaturamento;
	}

    public function getFerroviaEmitenteCteAttribute() 
	{
		return $this->attributes['FERROVIA_EMITENTE_CTE'];
	}

	public function setFerroviaEmitenteCteAttribute($ferroviaEmitenteCte) 
	{
		$this->attributes['FERROVIA_EMITENTE_CTE'] = $ferroviaEmitenteCte;
	}

    public function getFluxoAttribute() 
	{
		return $this->attributes['FLUXO'];
	}

	public function setFluxoAttribute($fluxo) 
	{
		$this->attributes['FLUXO'] = $fluxo;
	}

    public function getValorFreteAttribute() 
	{
		return $this->attributes['VALOR_FRETE'];
	}

	public function setValorFreteAttribute($valorFrete) 
	{
		$this->attributes['VALOR_FRETE'] = $valorFrete;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdCteCabecalhoAttribute($objeto->idCteCabecalho);
			$this->setTipoTrafegoAttribute($objeto->tipoTrafego);
			$this->setResponsavelFaturamentoAttribute($objeto->responsavelFaturamento);
			$this->setFerroviaEmitenteCteAttribute($objeto->ferroviaEmitenteCte);
			$this->setFluxoAttribute($objeto->fluxo);
			$this->setValorFreteAttribute($objeto->valorFrete);

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
			'tipoTrafego' => $this->getTipoTrafegoAttribute(),
			'responsavelFaturamento' => $this->getResponsavelFaturamentoAttribute(),
			'ferroviaEmitenteCte' => $this->getFerroviaEmitenteCteAttribute(),
			'fluxo' => $this->getFluxoAttribute(),
			'valorFrete' => $this->getValorFreteAttribute(),
        ];
    }
}