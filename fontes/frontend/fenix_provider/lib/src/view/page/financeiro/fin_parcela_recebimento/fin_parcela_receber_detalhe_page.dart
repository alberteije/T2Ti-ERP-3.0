/*
Title: T2Ti ERP 3.0                                                                
Description: DetalhePage relacionada à tabela [FIN_PARCELA_RECEBER] 
                                                                                
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
import 'package:fenix/src/view/shared/caixas_de_dialogo.dart';
import 'package:fenix/src/view/shared/widgets_pagina_detalhe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/view_model/view_model.dart';
import 'package:fenix/src/view/shared/view_util_lib.dart';
import 'package:fenix/src/infra/constantes.dart';
import 'package:intl/intl.dart';
import 'fin_parcela_receber_persiste_page.dart';

class FinParcelaReceberDetalhePage extends StatelessWidget {
  final FinParcelaReceber? finParcelaReceber;

  const FinParcelaReceberDetalhePage({Key? key, this.finParcelaReceber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var finParcelaReceberProvider = Provider.of<FinParcelaReceberViewModel>(context);

      return Theme(
          data: getThemeDataDetalhePage(context),
          child: Scaffold(
            appBar: AppBar(title: const Text('Recebimento Parcela'), actions: <Widget>[
              IconButton(
                icon: ViewUtilLib.getIconBotaoExcluir(),
                onPressed: () {
                  gerarDialogBoxExclusao(context, () {
                    finParcelaReceberProvider.excluir(finParcelaReceber?.id!);
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  });
                },
              ),
              IconButton(
                icon: ViewUtilLib.getIconBotaoAlterar(),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => FinParcelaReceberPersistePage(
                          finParcelaReceber: finParcelaReceber,
                          title: 'Recebimento Parcela - Editando',
                          operacao: 'A')));
                },
              ),
            ]),
            body: SingleChildScrollView(
              child: Theme(
                data: ThemeData(fontFamily: 'Raleway'),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    getPaddingDetalhePage('Detalhes do Recebimento'),
                    Card(
                      color: Colors.white,
                      elevation: 2.0,
                      child: Column(
                        children: <Widget>[
                        getListTileDataDetalhePageId(
                            finParcelaReceber!.id?.toString() ?? '', 'Id'),
                        getListTileDataDetalhePage(
                          finParcelaReceber!.finStatusParcela?.descricao?.toString() ?? '', 'Status Parcela'),
                        getListTileDataDetalhePage(
                          finParcelaReceber!.finTipoRecebimento?.descricao?.toString() ?? '', 'Tipo Recebimento'),
                        getListTileDataDetalhePage(
                          finParcelaReceber!.finChequeRecebido?.numero?.toString() ?? '', 'Cheque'),
                        getListTileDataDetalhePage(
                          finParcelaReceber!.numeroParcela?.toString() ?? '', 'Número da Parcela'),
                        getListTileDataDetalhePage(
                          finParcelaReceber!.dataEmissao != null ? DateFormat('dd/MM/yyyy').format(finParcelaReceber!.dataEmissao!) : '', 'Data de Emissão'),
                        getListTileDataDetalhePage(
                          finParcelaReceber!.dataVencimento != null ? DateFormat('dd/MM/yyyy').format(finParcelaReceber!.dataVencimento!) : '', 'Data de Vencimento'),
                        getListTileDataDetalhePage(
                          finParcelaReceber!.dataRecebimento != null ? DateFormat('dd/MM/yyyy').format(finParcelaReceber!.dataRecebimento!) : '', 'Data de Recebimento'),
                        getListTileDataDetalhePage(
                          finParcelaReceber!.descontoAte != null ? DateFormat('dd/MM/yyyy').format(finParcelaReceber!.descontoAte!) : '', 'Desconto Até'),
                        getListTileDataDetalhePage(
                          finParcelaReceber!.valor != null ? Constantes.formatoDecimalValor.format(finParcelaReceber!.valor) : 0.toStringAsFixed(Constantes.decimaisValor), 'Valor'),
                        getListTileDataDetalhePage(
                          finParcelaReceber!.taxaJuro != null ? Constantes.formatoDecimalTaxa.format(finParcelaReceber!.taxaJuro) : 0.toStringAsFixed(Constantes.decimaisTaxa), 'Taxa Juros'),
                        getListTileDataDetalhePage(
                          finParcelaReceber!.taxaMulta != null ? Constantes.formatoDecimalTaxa.format(finParcelaReceber!.taxaMulta) : 0.toStringAsFixed(Constantes.decimaisTaxa), 'Taxa Multa'),
                        getListTileDataDetalhePage(
                          finParcelaReceber!.taxaDesconto != null ? Constantes.formatoDecimalTaxa.format(finParcelaReceber!.taxaDesconto) : 0.toStringAsFixed(Constantes.decimaisTaxa), 'Taxa Desconto'),
                        getListTileDataDetalhePage(
                          finParcelaReceber!.valorJuro != null ? Constantes.formatoDecimalValor.format(finParcelaReceber!.valorJuro) : 0.toStringAsFixed(Constantes.decimaisValor), 'Valor Juros'),
                        getListTileDataDetalhePage(
                          finParcelaReceber!.valorMulta != null ? Constantes.formatoDecimalValor.format(finParcelaReceber!.valorMulta) : 0.toStringAsFixed(Constantes.decimaisValor), 'Valor Multa'),
                        getListTileDataDetalhePage(
                          finParcelaReceber!.valorDesconto != null ? Constantes.formatoDecimalValor.format(finParcelaReceber!.valorDesconto) : 0.toStringAsFixed(Constantes.decimaisValor), 'Valor Desconto'),
						getListTileDataDetalhePage(
							finParcelaReceber!.emitiuBoleto ?? '', 'Emitiu Boleto'),
						getListTileDataDetalhePage(
							finParcelaReceber!.boletoNossoNumero ?? '', 'Boleto Nosso Número'),
                        getListTileDataDetalhePage(
                          finParcelaReceber!.valorRecebido != null ? Constantes.formatoDecimalValor.format(finParcelaReceber!.valorRecebido) : 0.toStringAsFixed(Constantes.decimaisValor), 'Valor Recebido'),
                        getListTileDataDetalhePage(
                          finParcelaReceber!.historico ?? '', 'Histórico'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ));
    }
  
}