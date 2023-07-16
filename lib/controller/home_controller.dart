import 'package:app_finc/model/cartao_model.dart';
import 'package:app_finc/model/despesa_model.dart';
import 'package:app_finc/view/home_page.dart';
import 'package:app_finc/view/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_finc/mock/mock.dart' as mock;

import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Cartao> cartaoList = mock.card_list;
  List<Despesa> despesaList = [];

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() {
    if (despesaList.isEmpty) {
      for (Cartao cartao in cartaoList) {
        despesaList.addAll(cartao.despesas);
      }
    }

    if (cartaoList[0].despesas.isNotEmpty) {
      cartaoList.insert(
        0,
        Cartao(
          id: 99999,
          name: ' ',
          despesas: [],
          tipo: ' ',
        ),
      );
    }
  }

  addCard(Cartao cartao) {
    cartaoList.add(cartao);
    update();
  }

  cardAdd(BuildContext context, List<Cartao> list) {
    final banco = TextEditingController();
    final tipo = TextEditingController();

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return bottomSheet(
              list,
              context,
              banco,
              tipo,
            );
          },
        );
      },
      child: const CardWidget(
        isAdd: true,
      ),
    );
  }

  bottomSheet(
    List<Cartao> list,
    BuildContext context,
    TextEditingController banco,
    TextEditingController tipo,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blueGrey),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          customTextFormField(
            label: 'Banco',
            controller: banco,
          ),
          const Spacer(flex: 1),
          customTextFormField(
            label: 'Tipo',
            controller: tipo,
          ),
          const Spacer(flex: 6),
          ElevatedButton(
            onPressed: () {
              addCard(
                Cartao(
                  id: null,
                  name: banco.text,
                  tipo: tipo.text,
                  despesas: [],
                ),
              );
              Navigator.of(context).pop();
            },
            child: const Text(
              'Adicionar Cartão',
            ),
          )
        ],
      ),
    );
  }
}
