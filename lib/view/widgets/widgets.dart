import 'package:app_finc/model/cartao_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, this.cartao, this.isAdd = false});

  final Cartao? cartao;
  final bool isAdd;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.blueGrey,
            width: 2,
          ),
        ),
        child: isAdd ? cartaoAdd() : cartaoBody(cartao!));
  }
}

cartaoBody(Cartao cartao) {
  final total = cartao.subtotal().toStringAsFixed(2).replaceAll('.', ',');

  return Padding(
    padding: const EdgeInsets.all(10),

    // Cardbody
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Upper Text
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Type and Name text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartao.tipo!,
                  style: GoogleFonts.lato(
                    //color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  cartao.name!,
                  style: GoogleFonts.lato(
                    //color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            )
          ],
        ),

        SizedBox(height: 30),

        Text(
          'R\$ $total',
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            fontSize: 40,
            // color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

cartaoAdd() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Icon(
        Icons.add,
        //color: Colors.white,
        size: 48,
      ),
      Text(
        'Adicione Novo Cartão',
        style: TextStyle(
            //color: Colors.white,
            ),
      ),
    ],
  );
}
