import 'dart:math';

import 'package:app_finc/controller/home_controller.dart';
import 'package:app_finc/view/home_page.dart';
import 'package:flutter/material.dart';

class JurosPage extends StatelessWidget {
  JurosPage({super.key});

  final capital = TextEditingController();
  final juros = TextEditingController();
  final tempo = TextEditingController();
  final aporte = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              customTextFormField(
                label: 'Seu capital',
                controller: capital,
              ),
              customTextFormField(
                label: 'Taxa de juros',
                controller: juros,
              ),
              customTextFormField(
                label: 'Tempo',
                controller: tempo,
              ),
              customTextFormField(
                label: 'Aporte mensal',
                controller: aporte,
              ),
              ElevatedButton(
                onPressed: () {
                  print('teste :${loop(
                    double.parse(capital.text),
                    double.parse(juros.text),
                    int.parse(tempo.text),
                    double.parse(aporte.text),
                  )}');
                },
                child: Text('Pressione'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

double calculaJuros(double capital, double juros) {
  double total = 0;

  total = capital * pow((1 + juros / 100), 1);

  return total;
}

double loop(double capital, double juros, int tempo, double aporte) {
  double total = capital;

  for (int i = 0; i < tempo; i++) {
    total = calculaJuros(total + aporte, juros);
  }

  return total;
}
