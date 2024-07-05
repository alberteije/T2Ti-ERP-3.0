<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [FOLHA_EVENTO] 
                                                                                
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

class FolhaEvento extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'FOLHA_EVENTO';

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

    public function getTipoAttribute() 
	{
		return $this->attributes['TIPO'];
	}

	public function setTipoAttribute($tipo) 
	{
		$this->attributes['TIPO'] = $tipo;
	}

    public function getUnidadeAttribute() 
	{
		return $this->attributes['UNIDADE'];
	}

	public function setUnidadeAttribute($unidade) 
	{
		$this->attributes['UNIDADE'] = $unidade;
	}

    public function getBaseCalculoAttribute() 
	{
		return $this->attributes['BASE_CALCULO'];
	}

	public function setBaseCalculoAttribute($baseCalculo) 
	{
		$this->attributes['BASE_CALCULO'] = $baseCalculo;
	}

    public function getTaxaAttribute() 
	{
		return $this->attributes['TAXA'];
	}

	public function setTaxaAttribute($taxa) 
	{
		$this->attributes['TAXA'] = $taxa;
	}

    public function getRubricaEsocialAttribute() 
	{
		return $this->attributes['RUBRICA_ESOCIAL'];
	}

	public function setRubricaEsocialAttribute($rubricaEsocial) 
	{
		$this->attributes['RUBRICA_ESOCIAL'] = $rubricaEsocial;
	}

    public function getCodIncidenciaPrevidenciaAttribute() 
	{
		return $this->attributes['COD_INCIDENCIA_PREVIDENCIA'];
	}

	public function setCodIncidenciaPrevidenciaAttribute($codIncidenciaPrevidencia) 
	{
		$this->attributes['COD_INCIDENCIA_PREVIDENCIA'] = $codIncidenciaPrevidencia;
	}

    public function getCodIncidenciaIrrfAttribute() 
	{
		return $this->attributes['COD_INCIDENCIA_IRRF'];
	}

	public function setCodIncidenciaIrrfAttribute($codIncidenciaIrrf) 
	{
		$this->attributes['COD_INCIDENCIA_IRRF'] = $codIncidenciaIrrf;
	}

    public function getCodIncidenciaFgtsAttribute() 
	{
		return $this->attributes['COD_INCIDENCIA_FGTS'];
	}

	public function setCodIncidenciaFgtsAttribute($codIncidenciaFgts) 
	{
		$this->attributes['COD_INCIDENCIA_FGTS'] = $codIncidenciaFgts;
	}

    public function getCodIncidenciaSindicatoAttribute() 
	{
		return $this->attributes['COD_INCIDENCIA_SINDICATO'];
	}

	public function setCodIncidenciaSindicatoAttribute($codIncidenciaSindicato) 
	{
		$this->attributes['COD_INCIDENCIA_SINDICATO'] = $codIncidenciaSindicato;
	}

    public function getRepercuteDsrAttribute() 
	{
		return $this->attributes['REPERCUTE_DSR'];
	}

	public function setRepercuteDsrAttribute($repercuteDsr) 
	{
		$this->attributes['REPERCUTE_DSR'] = $repercuteDsr;
	}

    public function getRepercute13Attribute() 
	{
		return $this->attributes['REPERCUTE_13'];
	}

	public function setRepercute13Attribute($repercute13) 
	{
		$this->attributes['REPERCUTE_13'] = $repercute13;
	}

    public function getRepercuteFeriasAttribute() 
	{
		return $this->attributes['REPERCUTE_FERIAS'];
	}

	public function setRepercuteFeriasAttribute($repercuteFerias) 
	{
		$this->attributes['REPERCUTE_FERIAS'] = $repercuteFerias;
	}

    public function getRepercuteAvisoAttribute() 
	{
		return $this->attributes['REPERCUTE_AVISO'];
	}

	public function setRepercuteAvisoAttribute($repercuteAviso) 
	{
		$this->attributes['REPERCUTE_AVISO'] = $repercuteAviso;
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
			$this->setTipoAttribute($objeto->tipo);
			$this->setUnidadeAttribute($objeto->unidade);
			$this->setBaseCalculoAttribute($objeto->baseCalculo);
			$this->setTaxaAttribute($objeto->taxa);
			$this->setRubricaEsocialAttribute($objeto->rubricaEsocial);
			$this->setCodIncidenciaPrevidenciaAttribute($objeto->codIncidenciaPrevidencia);
			$this->setCodIncidenciaIrrfAttribute($objeto->codIncidenciaIrrf);
			$this->setCodIncidenciaFgtsAttribute($objeto->codIncidenciaFgts);
			$this->setCodIncidenciaSindicatoAttribute($objeto->codIncidenciaSindicato);
			$this->setRepercuteDsrAttribute($objeto->repercuteDsr);
			$this->setRepercute13Attribute($objeto->repercute13);
			$this->setRepercuteFeriasAttribute($objeto->repercuteFerias);
			$this->setRepercuteAvisoAttribute($objeto->repercuteAviso);

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
			'codigo' => $this->getCodigoAttribute(),
			'nome' => $this->getNomeAttribute(),
			'descricao' => $this->getDescricaoAttribute(),
			'tipo' => $this->getTipoAttribute(),
			'unidade' => $this->getUnidadeAttribute(),
			'baseCalculo' => $this->getBaseCalculoAttribute(),
			'taxa' => $this->getTaxaAttribute(),
			'rubricaEsocial' => $this->getRubricaEsocialAttribute(),
			'codIncidenciaPrevidencia' => $this->getCodIncidenciaPrevidenciaAttribute(),
			'codIncidenciaIrrf' => $this->getCodIncidenciaIrrfAttribute(),
			'codIncidenciaFgts' => $this->getCodIncidenciaFgtsAttribute(),
			'codIncidenciaSindicato' => $this->getCodIncidenciaSindicatoAttribute(),
			'repercuteDsr' => $this->getRepercuteDsrAttribute(),
			'repercute13' => $this->getRepercute13Attribute(),
			'repercuteFerias' => $this->getRepercuteFeriasAttribute(),
			'repercuteAviso' => $this->getRepercuteAvisoAttribute(),
        ];
    }
}