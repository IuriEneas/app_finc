import 'package:app_finc/helper/helper.dart';
import 'package:app_finc/model/cartao_model.dart';
import 'package:app_finc/model/despesa_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_finc/mock/mock.dart' as mock;

class DespesaPage extends StatelessWidget {
  DespesaPage({super.key});

  final Despesa despesa = Get.arguments;
  final bool isFromCard = true;

  @override
  Widget build(BuildContext context) {
    final Cartao cartao = fetchCards(despesa.idFk!);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                ],
              ),

              // Spacing
              const SizedBox(height: 20),

              // Icone
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white.withAlpha(108),
                    radius: 32,
                    child: const Icon(
                      Icons.shopping_bag,
                      size: 28,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              // Spacing
              const SizedBox(height: 20),

              // titulo
              Text(
                despesa.titulo!,
                style: GoogleFonts.lato(fontSize: 41),
              ),

              // Spacing
              const SizedBox(height: 10),

              // preço
              Text(
                'R\$ ${Helper.dotToComma(despesa.preco!)}',
                style: GoogleFonts.lato(fontSize: 41),
              ),

              // Spacing
              const SizedBox(height: 10),

              // data de compra
              Text(
                Helper.dateFormat(despesa.date!),
                style: GoogleFonts.lato(fontSize: 16),
              ),

              // Spacing
              const SizedBox(height: 20),

              // metodo de compra
              Text(
                'Compra à vista',
                style: GoogleFonts.lato(),
              ),

              // Spacing
              const SizedBox(height: 60),

              // problema
              CircleAvatar(
                radius: 32,
                backgroundColor: Colors.white.withAlpha(108),
                child: const Icon(
                  Icons.warning_sharp,
                  size: 28,
                  color: Colors.grey,
                ),
              ),

              // Spacing
              const SizedBox(height: 20),

              // estabelecimento
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Estabelecimento',
                        style: GoogleFonts.lato(),
                      ),
                      Text(
                        despesa.estabelecimento!,
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Editar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withAlpha(50),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ),

              // Spacing
              const SizedBox(height: 20),

              // Cartão que foi comprado
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cartão físico',
                        style: GoogleFonts.lato(),
                      ),
                      Text(
                        cartao.name!,
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withAlpha(50),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Editar'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  fetchCards(int id) {
    for (Cartao card in mock.card_list) {
      if (id == card.id) {
        return card;
      }
    }
  }
}
