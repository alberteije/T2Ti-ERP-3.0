<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [PONTO_ABONO] 
                                                                                
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

class PontoAbono extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'PONTO_ABONO';

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

    public function getIdColaboradorAttribute() 
	{
		return $this->attributes['ID_COLABORADOR'];
	}

	public function setIdColaboradorAttribute($idColaborador) 
	{
		$this->attributes['ID_COLABORADOR'] = $idColaborador;
	}

    public function getQuantidadeAttribute() 
	{
		return $this->attributes['QUANTIDADE'];
	}

	public function setQuantidadeAttribute($quantidade) 
	{
		$this->attributes['QUANTIDADE'] = $quantidade;
	}

    public function getUtilizadoAttribute() 
	{
		return $this->attributes['UTILIZADO'];
	}

	public function setUtilizadoAttribute($utilizado) 
	{
		$this->attributes['UTILIZADO'] = $utilizado;
	}

    public function getSaldoAttribute() 
	{
		return $this->attributes['SALDO'];
	}

	public function setSaldoAttribute($saldo) 
	{
		$this->attributes['SALDO'] = $saldo;
	}

    public function getDataCadastroAttribute() 
	{
		return $this->attributes['DATA_CADASTRO'];
	}

	public function setDataCadastroAttribute($dataCadastro) 
	{
		$this->attributes['DATA_CADASTRO'] = $dataCadastro;
	}

    public function getInicioUtilizacaoAttribute() 
	{
		return $this->attributes['INICIO_UTILIZACAO'];
	}

	public function setInicioUtilizacaoAttribute($inicioUtilizacao) 
	{
		$this->attributes['INICIO_UTILIZACAO'] = $inicioUtilizacao;
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

			$this->setIdColaboradorAttribute($objeto->idColaborador);
			$this->setQuantidadeAttribute($objeto->quantidade);
			$this->setUtilizadoAttribute($objeto->utilizado);
			$this->setSaldoAttribute($objeto->saldo);
			$this->setDataCadastroAttribute($objeto->dataCadastro);
			$this->setInicioUtilizacaoAttribute($objeto->inicioUtilizacao);
			$this->setObservacaoAttribute($objeto->observacao);

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
			'idColaborador' => $this->getIdColaboradorAttribute(),
			'quantidade' => $this->getQuantidadeAttribute(),
			'utilizado' => $this->getUtilizadoAttribute(),
			'saldo' => $this->getSaldoAttribute(),
			'dataCadastro' => $this->getDataCadastroAttribute(),
			'inicioUtilizacao' => $this->getInicioUtilizacaoAttribute(),
			'observacao' => $this->getObservacaoAttribute(),
        ];
    }
}