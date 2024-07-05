/*
Title: T2Ti ERP 3.0                                                                
Description: Página de Login
                                                                                
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

Based on: Flutter UIKit by Pawan Kumar - https://github.com/iampawan/Flutter-UI-Kit
*******************************************************************************/
import 'package:fenix/src/infra/sessao.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fenix/src/infra/constantes.dart';

import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/view_model/view_model.dart';

import 'package:fenix/src/view/shared/caixas_de_dialogo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? campoUsuario;
  String? campoSenha;
  
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Sessao.tratarErrosSessao(context, Provider.of<UsuarioViewModel>(context, listen: false).objetoJsonErro)
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var usuarioProvider = Provider.of<UsuarioViewModel>(context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Center(
        child: loginBody(context, usuarioProvider),
      ),
    );
  }

  loginBody(BuildContext context, usuarioProvider) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            loginHeader(),
            loginFields(context, usuarioProvider)
          ],
        ),
      );

  loginHeader() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            Constantes.profileImage,
          ),
          const SizedBox(
            height: 30.0,
          ),
          const Text(
            "Bem vindo ao ${Constantes.nomeApp}",
            style: TextStyle(
                fontWeight: FontWeight.w700, color: Colors.blueAccent),
          ),
          const SizedBox(
            height: 5.0,
          ),
          const Text(
            "Faça o login para continuar",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      );

  loginFields(BuildContext context, usuarioProvider) => SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    campoUsuario = text;
                  });
                },
                maxLines: 1,
                decoration: const InputDecoration(
                  hintText: "Informe seu nome de usuário",
                  labelText: "Usuário",
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    campoSenha = text;
                  });
                },
                maxLines: 1,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Informe sua senha",
                  labelText: "Senha",
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              width: double.infinity,
              child:ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 4,
                  padding: const EdgeInsets.all(15.0),
                  backgroundColor: Colors.green.shade700, 
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                ),
                onPressed: () async {
                  if (campoUsuario == null) {
                    showInSnackBar(
                        'Por favor, informe o nome do usuário', context);
                  } else {
                    if (campoSenha == null) {
                      showInSnackBar(
                          'Por favor, informe a senha do usuário', context);
                    } else {
                      Usuario usuario = Usuario();
                      usuario.login = campoUsuario;
                      usuario.senha = campoSenha;
                      await usuarioProvider.autenticar(usuario).then((_) {
                        if (Provider.of<UsuarioViewModel>(context).objetoJsonErro != null) {
                          // TODO: tratar devidamente o erro com o Catcher
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (BuildContext context) => ErroPage(
                          //       objetoJsonErro: Provider.of<UsuarioViewModel>(context).objetoJsonErro, 
                          //       limpaErroCallBack: this.limparErro,
                          //       )));
                        } else {
                          Navigator.pushNamed(context, "/home");
                        }
                      });
                    }
                  }
                },
                child: const Text("LOGIN", 
                  style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Text(
              "Entre na sua conta",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
}
