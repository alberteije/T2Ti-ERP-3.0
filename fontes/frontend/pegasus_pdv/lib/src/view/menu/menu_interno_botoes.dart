/*
Title: T2Ti ERP 3.0                                                                
Description: Monta a linha com até quatro botões para o menu interno
                                                                                
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
import 'package:flutter/material.dart';
import 'package:pegasus_pdv/src/view/menu/menu_interno_botao.dart';

class MenuInternoBotoes extends StatelessWidget {
  final BotaoMenu? primeiroBotao;
  final BotaoMenu? segundoBotao;
  final BotaoMenu? terceiroBotao;
  final BotaoMenu? quartoBotao;

  const MenuInternoBotoes(
      {Key? key,
      this.primeiroBotao,
      this.segundoBotao,
      this.terceiroBotao,
      this.quartoBotao})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: botoes(),
      ),
    );
  }

  List<Widget> botoes() {
    List<Widget> lista = [];
    if (primeiroBotao != null) {
      lista.add(MenuInternoBotao(
        icon: primeiroBotao!.icon,
        label: primeiroBotao!.label,
        circleColor: primeiroBotao!.circleColor,
        rota: primeiroBotao!.rota,
        onPressed: primeiroBotao!.onPressed,
      ));
    }

    if (segundoBotao != null) {
      lista.add(MenuInternoBotao(
        icon: segundoBotao!.icon,
        label: segundoBotao!.label,
        circleColor: segundoBotao!.circleColor,
        rota: segundoBotao!.rota,
        onPressed: segundoBotao!.onPressed,
      ));
    }

    if (terceiroBotao != null) {
      lista.add(MenuInternoBotao(
        icon: terceiroBotao!.icon,
        label: terceiroBotao!.label,
        circleColor: terceiroBotao!.circleColor,
        rota: terceiroBotao!.rota,
        onPressed: terceiroBotao!.onPressed,
      ));
    }

    if (quartoBotao != null) {
      lista.add(MenuInternoBotao(
        icon: quartoBotao!.icon,
        label: quartoBotao!.label,
        circleColor: quartoBotao!.circleColor,
        rota: quartoBotao!.rota,
        onPressed: quartoBotao!.onPressed,
      ));
    }
    return lista;
  }
}

class BotaoMenu {
  IconData? icon;
  String? label;
  Color? circleColor;
  String? rota;
  Function? onPressed;

  BotaoMenu(
    {
      this.icon,
      this.label,
      this.circleColor,
      this.rota,
      this.onPressed,
    }
  );
}
