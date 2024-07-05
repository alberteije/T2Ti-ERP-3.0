<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [COLABORADOR_RELACIONAMENTO] 
                                                                                
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

class ColaboradorRelacionamento extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'COLABORADOR_RELACIONAMENTO';

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

    public function getIdTipoRelacionamentoAttribute() 
	{
		return $this->attributes['ID_TIPO_RELACIONAMENTO'];
	}

	public function setIdTipoRelacionamentoAttribute($idTipoRelacionamento) 
	{
		$this->attributes['ID_TIPO_RELACIONAMENTO'] = $idTipoRelacionamento;
	}

    public function getIdColaboradorAttribute() 
	{
		return $this->attributes['ID_COLABORADOR'];
	}

	public function setIdColaboradorAttribute($idColaborador) 
	{
		$this->attributes['ID_COLABORADOR'] = $idColaborador;
	}

    public function getNomeAttribute() 
	{
		return $this->attributes['NOME'];
	}

	public function setNomeAttribute($nome) 
	{
		$this->attributes['NOME'] = $nome;
	}

    public function getDataNascimentoAttribute() 
	{
		return $this->attributes['DATA_NASCIMENTO'];
	}

	public function setDataNascimentoAttribute($dataNascimento) 
	{
		$this->attributes['DATA_NASCIMENTO'] = $dataNascimento;
	}

    public function getCpfAttribute() 
	{
		return $this->attributes['CPF'];
	}

	public function setCpfAttribute($cpf) 
	{
		$this->attributes['CPF'] = $cpf;
	}

    public function getRegistroMatriculaAttribute() 
	{
		return $this->attributes['REGISTRO_MATRICULA'];
	}

	public function setRegistroMatriculaAttribute($registroMatricula) 
	{
		$this->attributes['REGISTRO_MATRICULA'] = $registroMatricula;
	}

    public function getRegistroCartorioAttribute() 
	{
		return $this->attributes['REGISTRO_CARTORIO'];
	}

	public function setRegistroCartorioAttribute($registroCartorio) 
	{
		$this->attributes['REGISTRO_CARTORIO'] = $registroCartorio;
	}

    public function getRegistroCartorioNumeroAttribute() 
	{
		return $this->attributes['REGISTRO_CARTORIO_NUMERO'];
	}

	public function setRegistroCartorioNumeroAttribute($registroCartorioNumero) 
	{
		$this->attributes['REGISTRO_CARTORIO_NUMERO'] = $registroCartorioNumero;
	}

    public function getRegistroNumeroLivroAttribute() 
	{
		return $this->attributes['REGISTRO_NUMERO_LIVRO'];
	}

	public function setRegistroNumeroLivroAttribute($registroNumeroLivro) 
	{
		$this->attributes['REGISTRO_NUMERO_LIVRO'] = $registroNumeroLivro;
	}

    public function getRegistroNumeroFolhaAttribute() 
	{
		return $this->attributes['REGISTRO_NUMERO_FOLHA'];
	}

	public function setRegistroNumeroFolhaAttribute($registroNumeroFolha) 
	{
		$this->attributes['REGISTRO_NUMERO_FOLHA'] = $registroNumeroFolha;
	}

    public function getDataEntregaDocumentoAttribute() 
	{
		return $this->attributes['DATA_ENTREGA_DOCUMENTO'];
	}

	public function setDataEntregaDocumentoAttribute($dataEntregaDocumento) 
	{
		$this->attributes['DATA_ENTREGA_DOCUMENTO'] = $dataEntregaDocumento;
	}

    public function getSalarioFamiliaAttribute() 
	{
		return $this->attributes['SALARIO_FAMILIA'];
	}

	public function setSalarioFamiliaAttribute($salarioFamilia) 
	{
		$this->attributes['SALARIO_FAMILIA'] = $salarioFamilia;
	}

    public function getSalarioFamiliaIdadeLimiteAttribute() 
	{
		return $this->attributes['SALARIO_FAMILIA_IDADE_LIMITE'];
	}

	public function setSalarioFamiliaIdadeLimiteAttribute($salarioFamiliaIdadeLimite) 
	{
		$this->attributes['SALARIO_FAMILIA_IDADE_LIMITE'] = $salarioFamiliaIdadeLimite;
	}

    public function getSalarioFamiliaDataFimAttribute() 
	{
		return $this->attributes['SALARIO_FAMILIA_DATA_FIM'];
	}

	public function setSalarioFamiliaDataFimAttribute($salarioFamiliaDataFim) 
	{
		$this->attributes['SALARIO_FAMILIA_DATA_FIM'] = $salarioFamiliaDataFim;
	}

    public function getImpostoRendaIdadeLimiteAttribute() 
	{
		return $this->attributes['IMPOSTO_RENDA_IDADE_LIMITE'];
	}

	public function setImpostoRendaIdadeLimiteAttribute($impostoRendaIdadeLimite) 
	{
		$this->attributes['IMPOSTO_RENDA_IDADE_LIMITE'] = $impostoRendaIdadeLimite;
	}

    public function getImpostoRendaDataFimAttribute() 
	{
		return $this->attributes['IMPOSTO_RENDA_DATA_FIM'];
	}

	public function setImpostoRendaDataFimAttribute($impostoRendaDataFim) 
	{
		$this->attributes['IMPOSTO_RENDA_DATA_FIM'] = $impostoRendaDataFim;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdTipoRelacionamentoAttribute($objeto->idTipoRelacionamento);
			$this->setIdColaboradorAttribute($objeto->idColaborador);
			$this->setNomeAttribute($objeto->nome);
			$this->setDataNascimentoAttribute($objeto->dataNascimento);
			$this->setCpfAttribute($objeto->cpf);
			$this->setRegistroMatriculaAttribute($objeto->registroMatricula);
			$this->setRegistroCartorioAttribute($objeto->registroCartorio);
			$this->setRegistroCartorioNumeroAttribute($objeto->registroCartorioNumero);
			$this->setRegistroNumeroLivroAttribute($objeto->registroNumeroLivro);
			$this->setRegistroNumeroFolhaAttribute($objeto->registroNumeroFolha);
			$this->setDataEntregaDocumentoAttribute($objeto->dataEntregaDocumento);
			$this->setSalarioFamiliaAttribute($objeto->salarioFamilia);
			$this->setSalarioFamiliaIdadeLimiteAttribute($objeto->salarioFamiliaIdadeLimite);
			$this->setSalarioFamiliaDataFimAttribute($objeto->salarioFamiliaDataFim);
			$this->setImpostoRendaIdadeLimiteAttribute($objeto->impostoRendaIdadeLimite);
			$this->setImpostoRendaDataFimAttribute($objeto->impostoRendaDataFim);

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
			'idTipoRelacionamento' => $this->getIdTipoRelacionamentoAttribute(),
			'idColaborador' => $this->getIdColaboradorAttribute(),
			'nome' => $this->getNomeAttribute(),
			'dataNascimento' => $this->getDataNascimentoAttribute(),
			'cpf' => $this->getCpfAttribute(),
			'registroMatricula' => $this->getRegistroMatriculaAttribute(),
			'registroCartorio' => $this->getRegistroCartorioAttribute(),
			'registroCartorioNumero' => $this->getRegistroCartorioNumeroAttribute(),
			'registroNumeroLivro' => $this->getRegistroNumeroLivroAttribute(),
			'registroNumeroFolha' => $this->getRegistroNumeroFolhaAttribute(),
			'dataEntregaDocumento' => $this->getDataEntregaDocumentoAttribute(),
			'salarioFamilia' => $this->getSalarioFamiliaAttribute(),
			'salarioFamiliaIdadeLimite' => $this->getSalarioFamiliaIdadeLimiteAttribute(),
			'salarioFamiliaDataFim' => $this->getSalarioFamiliaDataFimAttribute(),
			'impostoRendaIdadeLimite' => $this->getImpostoRendaIdadeLimiteAttribute(),
			'impostoRendaDataFim' => $this->getImpostoRendaDataFimAttribute(),
        ];
    }
}