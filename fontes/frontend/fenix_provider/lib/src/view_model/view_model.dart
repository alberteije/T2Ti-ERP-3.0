/*
Title: T2Ti ERP 3.0                                                                
Description: ViewModel que exporta as demais ViewModels
                                                                                
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

// módulo cadastros
export 'package:fenix/src/view_model/cadastros/banco_view_model.dart';
export 'package:fenix/src/view_model/cadastros/banco_agencia_view_model.dart';
export 'package:fenix/src/view_model/cadastros/pessoa_view_model.dart';
export 'package:fenix/src/view_model/cadastros/produto_view_model.dart';
export 'package:fenix/src/view_model/cadastros/banco_conta_caixa_view_model.dart';
export 'package:fenix/src/view_model/cadastros/cargo_view_model.dart';
export 'package:fenix/src/view_model/cadastros/cep_view_model.dart';
export 'package:fenix/src/view_model/cadastros/cfop_view_model.dart';
export 'package:fenix/src/view_model/cadastros/cliente_view_model.dart';
export 'package:fenix/src/view_model/cadastros/cnae_view_model.dart';
export 'package:fenix/src/view_model/cadastros/colaborador_view_model.dart';
export 'package:fenix/src/view_model/cadastros/setor_view_model.dart';
export 'package:fenix/src/view_model/cadastros/papel_view_model.dart';
export 'package:fenix/src/view_model/cadastros/contador_view_model.dart';
export 'package:fenix/src/view_model/cadastros/csosn_view_model.dart';
export 'package:fenix/src/view_model/cadastros/cst_cofins_view_model.dart';
export 'package:fenix/src/view_model/cadastros/cst_icms_view_model.dart';
export 'package:fenix/src/view_model/cadastros/cst_ipi_view_model.dart';
export 'package:fenix/src/view_model/cadastros/cst_pis_view_model.dart';
export 'package:fenix/src/view_model/cadastros/estado_civil_view_model.dart';
export 'package:fenix/src/view_model/cadastros/fornecedor_view_model.dart';
export 'package:fenix/src/view_model/cadastros/municipio_view_model.dart';
export 'package:fenix/src/view_model/cadastros/ncm_view_model.dart';
export 'package:fenix/src/view_model/cadastros/nivel_formacao_view_model.dart';
export 'package:fenix/src/view_model/cadastros/transportadora_view_model.dart';
export 'package:fenix/src/view_model/cadastros/uf_view_model.dart';
export 'package:fenix/src/view_model/cadastros/vendedor_view_model.dart';
export 'package:fenix/src/view_model/cadastros/produto_grupo_view_model.dart';
export 'package:fenix/src/view_model/cadastros/produto_marca_view_model.dart';
export 'package:fenix/src/view_model/cadastros/produto_subgrupo_view_model.dart';
export 'package:fenix/src/view_model/cadastros/produto_unidade_view_model.dart';
export 'package:fenix/src/view_model/cadastros/usuario_view_model.dart';

// bloco financeiro
export 'package:fenix/src/view_model/financeiro/fin_cheque_emitido_view_model.dart';
export 'package:fenix/src/view_model/financeiro/fin_cheque_recebido_view_model.dart';
export 'package:fenix/src/view_model/financeiro/fin_configuracao_boleto_view_model.dart';
export 'package:fenix/src/view_model/financeiro/fin_documento_origem_view_model.dart';
export 'package:fenix/src/view_model/financeiro/fin_extrato_conta_banco_view_model.dart';
export 'package:fenix/src/view_model/financeiro/fin_fechamento_caixa_banco_view_model.dart';
export 'package:fenix/src/view_model/financeiro/fin_lancamento_pagar_view_model.dart';
export 'package:fenix/src/view_model/financeiro/fin_lancamento_receber_view_model.dart';
export 'package:fenix/src/view_model/financeiro/fin_natureza_financeira_view_model.dart';
export 'package:fenix/src/view_model/financeiro/fin_status_parcela_view_model.dart';
export 'package:fenix/src/view_model/financeiro/fin_tipo_pagamento_view_model.dart';
export 'package:fenix/src/view_model/financeiro/fin_tipo_recebimento_view_model.dart';
export 'package:fenix/src/view_model/financeiro/talonario_cheque_view_model.dart';
export 'package:fenix/src/view_model/financeiro/fin_parcela_pagar_view_model.dart';
export 'package:fenix/src/view_model/financeiro/fin_parcela_receber_view_model.dart';

// tributação
export 'package:fenix/src/view_model/tributacao/tribut_configura_of_gt_view_model.dart';
export 'package:fenix/src/view_model/tributacao/tribut_grupo_tributario_view_model.dart';
export 'package:fenix/src/view_model/tributacao/tribut_icms_custom_cab_view_model.dart';
export 'package:fenix/src/view_model/tributacao/tribut_iss_view_model.dart';
export 'package:fenix/src/view_model/tributacao/tribut_operacao_fiscal_view_model.dart';

// estoque
export 'package:fenix/src/view_model/estoque/estoque_reajuste_cabecalho_view_model.dart';
export 'package:fenix/src/view_model/estoque/requisicao_interna_cabecalho_view_model.dart';

// vendas
export 'package:fenix/src/view_model/vendas/nota_fiscal_modelo_view_model.dart';
export 'package:fenix/src/view_model/vendas/nota_fiscal_tipo_view_model.dart';
export 'package:fenix/src/view_model/vendas/venda_cabecalho_view_model.dart';
export 'package:fenix/src/view_model/vendas/venda_condicoes_pagamento_view_model.dart';
export 'package:fenix/src/view_model/vendas/venda_frete_view_model.dart';
export 'package:fenix/src/view_model/vendas/venda_orcamento_cabecalho_view_model.dart';

// compras
export 'package:fenix/src/view_model/compras/compra_cotacao_view_model.dart';
export 'package:fenix/src/view_model/compras/compra_pedido_view_model.dart';
export 'package:fenix/src/view_model/compras/compra_requisicao_view_model.dart';
export 'package:fenix/src/view_model/compras/compra_tipo_pedido_view_model.dart';
export 'package:fenix/src/view_model/compras/compra_tipo_requisicao_view_model.dart';

// comissões
export 'package:fenix/src/view_model/comissoes/comissao_objetivo_view_model.dart';
export 'package:fenix/src/view_model/comissoes/comissao_perfil_view_model.dart';

// ordem de serviço
export 'package:fenix/src/view_model/os/os_abertura_view_model.dart';
export 'package:fenix/src/view_model/os/os_equipamento_view_model.dart';
export 'package:fenix/src/view_model/os/os_status_view_model.dart';

// afv
export 'package:fenix/src/view_model/afv/tabela_preco_view_model.dart';
export 'package:fenix/src/view_model/afv/vendedor_rota_view_model.dart';
export 'package:fenix/src/view_model/afv/vendedor_meta_view_model.dart';

// nfs-e
export 'package:fenix/src/view_model/nfse/nfse_cabecalho_view_model.dart';
export 'package:fenix/src/view_model/nfse/nfse_lista_servico_view_model.dart';

// views
export 'package:fenix/src/view_model/views_db/view_pessoa_colaborador_view_model.dart';
export 'package:fenix/src/view_model/views_db/view_pessoa_fornecedor_view_model.dart';
export 'package:fenix/src/view_model/views_db/view_pessoa_cliente_view_model.dart';
export 'package:fenix/src/view_model/views_db/view_fin_lancamento_pagar_view_model.dart';
export 'package:fenix/src/view_model/views_db/view_fin_lancamento_receber_view_model.dart';
export 'package:fenix/src/view_model/views_db/view_fin_movimento_caixa_banco_view_model.dart';
export 'package:fenix/src/view_model/views_db/view_fin_cheque_nao_compensado_view_model.dart';
export 'package:fenix/src/view_model/views_db/view_fin_fluxo_caixa_view_model.dart';

// nf-e
export 'package:fenix/src/view_model/nfe/nfe_cabecalho_view_model.dart';

// ged
export 'package:fenix/src/view_model/ged/ged_documento_cabecalho_view_model.dart';
export 'package:fenix/src/view_model/ged/ged_tipo_documento_view_model.dart';

// ct-e
export 'package:fenix/src/view_model/cte/cte_cabecalho_view_model.dart';

// inventário
export 'package:fenix/src/view_model/inventario/inventario_contagem_cab_view_model.dart';
