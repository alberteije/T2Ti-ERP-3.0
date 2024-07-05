<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [WMS_AGENDAMENTO] 
                                                                                
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

class WmsAgendamento extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'WMS_AGENDAMENTO';

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

    public function getDataOperacaoAttribute() 
	{
		return $this->attributes['DATA_OPERACAO'];
	}

	public function setDataOperacaoAttribute($dataOperacao) 
	{
		$this->attributes['DATA_OPERACAO'] = $dataOperacao;
	}

    public function getHoraOperacaoAttribute() 
	{
		return $this->attributes['HORA_OPERACAO'];
	}

	public function setHoraOperacaoAttribute($horaOperacao) 
	{
		$this->attributes['HORA_OPERACAO'] = $horaOperacao;
	}

    public function getLocalOperacaoAttribute() 
	{
		return $this->attributes['LOCAL_OPERACAO'];
	}

	public function setLocalOperacaoAttribute($localOperacao) 
	{
		$this->attributes['LOCAL_OPERACAO'] = $localOperacao;
	}

    public function getQuantidadeVolumeAttribute() 
	{
		return $this->attributes['QUANTIDADE_VOLUME'];
	}

	public function setQuantidadeVolumeAttribute($quantidadeVolume) 
	{
		$this->attributes['QUANTIDADE_VOLUME'] = $quantidadeVolume;
	}

    public function getPesoTotalVolumeAttribute() 
	{
		return $this->attributes['PESO_TOTAL_VOLUME'];
	}

	public function setPesoTotalVolumeAttribute($pesoTotalVolume) 
	{
		$this->attributes['PESO_TOTAL_VOLUME'] = $pesoTotalVolume;
	}

    public function getQuantidadePessoaAttribute() 
	{
		return $this->attributes['QUANTIDADE_PESSOA'];
	}

	public function setQuantidadePessoaAttribute($quantidadePessoa) 
	{
		$this->attributes['QUANTIDADE_PESSOA'] = $quantidadePessoa;
	}

    public function getQuantidadeHoraAttribute() 
	{
		return $this->attributes['QUANTIDADE_HORA'];
	}

	public function setQuantidadeHoraAttribute($quantidadeHora) 
	{
		$this->attributes['QUANTIDADE_HORA'] = $quantidadeHora;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setDataOperacaoAttribute($objeto->dataOperacao);
			$this->setHoraOperacaoAttribute($objeto->horaOperacao);
			$this->setLocalOperacaoAttribute($objeto->localOperacao);
			$this->setQuantidadeVolumeAttribute($objeto->quantidadeVolume);
			$this->setPesoTotalVolumeAttribute($objeto->pesoTotalVolume);
			$this->setQuantidadePessoaAttribute($objeto->quantidadePessoa);
			$this->setQuantidadeHoraAttribute($objeto->quantidadeHora);

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
			'dataOperacao' => $this->getDataOperacaoAttribute(),
			'horaOperacao' => $this->getHoraOperacaoAttribute(),
			'localOperacao' => $this->getLocalOperacaoAttribute(),
			'quantidadeVolume' => $this->getQuantidadeVolumeAttribute(),
			'pesoTotalVolume' => $this->getPesoTotalVolumeAttribute(),
			'quantidadePessoa' => $this->getQuantidadePessoaAttribute(),
			'quantidadeHora' => $this->getQuantidadeHoraAttribute(),
        ];
    }
}