/*
Title: T2Ti ERP 3.0                                                                
Description: Drawer padrão para ser carregada como menu lateral
                                                                                
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

import 'package:fenix/src/infra/constantes.dart';
import 'package:fenix/src/view/shared/about_tile.dart';

class MenuLateralRetaguarda extends StatelessWidget {
  const MenuLateralRetaguarda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text(
              "Albert Eije",
            ),
            accountEmail: Text(
              "alberteije@gmail.com",
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(Constantes.profileImage),
            ),
          ),
          ListTile(
            onTap:  () { Navigator.pop(context); Navigator.pop(context);},
            title: const Text(
              "Área de Trabalho",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: const Icon(
              Icons.dashboard,
              color: Colors.red,
            ),
          ),
          const Divider(),
          const ListTile(
            title: Text(
              "Usuário",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.person,
              color: Colors.blue,
            ),
          ),
          const ListTile(
            title: Text(
              "Alertas",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.add_alert,
              color: Colors.green,
            ),
          ),
          const ListTile(
            title: Text(
              "Notícias",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.timeline,
              color: Colors.cyan,
            ),
          ),
          const Divider(),
          ListTile(
            onTap:  () { Navigator.pop(context); Navigator.pop(context);},
            title: const Text(
              "Configurações",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: const Icon(
              Icons.settings,
              color: Colors.brown,
            ),
          ),
          const Divider(),
          const MyAboutTile()
        ],
      ),
    );
  }
}
