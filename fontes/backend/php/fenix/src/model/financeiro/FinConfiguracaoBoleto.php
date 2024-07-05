<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [FIN_CONFIGURACAO_BOLETO] 
                                                                                
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

class FinConfiguracaoBoleto extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'FIN_CONFIGURACAO_BOLETO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['bancoContaCaixa', ];
	
    /**
     * Relations
     */
    public function bancoContaCaixa()
    {
    	return $this->belongsTo(BancoContaCaixa::class, 'ID_BANCO_CONTA_CAIXA', 'ID');
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

    public function getInstrucao01Attribute() 
	{
		return $this->attributes['INSTRUCAO01'];
	}

	public function setInstrucao01Attribute($instrucao01) 
	{
		$this->attributes['INSTRUCAO01'] = $instrucao01;
	}

    public function getInstrucao02Attribute() 
	{
		return $this->attributes['INSTRUCAO02'];
	}

	public function setInstrucao02Attribute($instrucao02) 
	{
		$this->attributes['INSTRUCAO02'] = $instrucao02;
	}

    public function getCaminhoArquivoRemessaAttribute() 
	{
		return $this->attributes['CAMINHO_ARQUIVO_REMESSA'];
	}

	public function setCaminhoArquivoRemessaAttribute($caminhoArquivoRemessa) 
	{
		$this->attributes['CAMINHO_ARQUIVO_REMESSA'] = $caminhoArquivoRemessa;
	}

    public function getCaminhoArquivoRetornoAttribute() 
	{
		return $this->attributes['CAMINHO_ARQUIVO_RETORNO'];
	}

	public function setCaminhoArquivoRetornoAttribute($caminhoArquivoRetorno) 
	{
		$this->attributes['CAMINHO_ARQUIVO_RETORNO'] = $caminhoArquivoRetorno;
	}

    public function getCaminhoArquivoLogotipoAttribute() 
	{
		return $this->attributes['CAMINHO_ARQUIVO_LOGOTIPO'];
	}

	public function setCaminhoArquivoLogotipoAttribute($caminhoArquivoLogotipo) 
	{
		$this->attributes['CAMINHO_ARQUIVO_LOGOTIPO'] = $caminhoArquivoLogotipo;
	}

    public function getCaminhoArquivoPdfAttribute() 
	{
		return $this->attributes['CAMINHO_ARQUIVO_PDF'];
	}

	public function setCaminhoArquivoPdfAttribute($caminhoArquivoPdf) 
	{
		$this->attributes['CAMINHO_ARQUIVO_PDF'] = $caminhoArquivoPdf;
	}

    public function getMensagemAttribute() 
	{
		return $this->attributes['MENSAGEM'];
	}

	public function setMensagemAttribute($mensagem) 
	{
		$this->attributes['MENSAGEM'] = $mensagem;
	}

    public function getLocalPagamentoAttribute() 
	{
		return $this->attributes['LOCAL_PAGAMENTO'];
	}

	public function setLocalPagamentoAttribute($localPagamento) 
	{
		$this->attributes['LOCAL_PAGAMENTO'] = $localPagamento;
	}

    public function getLayoutRemessaAttribute() 
	{
		return $this->attributes['LAYOUT_REMESSA'];
	}

	public function setLayoutRemessaAttribute($layoutRemessa) 
	{
		$this->attributes['LAYOUT_REMESSA'] = $layoutRemessa;
	}

    public function getAceiteAttribute() 
	{
		return $this->attributes['ACEITE'];
	}

	public function setAceiteAttribute($aceite) 
	{
		$this->attributes['ACEITE'] = $aceite;
	}

    public function getEspecieAttribute() 
	{
		return $this->attributes['ESPECIE'];
	}

	public function setEspecieAttribute($especie) 
	{
		$this->attributes['ESPECIE'] = $especie;
	}

    public function getCarteiraAttribute() 
	{
		return $this->attributes['CARTEIRA'];
	}

	public function setCarteiraAttribute($carteira) 
	{
		$this->attributes['CARTEIRA'] = $carteira;
	}

    public function getCodigoConvenioAttribute() 
	{
		return $this->attributes['CODIGO_CONVENIO'];
	}

	public function setCodigoConvenioAttribute($codigoConvenio) 
	{
		$this->attributes['CODIGO_CONVENIO'] = $codigoConvenio;
	}

    public function getCodigoCedenteAttribute() 
	{
		return $this->attributes['CODIGO_CEDENTE'];
	}

	public function setCodigoCedenteAttribute($codigoCedente) 
	{
		$this->attributes['CODIGO_CEDENTE'] = $codigoCedente;
	}

    public function getTaxaMultaAttribute() 
	{
		return $this->attributes['TAXA_MULTA'];
	}

	public function setTaxaMultaAttribute($taxaMulta) 
	{
		$this->attributes['TAXA_MULTA'] = $taxaMulta;
	}

    public function getTaxaJuroAttribute() 
	{
		return $this->attributes['TAXA_JURO'];
	}

	public function setTaxaJuroAttribute($taxaJuro) 
	{
		$this->attributes['TAXA_JURO'] = $taxaJuro;
	}

    public function getDiasProtestoAttribute() 
	{
		return $this->attributes['DIAS_PROTESTO'];
	}

	public function setDiasProtestoAttribute($diasProtesto) 
	{
		$this->attributes['DIAS_PROTESTO'] = $diasProtesto;
	}

    public function getNossoNumeroAnteriorAttribute() 
	{
		return $this->attributes['NOSSO_NUMERO_ANTERIOR'];
	}

	public function setNossoNumeroAnteriorAttribute($nossoNumeroAnterior) 
	{
		$this->attributes['NOSSO_NUMERO_ANTERIOR'] = $nossoNumeroAnterior;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setInstrucao01Attribute($objeto->instrucao01);
			$this->setInstrucao02Attribute($objeto->instrucao02);
			$this->setCaminhoArquivoRemessaAttribute($objeto->caminhoArquivoRemessa);
			$this->setCaminhoArquivoRetornoAttribute($objeto->caminhoArquivoRetorno);
			$this->setCaminhoArquivoLogotipoAttribute($objeto->caminhoArquivoLogotipo);
			$this->setCaminhoArquivoPdfAttribute($objeto->caminhoArquivoPdf);
			$this->setMensagemAttribute($objeto->mensagem);
			$this->setLocalPagamentoAttribute($objeto->localPagamento);
			$this->setLayoutRemessaAttribute($objeto->layoutRemessa);
			$this->setAceiteAttribute($objeto->aceite);
			$this->setEspecieAttribute($objeto->especie);
			$this->setCarteiraAttribute($objeto->carteira);
			$this->setCodigoConvenioAttribute($objeto->codigoConvenio);
			$this->setCodigoCedenteAttribute($objeto->codigoCedente);
			$this->setTaxaMultaAttribute($objeto->taxaMulta);
			$this->setTaxaJuroAttribute($objeto->taxaJuro);
			$this->setDiasProtestoAttribute($objeto->diasProtesto);
			$this->setNossoNumeroAnteriorAttribute($objeto->nossoNumeroAnterior);

			// vincular objetos
			$bancoContaCaixa = new BancoContaCaixa();
			$bancoContaCaixa->mapear($objeto->bancoContaCaixa);
			$this->bancoContaCaixa()->associate($bancoContaCaixa);

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
			'instrucao01' => $this->getInstrucao01Attribute(),
			'instrucao02' => $this->getInstrucao02Attribute(),
			'caminhoArquivoRemessa' => $this->getCaminhoArquivoRemessaAttribute(),
			'caminhoArquivoRetorno' => $this->getCaminhoArquivoRetornoAttribute(),
			'caminhoArquivoLogotipo' => $this->getCaminhoArquivoLogotipoAttribute(),
			'caminhoArquivoPdf' => $this->getCaminhoArquivoPdfAttribute(),
			'mensagem' => $this->getMensagemAttribute(),
			'localPagamento' => $this->getLocalPagamentoAttribute(),
			'layoutRemessa' => $this->getLayoutRemessaAttribute(),
			'aceite' => $this->getAceiteAttribute(),
			'especie' => $this->getEspecieAttribute(),
			'carteira' => $this->getCarteiraAttribute(),
			'codigoConvenio' => $this->getCodigoConvenioAttribute(),
			'codigoCedente' => $this->getCodigoCedenteAttribute(),
			'taxaMulta' => $this->getTaxaMultaAttribute(),
			'taxaJuro' => $this->getTaxaJuroAttribute(),
			'diasProtesto' => $this->getDiasProtestoAttribute(),
			'nossoNumeroAnterior' => $this->getNossoNumeroAnteriorAttribute(),
			'bancoContaCaixa' => $this->bancoContaCaixa,
        ];
    }
}