<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [GED_VERSAO_DOCUMENTO] 
                                                                                
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

class GedVersaoDocumento extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'GED_VERSAO_DOCUMENTO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['colaborador', ];
	
    /**
     * Relations
     */
    public function gedDocumentoDetalhe()
    {
    	return $this->belongsTo(GedDocumentoDetalhe::class, 'ID_GED_DOCUMENTO_DETALHE', 'ID');
    }

    public function colaborador()
    {
    	return $this->belongsTo(Colaborador::class, 'ID_COLABORADOR', 'ID');
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

    public function getVersaoAttribute() 
	{
		return $this->attributes['VERSAO'];
	}

	public function setVersaoAttribute($versao) 
	{
		$this->attributes['VERSAO'] = $versao;
	}

    public function getDataVersaoAttribute() 
	{
		return $this->attributes['DATA_VERSAO'];
	}

	public function setDataVersaoAttribute($dataVersao) 
	{
		$this->attributes['DATA_VERSAO'] = $dataVersao;
	}

    public function getHoraVersaoAttribute() 
	{
		return $this->attributes['HORA_VERSAO'];
	}

	public function setHoraVersaoAttribute($horaVersao) 
	{
		$this->attributes['HORA_VERSAO'] = $horaVersao;
	}

    public function getHashArquivoAttribute() 
	{
		return $this->attributes['HASH_ARQUIVO'];
	}

	public function setHashArquivoAttribute($hashArquivo) 
	{
		$this->attributes['HASH_ARQUIVO'] = $hashArquivo;
	}

    public function getCaminhoAttribute() 
	{
		return $this->attributes['CAMINHO'];
	}

	public function setCaminhoAttribute($caminho) 
	{
		$this->attributes['CAMINHO'] = $caminho;
	}

    public function getAcaoAttribute() 
	{
		return $this->attributes['ACAO'];
	}

	public function setAcaoAttribute($acao) 
	{
		$this->attributes['ACAO'] = $acao;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setVersaoAttribute($objeto->versao);
			$this->setDataVersaoAttribute($objeto->dataVersao);
			$this->setHoraVersaoAttribute($objeto->horaVersao);
			$this->setHashArquivoAttribute($objeto->hashArquivo);
			$this->setCaminhoAttribute($objeto->caminho);
			$this->setAcaoAttribute($objeto->acao);

			// vincular objetos
			$colaborador = new Colaborador();
			$colaborador->mapear($objeto->colaborador);
			$this->colaborador()->associate($colaborador);

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
			'versao' => $this->getVersaoAttribute(),
			'dataVersao' => $this->getDataVersaoAttribute(),
			'horaVersao' => $this->getHoraVersaoAttribute(),
			'hashArquivo' => $this->getHashArquivoAttribute(),
			'caminho' => $this->getCaminhoAttribute(),
			'acao' => $this->getAcaoAttribute(),
			'colaborador' => $this->colaborador,
        ];
    }
}