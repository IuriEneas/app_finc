import 'package:app_finc/model/cartao_model.dart';

class Despesa {
  int? id;
  int? idFk;
  String? titulo;
  double? preco;
  String? descricao;
  String? estabelecimento;
  DateTime? date;
  Cartao? cartao;

  Despesa({
    this.id,
    this.idFk,
    this.titulo,
    this.preco,
    this.descricao,
    this.estabelecimento,
    this.date,
  });
}
