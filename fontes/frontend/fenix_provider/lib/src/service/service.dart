/*
Title: T2Ti ERP 3.0                                                                
Description: Service que exporta os demais Services
                                                                                
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
// adm
export 'package:fenix/src/service/adm/empresa_service.dart';

// módulo cadastros
export 'package:fenix/src/service/cadastros/banco_service.dart';
export 'package:fenix/src/service/cadastros/banco_agencia_service.dart';
export 'package:fenix/src/service/cadastros/pessoa_service.dart';
export 'package:fenix/src/service/cadastros/produto_service.dart';
export 'package:fenix/src/service/cadastros/banco_conta_caixa_service.dart';
export 'package:fenix/src/service/cadastros/cargo_service.dart';
export 'package:fenix/src/service/cadastros/cep_service.dart';
export 'package:fenix/src/service/cadastros/cfop_service.dart';
export 'package:fenix/src/service/cadastros/cliente_service.dart';
export 'package:fenix/src/service/cadastros/cnae_service.dart';
export 'package:fenix/src/service/cadastros/colaborador_service.dart';
export 'package:fenix/src/service/cadastros/setor_service.dart';
export 'package:fenix/src/service/cadastros/papel_service.dart';
export 'package:fenix/src/service/cadastros/contador_service.dart';
export 'package:fenix/src/service/cadastros/csosn_service.dart';
export 'package:fenix/src/service/cadastros/cst_cofins_service.dart';
export 'package:fenix/src/service/cadastros/cst_icms_service.dart';
export 'package:fenix/src/service/cadastros/cst_ipi_service.dart';
export 'package:fenix/src/service/cadastros/cst_pis_service.dart';
export 'package:fenix/src/service/cadastros/estado_civil_service.dart';
export 'package:fenix/src/service/cadastros/fornecedor_service.dart';
export 'package:fenix/src/service/cadastros/municipio_service.dart';
export 'package:fenix/src/service/cadastros/ncm_service.dart';
export 'package:fenix/src/service/cadastros/nivel_formacao_service.dart';
export 'package:fenix/src/service/cadastros/transportadora_service.dart';
export 'package:fenix/src/service/cadastros/uf_service.dart';
export 'package:fenix/src/service/cadastros/vendedor_service.dart';
export 'package:fenix/src/service/cadastros/produto_grupo_service.dart';
export 'package:fenix/src/service/cadastros/produto_marca_service.dart';
export 'package:fenix/src/service/cadastros/produto_subgrupo_service.dart';
export 'package:fenix/src/service/cadastros/produto_unidade_service.dart';
export 'package:fenix/src/service/cadastros/usuario_service.dart';

// bloco financeiro
export 'package:fenix/src/service/financeiro/fin_cheque_emitido_service.dart';
export 'package:fenix/src/service/financeiro/fin_cheque_recebido_service.dart';
export 'package:fenix/src/service/financeiro/fin_configuracao_boleto_service.dart';
export 'package:fenix/src/service/financeiro/fin_documento_origem_service.dart';
export 'package:fenix/src/service/financeiro/fin_extrato_conta_banco_service.dart';
export 'package:fenix/src/service/financeiro/fin_fechamento_caixa_banco_service.dart';
export 'package:fenix/src/service/financeiro/fin_lancamento_pagar_service.dart';
export 'package:fenix/src/service/financeiro/fin_lancamento_receber_service.dart';
export 'package:fenix/src/service/financeiro/fin_natureza_financeira_service.dart';
export 'package:fenix/src/service/financeiro/fin_status_parcela_service.dart';
export 'package:fenix/src/service/financeiro/fin_tipo_pagamento_service.dart';
export 'package:fenix/src/service/financeiro/fin_tipo_recebimento_service.dart';
export 'package:fenix/src/service/financeiro/talonario_cheque_service.dart';
export 'package:fenix/src/service/financeiro/fin_parcela_pagar_service.dart';
export 'package:fenix/src/service/financeiro/fin_parcela_receber_service.dart';

// tributação
export 'package:fenix/src/service/tributacao/tribut_configura_of_gt_service.dart';
export 'package:fenix/src/service/tributacao/tribut_grupo_tributario_service.dart';
export 'package:fenix/src/service/tributacao/tribut_icms_custom_cab_service.dart';
export 'package:fenix/src/service/tributacao/tribut_iss_service.dart';
export 'package:fenix/src/service/tributacao/tribut_operacao_fiscal_service.dart';

// estoque
export 'package:fenix/src/service/estoque/estoque_reajuste_cabecalho_service.dart';
export 'package:fenix/src/service/estoque/requisicao_interna_cabecalho_service.dart';

// vendas
export 'package:fenix/src/service/vendas/nota_fiscal_modelo_service.dart';
export 'package:fenix/src/service/vendas/nota_fiscal_tipo_service.dart';
export 'package:fenix/src/service/vendas/venda_cabecalho_service.dart';
export 'package:fenix/src/service/vendas/venda_condicoes_pagamento_service.dart';
export 'package:fenix/src/service/vendas/venda_frete_service.dart';
export 'package:fenix/src/service/vendas/venda_orcamento_cabecalho_service.dart';

// compras
export 'package:fenix/src/service/compras/compra_cotacao_service.dart';
export 'package:fenix/src/service/compras/compra_pedido_service.dart';
export 'package:fenix/src/service/compras/compra_requisicao_service.dart';
export 'package:fenix/src/service/compras/compra_tipo_pedido_service.dart';
export 'package:fenix/src/service/compras/compra_tipo_requisicao_service.dart';

// comissões
export 'package:fenix/src/service/comissoes/comissao_objetivo_service.dart';
export 'package:fenix/src/service/comissoes/comissao_perfil_service.dart';

// ordem de serviço
export 'package:fenix/src/service/os/os_abertura_service.dart';
export 'package:fenix/src/service/os/os_equipamento_service.dart';
export 'package:fenix/src/service/os/os_status_service.dart';

// afv
export 'package:fenix/src/service/afv/tabela_preco_service.dart';
export 'package:fenix/src/service/afv/vendedor_rota_service.dart';
export 'package:fenix/src/service/afv/vendedor_meta_service.dart';

// nfs-e
export 'package:fenix/src/service/nfse/nfse_cabecalho_service.dart';
export 'package:fenix/src/service/nfse/nfse_lista_servico_service.dart';

// views
export 'package:fenix/src/service/views_db/view_pessoa_colaborador_service.dart';
export 'package:fenix/src/service/views_db/view_pessoa_fornecedor_service.dart';
export 'package:fenix/src/service/views_db/view_pessoa_cliente_service.dart';
export 'package:fenix/src/service/views_db/view_fin_lancamento_pagar_service.dart';
export 'package:fenix/src/service/views_db/view_fin_lancamento_receber_service.dart';
export 'package:fenix/src/service/views_db/view_fin_movimento_caixa_banco_service.dart';
export 'package:fenix/src/service/views_db/view_fin_cheque_nao_compensado_service.dart';
export 'package:fenix/src/service/views_db/view_fin_fluxo_caixa_service.dart';

// nf-e
export 'package:fenix/src/service/nfe/nfe_cabecalho_service.dart';

// ged
export 'package:fenix/src/service/ged/ged_documento_cabecalho_service.dart';
export 'package:fenix/src/service/ged/ged_tipo_documento_service.dart';

// ct-e
export 'package:fenix/src/service/cte/cte_cabecalho_service.dart';

// inventario
export 'package:fenix/src/service/inventario/inventario_contagem_cab_service.dart';