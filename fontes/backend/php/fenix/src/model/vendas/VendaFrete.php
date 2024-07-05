<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [VENDA_FRETE] 
                                                                                
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

class VendaFrete extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'VENDA_FRETE';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['transportadora', ];
	
    /**
     * Relations
     */
    public function vendaCabecalho()
    {
    	return $this->belongsTo(VendaCabecalho::class, 'ID_VENDA_CABECALHO', 'ID');
    }

    public function transportadora()
    {
    	return $this->belongsTo(Transportadora::class, 'ID_TRANSPORTADORA', 'ID');
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

    public function getConhecimentoAttribute() 
	{
		return $this->attributes['CONHECIMENTO'];
	}

	public function setConhecimentoAttribute($conhecimento) 
	{
		$this->attributes['CONHECIMENTO'] = $conhecimento;
	}

    public function getResponsavelAttribute() 
	{
		return $this->attributes['RESPONSAVEL'];
	}

	public function setResponsavelAttribute($responsavel) 
	{
		$this->attributes['RESPONSAVEL'] = $responsavel;
	}

    public function getPlacaAttribute() 
	{
		return $this->attributes['PLACA'];
	}

	public function setPlacaAttribute($placa) 
	{
		$this->attributes['PLACA'] = $placa;
	}

    public function getUfPlacaAttribute() 
	{
		return $this->attributes['UF_PLACA'];
	}

	public function setUfPlacaAttribute($ufPlaca) 
	{
		$this->attributes['UF_PLACA'] = $ufPlaca;
	}

    public function getSeloFiscalAttribute() 
	{
		return $this->attributes['SELO_FISCAL'];
	}

	public function setSeloFiscalAttribute($seloFiscal) 
	{
		$this->attributes['SELO_FISCAL'] = $seloFiscal;
	}

    public function getQuantidadeVolumeAttribute() 
	{
		return (double)$this->attributes['QUANTIDADE_VOLUME'];
	}

	public function setQuantidadeVolumeAttribute($quantidadeVolume) 
	{
		$this->attributes['QUANTIDADE_VOLUME'] = $quantidadeVolume;
	}

    public function getMarcaVolumeAttribute() 
	{
		return $this->attributes['MARCA_VOLUME'];
	}

	public function setMarcaVolumeAttribute($marcaVolume) 
	{
		$this->attributes['MARCA_VOLUME'] = $marcaVolume;
	}

    public function getEspecieVolumeAttribute() 
	{
		return $this->attributes['ESPECIE_VOLUME'];
	}

	public function setEspecieVolumeAttribute($especieVolume) 
	{
		$this->attributes['ESPECIE_VOLUME'] = $especieVolume;
	}

    public function getPesoBrutoAttribute() 
	{
		return (double)$this->attributes['PESO_BRUTO'];
	}

	public function setPesoBrutoAttribute($pesoBruto) 
	{
		$this->attributes['PESO_BRUTO'] = $pesoBruto;
	}

    public function getPesoLiquidoAttribute() 
	{
		return (double)$this->attributes['PESO_LIQUIDO'];
	}

	public function setPesoLiquidoAttribute($pesoLiquido) 
	{
		$this->attributes['PESO_LIQUIDO'] = $pesoLiquido;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setConhecimentoAttribute($objeto->conhecimento);
			$this->setResponsavelAttribute($objeto->responsavel);
			$this->setPlacaAttribute($objeto->placa);
			$this->setUfPlacaAttribute($objeto->ufPlaca);
			$this->setSeloFiscalAttribute($objeto->seloFiscal);
			$this->setQuantidadeVolumeAttribute($objeto->quantidadeVolume);
			$this->setMarcaVolumeAttribute($objeto->marcaVolume);
			$this->setEspecieVolumeAttribute($objeto->especieVolume);
			$this->setPesoBrutoAttribute($objeto->pesoBruto);
			$this->setPesoLiquidoAttribute($objeto->pesoLiquido);

			$transportadora = new Transportadora();
			$transportadora->mapear($objeto->transportadora);
			$this->transportadora()->associate($transportadora);

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
			'conhecimento' => $this->getConhecimentoAttribute(),
			'responsavel' => $this->getResponsavelAttribute(),
			'placa' => $this->getPlacaAttribute(),
			'ufPlaca' => $this->getUfPlacaAttribute(),
			'seloFiscal' => $this->getSeloFiscalAttribute(),
			'quantidadeVolume' => $this->getQuantidadeVolumeAttribute(),
			'marcaVolume' => $this->getMarcaVolumeAttribute(),
			'especieVolume' => $this->getEspecieVolumeAttribute(),
			'pesoBruto' => $this->getPesoBrutoAttribute(),
			'pesoLiquido' => $this->getPesoLiquidoAttribute(),
			'transportadora' => $this->transportadora,
        ];
    }
}