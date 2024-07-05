<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [FOLHA_PARAMETRO] 
                                                                                
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

class FolhaParametro extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'FOLHA_PARAMETRO';

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

    public function getCompetenciaAttribute() 
	{
		return $this->attributes['COMPETENCIA'];
	}

	public function setCompetenciaAttribute($competencia) 
	{
		$this->attributes['COMPETENCIA'] = $competencia;
	}

    public function getContribuiPisAttribute() 
	{
		return $this->attributes['CONTRIBUI_PIS'];
	}

	public function setContribuiPisAttribute($contribuiPis) 
	{
		$this->attributes['CONTRIBUI_PIS'] = $contribuiPis;
	}

    public function getAliquotaPisAttribute() 
	{
		return $this->attributes['ALIQUOTA_PIS'];
	}

	public function setAliquotaPisAttribute($aliquotaPis) 
	{
		$this->attributes['ALIQUOTA_PIS'] = $aliquotaPis;
	}

    public function getDiscriminarDsrAttribute() 
	{
		return $this->attributes['DISCRIMINAR_DSR'];
	}

	public function setDiscriminarDsrAttribute($discriminarDsr) 
	{
		$this->attributes['DISCRIMINAR_DSR'] = $discriminarDsr;
	}

    public function getDiaPagamentoAttribute() 
	{
		return $this->attributes['DIA_PAGAMENTO'];
	}

	public function setDiaPagamentoAttribute($diaPagamento) 
	{
		$this->attributes['DIA_PAGAMENTO'] = $diaPagamento;
	}

    public function getCalculoProporcionalidadeAttribute() 
	{
		return $this->attributes['CALCULO_PROPORCIONALIDADE'];
	}

	public function setCalculoProporcionalidadeAttribute($calculoProporcionalidade) 
	{
		$this->attributes['CALCULO_PROPORCIONALIDADE'] = $calculoProporcionalidade;
	}

    public function getDescontarFaltas13Attribute() 
	{
		return $this->attributes['DESCONTAR_FALTAS_13'];
	}

	public function setDescontarFaltas13Attribute($descontarFaltas13) 
	{
		$this->attributes['DESCONTAR_FALTAS_13'] = $descontarFaltas13;
	}

    public function getPagarAdicionais13Attribute() 
	{
		return $this->attributes['PAGAR_ADICIONAIS_13'];
	}

	public function setPagarAdicionais13Attribute($pagarAdicionais13) 
	{
		$this->attributes['PAGAR_ADICIONAIS_13'] = $pagarAdicionais13;
	}

    public function getPagarEstagiarios13Attribute() 
	{
		return $this->attributes['PAGAR_ESTAGIARIOS_13'];
	}

	public function setPagarEstagiarios13Attribute($pagarEstagiarios13) 
	{
		$this->attributes['PAGAR_ESTAGIARIOS_13'] = $pagarEstagiarios13;
	}

    public function getMesAdiantamento13Attribute() 
	{
		return $this->attributes['MES_ADIANTAMENTO_13'];
	}

	public function setMesAdiantamento13Attribute($mesAdiantamento13) 
	{
		$this->attributes['MES_ADIANTAMENTO_13'] = $mesAdiantamento13;
	}

    public function getPercentualAdiantam13Attribute() 
	{
		return $this->attributes['PERCENTUAL_ADIANTAM_13'];
	}

	public function setPercentualAdiantam13Attribute($percentualAdiantam13) 
	{
		$this->attributes['PERCENTUAL_ADIANTAM_13'] = $percentualAdiantam13;
	}

    public function getFeriasDescontarFaltasAttribute() 
	{
		return $this->attributes['FERIAS_DESCONTAR_FALTAS'];
	}

	public function setFeriasDescontarFaltasAttribute($feriasDescontarFaltas) 
	{
		$this->attributes['FERIAS_DESCONTAR_FALTAS'] = $feriasDescontarFaltas;
	}

    public function getFeriasPagarAdicionaisAttribute() 
	{
		return $this->attributes['FERIAS_PAGAR_ADICIONAIS'];
	}

	public function setFeriasPagarAdicionaisAttribute($feriasPagarAdicionais) 
	{
		$this->attributes['FERIAS_PAGAR_ADICIONAIS'] = $feriasPagarAdicionais;
	}

    public function getFeriasAdiantar13Attribute() 
	{
		return $this->attributes['FERIAS_ADIANTAR_13'];
	}

	public function setFeriasAdiantar13Attribute($feriasAdiantar13) 
	{
		$this->attributes['FERIAS_ADIANTAR_13'] = $feriasAdiantar13;
	}

    public function getFeriasPagarEstagiariosAttribute() 
	{
		return $this->attributes['FERIAS_PAGAR_ESTAGIARIOS'];
	}

	public function setFeriasPagarEstagiariosAttribute($feriasPagarEstagiarios) 
	{
		$this->attributes['FERIAS_PAGAR_ESTAGIARIOS'] = $feriasPagarEstagiarios;
	}

    public function getFeriasCalcJustaCausaAttribute() 
	{
		return $this->attributes['FERIAS_CALC_JUSTA_CAUSA'];
	}

	public function setFeriasCalcJustaCausaAttribute($feriasCalcJustaCausa) 
	{
		$this->attributes['FERIAS_CALC_JUSTA_CAUSA'] = $feriasCalcJustaCausa;
	}

    public function getFeriasMovimentoMensalAttribute() 
	{
		return $this->attributes['FERIAS_MOVIMENTO_MENSAL'];
	}

	public function setFeriasMovimentoMensalAttribute($feriasMovimentoMensal) 
	{
		$this->attributes['FERIAS_MOVIMENTO_MENSAL'] = $feriasMovimentoMensal;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setCompetenciaAttribute($objeto->competencia);
			$this->setContribuiPisAttribute($objeto->contribuiPis);
			$this->setAliquotaPisAttribute($objeto->aliquotaPis);
			$this->setDiscriminarDsrAttribute($objeto->discriminarDsr);
			$this->setDiaPagamentoAttribute($objeto->diaPagamento);
			$this->setCalculoProporcionalidadeAttribute($objeto->calculoProporcionalidade);
			$this->setDescontarFaltas13Attribute($objeto->descontarFaltas13);
			$this->setPagarAdicionais13Attribute($objeto->pagarAdicionais13);
			$this->setPagarEstagiarios13Attribute($objeto->pagarEstagiarios13);
			$this->setMesAdiantamento13Attribute($objeto->mesAdiantamento13);
			$this->setPercentualAdiantam13Attribute($objeto->percentualAdiantam13);
			$this->setFeriasDescontarFaltasAttribute($objeto->feriasDescontarFaltas);
			$this->setFeriasPagarAdicionaisAttribute($objeto->feriasPagarAdicionais);
			$this->setFeriasAdiantar13Attribute($objeto->feriasAdiantar13);
			$this->setFeriasPagarEstagiariosAttribute($objeto->feriasPagarEstagiarios);
			$this->setFeriasCalcJustaCausaAttribute($objeto->feriasCalcJustaCausa);
			$this->setFeriasMovimentoMensalAttribute($objeto->feriasMovimentoMensal);

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
			'competencia' => $this->getCompetenciaAttribute(),
			'contribuiPis' => $this->getContribuiPisAttribute(),
			'aliquotaPis' => $this->getAliquotaPisAttribute(),
			'discriminarDsr' => $this->getDiscriminarDsrAttribute(),
			'diaPagamento' => $this->getDiaPagamentoAttribute(),
			'calculoProporcionalidade' => $this->getCalculoProporcionalidadeAttribute(),
			'descontarFaltas13' => $this->getDescontarFaltas13Attribute(),
			'pagarAdicionais13' => $this->getPagarAdicionais13Attribute(),
			'pagarEstagiarios13' => $this->getPagarEstagiarios13Attribute(),
			'mesAdiantamento13' => $this->getMesAdiantamento13Attribute(),
			'percentualAdiantam13' => $this->getPercentualAdiantam13Attribute(),
			'feriasDescontarFaltas' => $this->getFeriasDescontarFaltasAttribute(),
			'feriasPagarAdicionais' => $this->getFeriasPagarAdicionaisAttribute(),
			'feriasAdiantar13' => $this->getFeriasAdiantar13Attribute(),
			'feriasPagarEstagiarios' => $this->getFeriasPagarEstagiariosAttribute(),
			'feriasCalcJustaCausa' => $this->getFeriasCalcJustaCausaAttribute(),
			'feriasMovimentoMensal' => $this->getFeriasMovimentoMensalAttribute(),
        ];
    }
}