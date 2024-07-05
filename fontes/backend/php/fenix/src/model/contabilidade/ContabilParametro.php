<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [CONTABIL_PARAMETRO] 
                                                                                
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

class ContabilParametro extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'CONTABIL_PARAMETRO';

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

    public function getMascaraAttribute() 
	{
		return $this->attributes['MASCARA'];
	}

	public function setMascaraAttribute($mascara) 
	{
		$this->attributes['MASCARA'] = $mascara;
	}

    public function getNiveisAttribute() 
	{
		return $this->attributes['NIVEIS'];
	}

	public function setNiveisAttribute($niveis) 
	{
		$this->attributes['NIVEIS'] = $niveis;
	}

    public function getInformarContaPorAttribute() 
	{
		return $this->attributes['INFORMAR_CONTA_POR'];
	}

	public function setInformarContaPorAttribute($informarContaPor) 
	{
		$this->attributes['INFORMAR_CONTA_POR'] = $informarContaPor;
	}

    public function getCompartilhaPlanoContaAttribute() 
	{
		return $this->attributes['COMPARTILHA_PLANO_CONTA'];
	}

	public function setCompartilhaPlanoContaAttribute($compartilhaPlanoConta) 
	{
		$this->attributes['COMPARTILHA_PLANO_CONTA'] = $compartilhaPlanoConta;
	}

    public function getCompartilhaHistoricosAttribute() 
	{
		return $this->attributes['COMPARTILHA_HISTORICOS'];
	}

	public function setCompartilhaHistoricosAttribute($compartilhaHistoricos) 
	{
		$this->attributes['COMPARTILHA_HISTORICOS'] = $compartilhaHistoricos;
	}

    public function getAlteraLancamentoOutroAttribute() 
	{
		return $this->attributes['ALTERA_LANCAMENTO_OUTRO'];
	}

	public function setAlteraLancamentoOutroAttribute($alteraLancamentoOutro) 
	{
		$this->attributes['ALTERA_LANCAMENTO_OUTRO'] = $alteraLancamentoOutro;
	}

    public function getHistoricoObrigatorioAttribute() 
	{
		return $this->attributes['HISTORICO_OBRIGATORIO'];
	}

	public function setHistoricoObrigatorioAttribute($historicoObrigatorio) 
	{
		$this->attributes['HISTORICO_OBRIGATORIO'] = $historicoObrigatorio;
	}

    public function getPermiteLancamentoZeradoAttribute() 
	{
		return $this->attributes['PERMITE_LANCAMENTO_ZERADO'];
	}

	public function setPermiteLancamentoZeradoAttribute($permiteLancamentoZerado) 
	{
		$this->attributes['PERMITE_LANCAMENTO_ZERADO'] = $permiteLancamentoZerado;
	}

    public function getGeraInformativoSpedAttribute() 
	{
		return $this->attributes['GERA_INFORMATIVO_SPED'];
	}

	public function setGeraInformativoSpedAttribute($geraInformativoSped) 
	{
		$this->attributes['GERA_INFORMATIVO_SPED'] = $geraInformativoSped;
	}

    public function getSpedFormaEscritDiarioAttribute() 
	{
		return $this->attributes['SPED_FORMA_ESCRIT_DIARIO'];
	}

	public function setSpedFormaEscritDiarioAttribute($spedFormaEscritDiario) 
	{
		$this->attributes['SPED_FORMA_ESCRIT_DIARIO'] = $spedFormaEscritDiario;
	}

    public function getSpedNomeLivroDiarioAttribute() 
	{
		return $this->attributes['SPED_NOME_LIVRO_DIARIO'];
	}

	public function setSpedNomeLivroDiarioAttribute($spedNomeLivroDiario) 
	{
		$this->attributes['SPED_NOME_LIVRO_DIARIO'] = $spedNomeLivroDiario;
	}

    public function getAssinaturaDireitaAttribute() 
	{
		return $this->attributes['ASSINATURA_DIREITA'];
	}

	public function setAssinaturaDireitaAttribute($assinaturaDireita) 
	{
		$this->attributes['ASSINATURA_DIREITA'] = $assinaturaDireita;
	}

    public function getAssinaturaEsquerdaAttribute() 
	{
		return $this->attributes['ASSINATURA_ESQUERDA'];
	}

	public function setAssinaturaEsquerdaAttribute($assinaturaEsquerda) 
	{
		$this->attributes['ASSINATURA_ESQUERDA'] = $assinaturaEsquerda;
	}

    public function getContaAtivoAttribute() 
	{
		return $this->attributes['CONTA_ATIVO'];
	}

	public function setContaAtivoAttribute($contaAtivo) 
	{
		$this->attributes['CONTA_ATIVO'] = $contaAtivo;
	}

    public function getContaPassivoAttribute() 
	{
		return $this->attributes['CONTA_PASSIVO'];
	}

	public function setContaPassivoAttribute($contaPassivo) 
	{
		$this->attributes['CONTA_PASSIVO'] = $contaPassivo;
	}

    public function getContaPatrimonioLiquidoAttribute() 
	{
		return $this->attributes['CONTA_PATRIMONIO_LIQUIDO'];
	}

	public function setContaPatrimonioLiquidoAttribute($contaPatrimonioLiquido) 
	{
		$this->attributes['CONTA_PATRIMONIO_LIQUIDO'] = $contaPatrimonioLiquido;
	}

    public function getContaDepreciacaoAcumuladaAttribute() 
	{
		return $this->attributes['CONTA_DEPRECIACAO_ACUMULADA'];
	}

	public function setContaDepreciacaoAcumuladaAttribute($contaDepreciacaoAcumulada) 
	{
		$this->attributes['CONTA_DEPRECIACAO_ACUMULADA'] = $contaDepreciacaoAcumulada;
	}

    public function getContaCapitalSocialAttribute() 
	{
		return $this->attributes['CONTA_CAPITAL_SOCIAL'];
	}

	public function setContaCapitalSocialAttribute($contaCapitalSocial) 
	{
		$this->attributes['CONTA_CAPITAL_SOCIAL'] = $contaCapitalSocial;
	}

    public function getContaResultadoExercicioAttribute() 
	{
		return $this->attributes['CONTA_RESULTADO_EXERCICIO'];
	}

	public function setContaResultadoExercicioAttribute($contaResultadoExercicio) 
	{
		$this->attributes['CONTA_RESULTADO_EXERCICIO'] = $contaResultadoExercicio;
	}

    public function getContaPrejuizoAcumuladoAttribute() 
	{
		return $this->attributes['CONTA_PREJUIZO_ACUMULADO'];
	}

	public function setContaPrejuizoAcumuladoAttribute($contaPrejuizoAcumulado) 
	{
		$this->attributes['CONTA_PREJUIZO_ACUMULADO'] = $contaPrejuizoAcumulado;
	}

    public function getContaLucroAcumuladoAttribute() 
	{
		return $this->attributes['CONTA_LUCRO_ACUMULADO'];
	}

	public function setContaLucroAcumuladoAttribute($contaLucroAcumulado) 
	{
		$this->attributes['CONTA_LUCRO_ACUMULADO'] = $contaLucroAcumulado;
	}

    public function getContaTituloPagarAttribute() 
	{
		return $this->attributes['CONTA_TITULO_PAGAR'];
	}

	public function setContaTituloPagarAttribute($contaTituloPagar) 
	{
		$this->attributes['CONTA_TITULO_PAGAR'] = $contaTituloPagar;
	}

    public function getContaTituloReceberAttribute() 
	{
		return $this->attributes['CONTA_TITULO_RECEBER'];
	}

	public function setContaTituloReceberAttribute($contaTituloReceber) 
	{
		$this->attributes['CONTA_TITULO_RECEBER'] = $contaTituloReceber;
	}

    public function getContaJurosPassivoAttribute() 
	{
		return $this->attributes['CONTA_JUROS_PASSIVO'];
	}

	public function setContaJurosPassivoAttribute($contaJurosPassivo) 
	{
		$this->attributes['CONTA_JUROS_PASSIVO'] = $contaJurosPassivo;
	}

    public function getContaJurosAtivoAttribute() 
	{
		return $this->attributes['CONTA_JUROS_ATIVO'];
	}

	public function setContaJurosAtivoAttribute($contaJurosAtivo) 
	{
		$this->attributes['CONTA_JUROS_ATIVO'] = $contaJurosAtivo;
	}

    public function getContaDescontoObtidoAttribute() 
	{
		return $this->attributes['CONTA_DESCONTO_OBTIDO'];
	}

	public function setContaDescontoObtidoAttribute($contaDescontoObtido) 
	{
		$this->attributes['CONTA_DESCONTO_OBTIDO'] = $contaDescontoObtido;
	}

    public function getContaDescontoConcedidoAttribute() 
	{
		return $this->attributes['CONTA_DESCONTO_CONCEDIDO'];
	}

	public function setContaDescontoConcedidoAttribute($contaDescontoConcedido) 
	{
		$this->attributes['CONTA_DESCONTO_CONCEDIDO'] = $contaDescontoConcedido;
	}

    public function getContaCmvAttribute() 
	{
		return $this->attributes['CONTA_CMV'];
	}

	public function setContaCmvAttribute($contaCmv) 
	{
		$this->attributes['CONTA_CMV'] = $contaCmv;
	}

    public function getContaVendaAttribute() 
	{
		return $this->attributes['CONTA_VENDA'];
	}

	public function setContaVendaAttribute($contaVenda) 
	{
		$this->attributes['CONTA_VENDA'] = $contaVenda;
	}

    public function getContaVendaServicoAttribute() 
	{
		return $this->attributes['CONTA_VENDA_SERVICO'];
	}

	public function setContaVendaServicoAttribute($contaVendaServico) 
	{
		$this->attributes['CONTA_VENDA_SERVICO'] = $contaVendaServico;
	}

    public function getContaEstoqueAttribute() 
	{
		return $this->attributes['CONTA_ESTOQUE'];
	}

	public function setContaEstoqueAttribute($contaEstoque) 
	{
		$this->attributes['CONTA_ESTOQUE'] = $contaEstoque;
	}

    public function getContaApuraResultadoAttribute() 
	{
		return $this->attributes['CONTA_APURA_RESULTADO'];
	}

	public function setContaApuraResultadoAttribute($contaApuraResultado) 
	{
		$this->attributes['CONTA_APURA_RESULTADO'] = $contaApuraResultado;
	}

    public function getContaJurosApropriarAttribute() 
	{
		return $this->attributes['CONTA_JUROS_APROPRIAR'];
	}

	public function setContaJurosApropriarAttribute($contaJurosApropriar) 
	{
		$this->attributes['CONTA_JUROS_APROPRIAR'] = $contaJurosApropriar;
	}

    public function getIdHistPadraoResultadoAttribute() 
	{
		return $this->attributes['ID_HIST_PADRAO_RESULTADO'];
	}

	public function setIdHistPadraoResultadoAttribute($idHistPadraoResultado) 
	{
		$this->attributes['ID_HIST_PADRAO_RESULTADO'] = $idHistPadraoResultado;
	}

    public function getIdHistPadraoLucroAttribute() 
	{
		return $this->attributes['ID_HIST_PADRAO_LUCRO'];
	}

	public function setIdHistPadraoLucroAttribute($idHistPadraoLucro) 
	{
		$this->attributes['ID_HIST_PADRAO_LUCRO'] = $idHistPadraoLucro;
	}

    public function getIdHistPadraoPrejuizoAttribute() 
	{
		return $this->attributes['ID_HIST_PADRAO_PREJUIZO'];
	}

	public function setIdHistPadraoPrejuizoAttribute($idHistPadraoPrejuizo) 
	{
		$this->attributes['ID_HIST_PADRAO_PREJUIZO'] = $idHistPadraoPrejuizo;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setMascaraAttribute($objeto->mascara);
			$this->setNiveisAttribute($objeto->niveis);
			$this->setInformarContaPorAttribute($objeto->informarContaPor);
			$this->setCompartilhaPlanoContaAttribute($objeto->compartilhaPlanoConta);
			$this->setCompartilhaHistoricosAttribute($objeto->compartilhaHistoricos);
			$this->setAlteraLancamentoOutroAttribute($objeto->alteraLancamentoOutro);
			$this->setHistoricoObrigatorioAttribute($objeto->historicoObrigatorio);
			$this->setPermiteLancamentoZeradoAttribute($objeto->permiteLancamentoZerado);
			$this->setGeraInformativoSpedAttribute($objeto->geraInformativoSped);
			$this->setSpedFormaEscritDiarioAttribute($objeto->spedFormaEscritDiario);
			$this->setSpedNomeLivroDiarioAttribute($objeto->spedNomeLivroDiario);
			$this->setAssinaturaDireitaAttribute($objeto->assinaturaDireita);
			$this->setAssinaturaEsquerdaAttribute($objeto->assinaturaEsquerda);
			$this->setContaAtivoAttribute($objeto->contaAtivo);
			$this->setContaPassivoAttribute($objeto->contaPassivo);
			$this->setContaPatrimonioLiquidoAttribute($objeto->contaPatrimonioLiquido);
			$this->setContaDepreciacaoAcumuladaAttribute($objeto->contaDepreciacaoAcumulada);
			$this->setContaCapitalSocialAttribute($objeto->contaCapitalSocial);
			$this->setContaResultadoExercicioAttribute($objeto->contaResultadoExercicio);
			$this->setContaPrejuizoAcumuladoAttribute($objeto->contaPrejuizoAcumulado);
			$this->setContaLucroAcumuladoAttribute($objeto->contaLucroAcumulado);
			$this->setContaTituloPagarAttribute($objeto->contaTituloPagar);
			$this->setContaTituloReceberAttribute($objeto->contaTituloReceber);
			$this->setContaJurosPassivoAttribute($objeto->contaJurosPassivo);
			$this->setContaJurosAtivoAttribute($objeto->contaJurosAtivo);
			$this->setContaDescontoObtidoAttribute($objeto->contaDescontoObtido);
			$this->setContaDescontoConcedidoAttribute($objeto->contaDescontoConcedido);
			$this->setContaCmvAttribute($objeto->contaCmv);
			$this->setContaVendaAttribute($objeto->contaVenda);
			$this->setContaVendaServicoAttribute($objeto->contaVendaServico);
			$this->setContaEstoqueAttribute($objeto->contaEstoque);
			$this->setContaApuraResultadoAttribute($objeto->contaApuraResultado);
			$this->setContaJurosApropriarAttribute($objeto->contaJurosApropriar);
			$this->setIdHistPadraoResultadoAttribute($objeto->idHistPadraoResultado);
			$this->setIdHistPadraoLucroAttribute($objeto->idHistPadraoLucro);
			$this->setIdHistPadraoPrejuizoAttribute($objeto->idHistPadraoPrejuizo);

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
			'mascara' => $this->getMascaraAttribute(),
			'niveis' => $this->getNiveisAttribute(),
			'informarContaPor' => $this->getInformarContaPorAttribute(),
			'compartilhaPlanoConta' => $this->getCompartilhaPlanoContaAttribute(),
			'compartilhaHistoricos' => $this->getCompartilhaHistoricosAttribute(),
			'alteraLancamentoOutro' => $this->getAlteraLancamentoOutroAttribute(),
			'historicoObrigatorio' => $this->getHistoricoObrigatorioAttribute(),
			'permiteLancamentoZerado' => $this->getPermiteLancamentoZeradoAttribute(),
			'geraInformativoSped' => $this->getGeraInformativoSpedAttribute(),
			'spedFormaEscritDiario' => $this->getSpedFormaEscritDiarioAttribute(),
			'spedNomeLivroDiario' => $this->getSpedNomeLivroDiarioAttribute(),
			'assinaturaDireita' => $this->getAssinaturaDireitaAttribute(),
			'assinaturaEsquerda' => $this->getAssinaturaEsquerdaAttribute(),
			'contaAtivo' => $this->getContaAtivoAttribute(),
			'contaPassivo' => $this->getContaPassivoAttribute(),
			'contaPatrimonioLiquido' => $this->getContaPatrimonioLiquidoAttribute(),
			'contaDepreciacaoAcumulada' => $this->getContaDepreciacaoAcumuladaAttribute(),
			'contaCapitalSocial' => $this->getContaCapitalSocialAttribute(),
			'contaResultadoExercicio' => $this->getContaResultadoExercicioAttribute(),
			'contaPrejuizoAcumulado' => $this->getContaPrejuizoAcumuladoAttribute(),
			'contaLucroAcumulado' => $this->getContaLucroAcumuladoAttribute(),
			'contaTituloPagar' => $this->getContaTituloPagarAttribute(),
			'contaTituloReceber' => $this->getContaTituloReceberAttribute(),
			'contaJurosPassivo' => $this->getContaJurosPassivoAttribute(),
			'contaJurosAtivo' => $this->getContaJurosAtivoAttribute(),
			'contaDescontoObtido' => $this->getContaDescontoObtidoAttribute(),
			'contaDescontoConcedido' => $this->getContaDescontoConcedidoAttribute(),
			'contaCmv' => $this->getContaCmvAttribute(),
			'contaVenda' => $this->getContaVendaAttribute(),
			'contaVendaServico' => $this->getContaVendaServicoAttribute(),
			'contaEstoque' => $this->getContaEstoqueAttribute(),
			'contaApuraResultado' => $this->getContaApuraResultadoAttribute(),
			'contaJurosApropriar' => $this->getContaJurosApropriarAttribute(),
			'idHistPadraoResultado' => $this->getIdHistPadraoResultadoAttribute(),
			'idHistPadraoLucro' => $this->getIdHistPadraoLucroAttribute(),
			'idHistPadraoPrejuizo' => $this->getIdHistPadraoPrejuizoAttribute(),
        ];
    }
}