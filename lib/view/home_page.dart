import 'package:app_finc/model/cartao_model.dart';
import 'package:app_finc/model/despesa_model.dart';
import 'package:app_finc/view/widgets/custom_drawer.dart';
import 'package:app_finc/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:app_finc/mock/mock.dart' as mock;

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final list = mock.card_list;
  final List<Despesa> despesas = [];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    if (despesas.isEmpty) {
      for (Cartao cartao in list) {
        despesas.addAll(cartao.despesas);
      }
    }

    if (list[0].despesas.isNotEmpty) {
      list.insert(
        0,
        Cartao(
          name: ' ',
          despesas: [],
          tipo: ' ',
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: width * 0.5,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                'Finc',
                style: GoogleFonts.lato(
                  fontSize: 24,
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
        ],
      ),
      drawer: const Drawer(
        child: CustomDrawer(),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.278,
            child: InfiniteCarousel.builder(
              itemCount: list.length,
              itemExtent: width * 0.87,
              anchor: 1,
              loop: false,
              velocityFactor: 0.2,
              itemBuilder: (context, itemIndex, realIndex) {
                if (itemIndex == 0) {
                  return cardAdd(context, list);
                }
                return GestureDetector(
                  onTap: () {
                    print('teste: ${list[itemIndex].name}');
                  },
                  child: CardWidget(
                    cartao: list[itemIndex],
                  ),
                );
              },
            ),
          ),
          Container(
            height: height * 0.56,
            child: ListView.builder(
              itemCount: despesas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.add_card_rounded),
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(despesas[index].titulo!),
                      Text('R\$ ${despesas[index].preco!.toStringAsFixed(2)}'),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

cardAdd(BuildContext context, List<Cartao> list) {
  return GestureDetector(
    onTap: () {
      showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return bottomSheet(list);
        },
      );
    },
    child: const CardWidget(
      isAdd: true,
    ),
  );
}

bottomSheet(List<Cartao> list) {
  final banco = TextEditingController();
  final tipo = TextEditingController();

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
        customTextFormField(label: 'Banco'),
        Spacer(flex: 1),
        customTextFormField(label: 'Tipo'),
        Spacer(flex: 6),
        ElevatedButton(
          onPressed: () {
            list.add(Cartao(name: banco.text, tipo: tipo.text, despesas: []));
          },
          child: Text(
            'Adicionar Cartão',
          ),
        )
      ],
    ),
  );
}

customTextFormField({
  TextEditingController? controller,
  Function(String? text)? onFieldSubmitted,
  String? label,
}) {
  return TextFormField(
    onFieldSubmitted: onFieldSubmitted,
    controller: controller,
    style: const TextStyle(color: Colors.black),
    decoration: InputDecoration(
      label: Text(label ?? 'qualquer coisa'),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.blueGrey,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.blueGrey,
          width: 1,
        ),
      ),
    ),
  );
}
