/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre PersistePage relacionada à tabela [NFSE_INTERMEDIARIO] 
                                                                                
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

import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:fenix/src/infra/constantes.dart';
import 'package:fenix/src/infra/valida_campo_formulario.dart';

class NfseIntermediarioPersistePage extends StatefulWidget {
  final NfseCabecalho? nfseCabecalho;
  final GlobalKey<FormState>? formKey;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const NfseIntermediarioPersistePage(
      {Key? key, this.formKey, this.scaffoldKey, this.nfseCabecalho})
      : super(key: key);

  @override
  NfseIntermediarioPersistePageState createState() =>
      NfseIntermediarioPersistePageState();
}

class NfseIntermediarioPersistePageState extends State<NfseIntermediarioPersistePage> {
  @override
  Widget build(BuildContext context) {
	var cnpjController = MaskedTextController(
		mask: Constantes.mascaraCNPJ,
		text: widget.nfseCabecalho?.nfseIntermediario?.cnpj ?? '',
	);
	
    if (widget.nfseCabecalho!.nfseIntermediario == null) {
      widget.nfseCabecalho!.nfseIntermediario = NfseIntermediario();
    }

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
				  TextFormField(
				  	keyboardType: TextInputType.number,
				  	controller: cnpjController,
				  	decoration: getInputDecoration(
				  		'Informe o CNPJ',
				  		'CNPJ',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	validator: ValidaCampoFormulario.validarCNPJ,
				  	onChanged: (text) {
				  		widget.nfseCabecalho!.nfseIntermediario?.cnpj = text;
				  		paginaMestreDetalheFoiAlterada = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	maxLength: 150,
				  	maxLines: 1,
				  	initialValue: widget.nfseCabecalho?.nfseIntermediario?.razao ?? '',
				  	decoration: getInputDecoration(
				  		'Informe a Razão',
				  		'Razão',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.nfseCabecalho!.nfseIntermediario?.razao = text;
				  		paginaMestreDetalheFoiAlterada = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	maxLength: 15,
				  	maxLines: 1,
				  	initialValue: widget.nfseCabecalho?.nfseIntermediario?.inscricaoMunicipal ?? '',
				  	decoration: getInputDecoration(
				  		'Informe a Incrição Municipal',
				  		'Incrição Municipal',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.nfseCabecalho!.nfseIntermediario?.inscricaoMunicipal = text;
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