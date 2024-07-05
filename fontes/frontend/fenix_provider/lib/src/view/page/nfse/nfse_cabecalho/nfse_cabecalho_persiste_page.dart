/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre PersistePage relacionada à tabela [NFSE_CABECALHO] 
                                                                                
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
import 'package:fenix/src/view/shared/widgets_abas.dart';
import 'package:fenix/src/view/shared/widgets_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/view/shared/view_util_lib.dart';

import 'package:fenix/src/view/shared/page/lookup_page.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:fenix/src/infra/constantes.dart';
//import 'package:fenix/src/view/shared/valida_campo_formulario.dart';

class NfseCabecalhoPersistePage extends StatefulWidget {
  final NfseCabecalho? nfseCabecalho;
  final GlobalKey<FormState>? formKey;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Function? atualizaNfseCabecalhoCallBack;

  const NfseCabecalhoPersistePage(
      {Key? key, this.formKey, this.scaffoldKey, this.nfseCabecalho, this.atualizaNfseCabecalhoCallBack})
      : super(key: key);

  @override
  NfseCabecalhoPersistePageState createState() => NfseCabecalhoPersistePageState();
}

class NfseCabecalhoPersistePageState extends State<NfseCabecalhoPersistePage> {
  @override
  Widget build(BuildContext context) {
	var importaClienteController = TextEditingController();
	importaClienteController.text = widget.nfseCabecalho?.cliente?.pessoa?.nome ?? '';
	var importaOsAberturaController = TextEditingController();
	importaOsAberturaController.text = widget.nfseCabecalho?.osAbertura?.numero ?? '';
	var competenciaController = MaskedTextController(
		mask: Constantes.mascaraMES_ANO,
		text: widget.nfseCabecalho?.competencia ?? '',
	);

    return Scaffold(
      drawerDragStartBehavior: DragStartBehavior.down,
      key: widget.scaffoldKey,
      body: SafeArea(
        top: false,
        bottom: false,
        child: Form(
          key: widget.formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Scrollbar(
            child: SingleChildScrollView(
              dragStartBehavior: DragStartBehavior.down,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
				  const SizedBox(height: 24.0),
				  Row(
				  	children: <Widget>[
				  		Expanded(
				  			flex: 1,
				  			child: SizedBox(
				  				child: TextFormField(
				  					controller: importaClienteController,
				  					readOnly: true,
				  					decoration: getInputDecoration(
				  						'Importe o Cliente Vinculado',
				  						'Cliente *',
				  						false),
				  					onSaved: (String? value) {
				  					},
				  					onChanged: (text) {
				  						widget.nfseCabecalho?.cliente?.pessoa?.nome = text;
				  						paginaMestreDetalheFoiAlterada = true;
				  					},
				  				),
				  			),
				  		),
				  		Expanded(
				  			flex: 0,
				  			child: IconButton(
				  				tooltip: 'Importar Cliente',
				  				icon: const Icon(Icons.search),
				  				onPressed: () async {
				  					///chamando o lookup
				  					Map<String, dynamic>? objetoJsonRetorno =
				  						await Navigator.push(
				  							context,
				  							MaterialPageRoute(
				  								builder: (BuildContext context) =>
				  									LookupPage(
				  										title: 'Importar Cliente',
				  										colunas: ViewPessoaCliente.colunas,
				  										campos: ViewPessoaCliente.campos,
				  										rota: '/view-pessoa-cliente/',
				  										campoPesquisaPadrao: 'nome',
				  										valorPesquisaPadrao: '%',
				  									),
				  									fullscreenDialog: true,
				  								));
				  				if (objetoJsonRetorno != null) {
				  					if (objetoJsonRetorno['nome'] != null) {
				  						importaClienteController.text = objetoJsonRetorno['nome'];
				  						widget.nfseCabecalho!.idCliente = objetoJsonRetorno['id'];
				  						widget.nfseCabecalho!.cliente = Cliente.fromJson(objetoJsonRetorno);
                      widget.nfseCabecalho!.cliente!.pessoa = ViewPessoaCliente(nome: objetoJsonRetorno['nome']);
				  					}
				  				}
				  			},
				  		),
				  		),
				  	],
				  ),
				  const SizedBox(height: 24.0),
				  Row(
				  	children: <Widget>[
				  		Expanded(
				  			flex: 1,
				  			child: SizedBox(
				  				child: TextFormField(
				  					controller: importaOsAberturaController,
				  					readOnly: true,
				  					decoration: getInputDecoration(
				  						'Importe o Ordem de Serviço Vinculado',
				  						'Ordem de Serviço *',
				  						false),
				  					onSaved: (String? value) {
				  					},
				  					onChanged: (text) {
				  						widget.nfseCabecalho?.osAbertura?.numero = text;
				  						paginaMestreDetalheFoiAlterada = true;
				  					},
				  				),
				  			),
				  		),
				  		Expanded(
				  			flex: 0,
				  			child: IconButton(
				  				tooltip: 'Importar Ordem de Serviço',
				  				icon: const Icon(Icons.search),
				  				onPressed: () async {
				  					///chamando o lookup
				  					Map<String, dynamic>? objetoJsonRetorno =
				  						await Navigator.push(
				  							context,
				  							MaterialPageRoute(
				  								builder: (BuildContext context) =>
				  									LookupPage(
				  										title: 'Importar Ordem de Serviço',
				  										colunas: OsAbertura.colunas,
				  										campos: OsAbertura.campos,
				  										rota: '/os-abertura/',
				  										campoPesquisaPadrao: 'numero',
				  										valorPesquisaPadrao: '',
				  									),
				  									fullscreenDialog: true,
				  								));
				  				if (objetoJsonRetorno != null) {
				  					if (objetoJsonRetorno['numero'] != null) {
				  						importaOsAberturaController.text = objetoJsonRetorno['numero'];
				  						widget.nfseCabecalho!.idOsAbertura = objetoJsonRetorno['id'];
				  						widget.nfseCabecalho!.osAbertura = OsAbertura.fromJson(objetoJsonRetorno);
				  					}
				  				}
				  			},
				  		),
				  		),
				  	],
				  ),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	maxLength: 15,
				  	maxLines: 1,
				  	initialValue: widget.nfseCabecalho?.numero ?? '',
				  	decoration: getInputDecoration(
				  		'Informe o Número',
				  		'Número',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.nfseCabecalho!.numero = text;
				  		paginaMestreDetalheFoiAlterada = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	maxLength: 9,
				  	maxLines: 1,
				  	initialValue: widget.nfseCabecalho?.codigoVerificacao ?? '',
				  	decoration: getInputDecoration(
				  		'Informe o Código Verificação',
				  		'Código Verificação',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.nfseCabecalho!.codigoVerificacao = text;
				  		paginaMestreDetalheFoiAlterada = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  InputDecorator(
				  	decoration: getInputDecoration(
				  		'Informe a Data/Hora Emissão',
				  		'Data/Hora Emissão *',
				  		true),
				  	isEmpty: widget.nfseCabecalho!.dataHoraEmissao == null,
				  	child: DatePickerItem(
				  		dateTime: widget.nfseCabecalho!.dataHoraEmissao,
				  		firstDate: DateTime.parse('1900-01-01'),
				  		lastDate: DateTime.now(),
				  		onChanged: (DateTime? value) {
				  			paginaMestreDetalheFoiAlterada = true;
				  			setState(() {
				  				widget.nfseCabecalho!.dataHoraEmissao = value;
				  			});
				  		},
				  	),
				  ),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	keyboardType: TextInputType.number,
				  	controller: competenciaController,
				  	decoration: getInputDecoration(
				  		'Informe o Mês/Ano Competência',
				  		'Mês/Ano Competência',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	// validator: ValidaCampoFormulario.validarMES_ANO,
				  	onChanged: (text) {
				  		widget.nfseCabecalho!.competencia = text;
				  		paginaMestreDetalheFoiAlterada = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	maxLength: 15,
				  	maxLines: 1,
				  	initialValue: widget.nfseCabecalho?.numeroSubstituida ?? '',
				  	decoration: getInputDecoration(
				  		'Informe o Número',
				  		'Número Substituída',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.nfseCabecalho!.numeroSubstituida = text;
				  		paginaMestreDetalheFoiAlterada = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  InputDecorator(
				  	decoration: getInputDecoration(
				  		'Selecione a Opção Desejada',
				  		'Natureza Operação',
				  		true),
				  	isEmpty: widget.nfseCabecalho!.naturezaOperacao == null,
				  	child: getDropDownButton(widget.nfseCabecalho!.naturezaOperacao,
				  		(String? newValue) {
				  		paginaMestreDetalheFoiAlterada = true;
				  	setState(() {
				  		widget.nfseCabecalho!.naturezaOperacao = newValue;
				  	});
				  	}, <String>[
				  		'1=Tributação no município',
				  		'2=Tributação fora do município',
				  		'3=Isenção',
				  		'4=Imune',
				  		'5=Exigibilidade suspensa por decisão judicial',
				  		'6=Exigibilidade suspensa por procedimento administrativo',
				  ])),
				  const SizedBox(height: 24.0),
				  InputDecorator(
				  	decoration: getInputDecoration(
				  		'Selecione a Opção Desejada',
				  		'Regime Especial Tributação',
				  		true),
				  	isEmpty: widget.nfseCabecalho!.regimeEspecialTributacao == null,
				  	child: getDropDownButton(widget.nfseCabecalho!.regimeEspecialTributacao,
				  		(String? newValue) {
				  		paginaMestreDetalheFoiAlterada = true;
				  	setState(() {
				  		widget.nfseCabecalho!.regimeEspecialTributacao = newValue;
				  	});
				  	}, <String>[
				  		'1=Microempresa Municipal',
				  		'2=Estimativa',
				  		'3=Sociedade de Profissionais',
				  		'4=Cooperativa',
				  ])),
				  const SizedBox(height: 24.0),
				  InputDecorator(
				  	decoration: getInputDecoration(
				  		'Selecione a Opção Desejada',
				  		'Optante Simples Nacional',
				  		true),
				  	isEmpty: widget.nfseCabecalho!.optanteSimplesNacional == null,
				  	child: getDropDownButton(widget.nfseCabecalho!.optanteSimplesNacional,
				  		(String? newValue) {
				  		paginaMestreDetalheFoiAlterada = true;
				  	setState(() {
				  		widget.nfseCabecalho!.optanteSimplesNacional = newValue;
				  	});
				  	}, <String>[
				  		'Sim',
				  		'Não',
				  ])),
				  const SizedBox(height: 24.0),
				  InputDecorator(
				  	decoration: getInputDecoration(
				  		'Selecione a Opção Desejada',
				  		'Incentivador Cultural',
				  		true),
				  	isEmpty: widget.nfseCabecalho!.incentivadorCultural == null,
				  	child: getDropDownButton(widget.nfseCabecalho!.incentivadorCultural,
				  		(String? newValue) {
				  		paginaMestreDetalheFoiAlterada = true;
				  	setState(() {
				  		widget.nfseCabecalho!.incentivadorCultural = newValue;
				  	});
				  	}, <String>[
				  		'Sim',
				  		'Não',
				  ])),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	maxLength: 15,
				  	maxLines: 1,
				  	initialValue: widget.nfseCabecalho?.numeroRps ?? '',
				  	decoration: getInputDecoration(
				  		'Informe o Número',
				  		'Número RPS',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.nfseCabecalho!.numeroRps = text;
				  		paginaMestreDetalheFoiAlterada = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	maxLength: 5,
				  	maxLines: 1,
				  	initialValue: widget.nfseCabecalho?.serieRps ?? '',
				  	decoration: getInputDecoration(
				  		'Informe a Série',
				  		'Série RPS',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.nfseCabecalho!.serieRps = text;
				  		paginaMestreDetalheFoiAlterada = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  InputDecorator(
				  	decoration: getInputDecoration(
				  		'Selecione a Opção Desejada',
				  		'Tipo RPS',
				  		true),
				  	isEmpty: widget.nfseCabecalho!.tipoRps == null,
				  	child: getDropDownButton(widget.nfseCabecalho!.tipoRps,
				  		(String? newValue) {
				  		paginaMestreDetalheFoiAlterada = true;
				  	setState(() {
				  		widget.nfseCabecalho!.tipoRps = newValue;
				  	});
				  	}, <String>[
				  		'1=Recibo Provisório de Serviços',
				  		'2=RPS  Nota Fiscal Conjugada (Mista)',
				  		'3=Cupom',
				  ])),
				  const SizedBox(height: 24.0),
				  InputDecorator(
				  	decoration: getInputDecoration(
				  		'Informe a Data de Emissão do RPS',
				  		'Data de Emissão do RPS',
				  		true),
				  	isEmpty: widget.nfseCabecalho!.dataEmissaoRps == null,
				  	child: DatePickerItem(
				  		dateTime: widget.nfseCabecalho!.dataEmissaoRps,
				  		firstDate: DateTime.parse('1900-01-01'),
				  		lastDate: DateTime.now(),
				  		onChanged: (DateTime? value) {
				  			paginaMestreDetalheFoiAlterada = true;
				  			setState(() {
				  				widget.nfseCabecalho!.dataEmissaoRps = value;
				  			});
				  		},
				  	),
				  ),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	maxLength: 1000,
				  	maxLines: 3,
				  	initialValue: widget.nfseCabecalho?.outrasInformacoes ?? '',
				  	decoration: getInputDecoration(
				  		'Observações Gerais',
				  		'Outras Informações',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.nfseCabecalho!.outrasInformacoes = text;
				  		paginaMestreDetalheFoiAlterada = true;
				  	},
				  	),
                  const SizedBox(height: 24.0),
                  Text(
                    '* indica que o campo é obrigatório',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 24.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
