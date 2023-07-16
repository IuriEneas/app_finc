import 'package:app_finc/model/despesa_model.dart';

class Cartao {
  int? id;
  String? name;
  String? tipo;
  List<Despesa> despesas;

  Cartao({
    required this.id,
    required this.name,
    required this.tipo,
    required this.despesas,
  });

  double subtotal() {
    double total = 0.0;

    for (Despesa despesa in despesas) {
      total += despesa.preco!;
    }

    return total;
  }
}
