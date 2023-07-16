import 'package:app_finc/model/cartao_model.dart';
import 'package:app_finc/model/despesa_model.dart';

final card_list = [
  Cartao(
    id: 1,
    name: 'Nubank',
    tipo: 'débito',
    despesas: [
      Despesa(
        id: 1,
        idFk: 1,
        titulo: 'Iphone',
        preco: 2220.22,
        descricao: 'Xr para mim',
        estabelecimento: 'Americanas',
        date: DateTime(2023, 07, 06, 13, 20, 22),
      ),
      Despesa(
        id: 2,
        idFk: 1,
        titulo: 'Lua',
        preco: 68.22,
        descricao: 'Presente Amanda',
        estabelecimento: 'Americanas',
        date: DateTime(2023, 07, 06, 13, 20, 22),
      ),
    ],
  ),
  Cartao(
    id: 2,
    name: 'Caixa - 172',
    tipo: 'crédito',
    despesas: [
      Despesa(
        id: 3,
        idFk: 2,
        titulo: 'Monitor',
        preco: 820.22,
        descricao: 'Superframe 23,8 polegadas',
        estabelecimento: 'Americanas',
        date: DateTime(2023, 07, 06, 13, 20, 22),
      ),
      Despesa(
        id: 4,
        idFk: 2,
        titulo: 'Moto',
        preco: 250,
        descricao: 'Downtown 300i',
        estabelecimento: 'Americanas',
        date: DateTime(2023, 07, 06, 13, 20, 22),
      ),
    ],
  ),

  //
  Cartao(
    id: 3,
    tipo: 'débito',
    name: 'Inter',
    despesas: [
      Despesa(
        id: 5,
        idFk: 3,
        titulo: 'Salgado',
        preco: 12.22,
        descricao: 'Almoço no TCU',
        estabelecimento: 'Americanas',
        date: DateTime(2023, 07, 06, 13, 20, 22),
      ),
      Despesa(
        id: 6,
        idFk: 3,
        titulo: 'Metro',
        preco: 5.50,
        descricao: 'Esqueci meu cartão',
        estabelecimento: 'Americanas',
        date: DateTime(2023, 07, 06, 13, 20, 22),
      ),
    ],
  ),

  //
  Cartao(
    id: 4,
    tipo: 'crédito',
    name: 'C6',
    despesas: [
      Despesa(
        id: 7,
        idFk: 4,
        titulo: 'Bar',
        preco: 134765.22,
        descricao: 'Cerveja com amigos',
        estabelecimento: 'Americanas',
        date: DateTime(2023, 07, 06, 13, 20, 22),
      ),
      Despesa(
        id: 8,
        idFk: 4,
        titulo: 'Diablo IV',
        preco: 350,
        descricao: 'Desculpa ;-;',
        estabelecimento: 'Americanas',
        date: DateTime(2023, 07, 06, 13, 20, 22),
      ),
    ],
  )
];
