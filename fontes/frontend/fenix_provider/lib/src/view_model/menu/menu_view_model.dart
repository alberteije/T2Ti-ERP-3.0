import 'dart:async';
import 'package:flutter/material.dart';

import 'package:fenix/src/model/menu/menu.dart';
import 'package:fenix/src/infra/constantes.dart';

class MenuViewModel {
  final menuStreamController = StreamController<List<Menu>>();
  Stream<List<Menu>> get menuItemsStream => menuStreamController.stream;

  MenuViewModel() {
    menuStreamController.add(getMenuItems());
  }

  List<Menu>? menuItems;
  getMenuItems() {
    return menuItems = <Menu>[
      Menu(
          title: "Cadastros",
          menuColor: Colors.black,
          icon: Icons.person,
          image: Constantes.menuCadastrosImage,
          route: "/cadastrosMenu",),
      Menu(
          title: "Bloco Financeiro",
          menuColor: const Color(0xffc7d8f4),
          icon: Icons.account_balance_wallet,
          image: Constantes.menuPagarImage,
          route: "/financeiroMenu"),
      /*
      25042020 - EIJE - Comentado para utilizar apenas um ícone para todo o grupo financeiro
      Menu(
          title: "Contas a Pagar",
          menuColor: Color(0xffc7d8f4),
          icon: Icons.account_balance_wallet,
          image: Constantes.menuPagarImage,
          route: ""),
      Menu(
          title: "Contas a Receber",
          menuColor: Color(0xff7f5741),
          icon: Icons.account_balance,
          image: Constantes.menuReceberImage,
          route: ""),
      Menu(
          title: "Tesouraria",
          menuColor: Colors.black,
          icon: Icons.attach_money,
          image: Constantes.menuTesourariaImage,
          route: ""),
      Menu(
          title: "Fluxo de Caixa",
          menuColor: Color(0xff7f5741),
          icon: Icons.money_off,
          image: Constantes.menuFluxoCaixaImage,
          route: ""),
      Menu(
          title: "Caixa e Bancos",
          menuColor: Color(0xff7f5741),
          icon: Icons.card_travel,
          image: Constantes.menuBancoImage,
          route: ""),
      Menu(
          title: "Conciliação Bancária",
          menuColor: Color(0xff7f5741),
          icon: Icons.check_circle,
          image: Constantes.menuConciliacaoImage,
          route: ""),
      */
      Menu(
          title: "Tributação",
          menuColor: const Color(0xff7f5741),
          icon: Icons.assessment,
          image: Constantes.menuTributacaoImage,
          route: "/tributacaoMenu"),
      Menu(
          title: "Compras",
          menuColor: const Color(0xff7f5741),
          icon: Icons.add_shopping_cart,
          image: Constantes.menuComprasImage,
          route: "/comprasMenu"),
      Menu(
          title: "Estoque",
          menuColor: const Color(0xff7f5741),
          icon: Icons.category,
          image: Constantes.menuEstoqueImage,
          route: "/estoqueMenu"),
      Menu(
          title: "Vendas",
          menuColor: const Color(0xff2a8ccf),
          icon: Icons.business_center,
          image: Constantes.menuVendasImage,
          route: "/vendasMenu"),
      Menu(
          title: "AFV",
          menuColor: const Color(0xff2a8ccf),
          icon: Icons.business,
          image: Constantes.menuAfvImage,
          route: "/afvMenu"),
      Menu(
          title: "Comissões",
          menuColor: const Color(0xff2a8ccf),
          icon: Icons.assignment_ind,
          image: Constantes.menuComissoesImage,
          route: "/comissoesMenu"),
      Menu(
          title: "Ordem de Serviço",
          menuColor: const Color(0xff2a8ccf),
          icon: Icons.chat,
          image: Constantes.menuOsImage,
          route: "/ordemServicoMenu"),
      Menu(
          title: "NF-e",
          menuColor: Colors.black,
          icon: Icons.receipt,
          image: Constantes.menuNfeImage,
          route: "/nfeMenu"),
      Menu(
          title: "NFS-e",
          menuColor: const Color(0xff261d33),
          icon: Icons.receipt,
          image: Constantes.menuNfseImage,
          route: "/nfseMenu"),
      Menu(
          title: "NFC-e",
          menuColor: const Color(0xff261d33),
          icon: Icons.chrome_reader_mode,
          image: Constantes.menuNfceImage,
          route: "/caixaNfceSat"),
      Menu(
          title: "SAT",
          menuColor: const Color(0xff261d33),
          icon: Icons.chrome_reader_mode,
          image: Constantes.menuSatImage,
          route: ""),
      Menu(
          title: "CT-e",
          menuColor: const Color(0xff261d33),
          icon: Icons.date_range,
          image: Constantes.menuCteImage,
          route: ""),
      Menu(
          title: "SPED",
          menuColor: const Color(0xff261d33),
          icon: Icons.content_copy,
          image: Constantes.menuSpedImage,
          route: ""),
      Menu(
          title: "GED",
          menuColor: const Color(0xffe19b6b),
          icon: Icons.desktop_mac,
          image: Constantes.menuGedImage,
          route: ""),
      Menu(
          title: "Loja Virtual",
          menuColor: const Color(0xffddcec2),
          icon: Icons.shopping_cart,
          image: Constantes.menuLojaImage,
          route: ""),
      Menu(
          title: "CRM",
          menuColor: const Color(0xffe19b6b),
          icon: Icons.folder_shared,
          image: Constantes.menuCrmImage,
          route: ""),
      Menu(
          title: "BI",
          menuColor: const Color(0xffe19b6b),
          icon: Icons.extension,
          image: Constantes.menuBiImage,
          route: ""),
       Menu(
          title: "Inventário",
          menuColor: const Color(0xff7f5741),
          icon: Icons.category,
          image: Constantes.menuEstoqueImage,
          route: "/inventarioMenu"),
   ];
  }
}