import 'package:app_finc/model/cartao_model.dart';
import 'package:app_finc/model/despesa_model.dart';

final card_list = [
  Cartao(
    name: 'Nubank',
    tipo: 'débito',
    despesas: [
      Despesa(
        titulo: 'Iphone',
        preco: 2220.22,
        descricao: 'Xr para mim',
      ),
      Despesa(
        titulo: 'Lua',
        preco: 68.22,
        descricao: 'Presente Amanda',
      ),
    ],
  ),
  Cartao(
    name: 'Caixa - 172',
    tipo: 'crédito',
    despesas: [
      Despesa(
        titulo: 'Monitor',
        preco: 820.22,
        descricao: 'Superframe 23,8 polegadas',
      ),
      Despesa(
        titulo: 'Moto',
        preco: 250,
        descricao: 'Downtown 300i',
      ),
    ],
  ),

  //
  Cartao(
    tipo: 'débito',
    name: 'Inter',
    despesas: [
      Despesa(
        titulo: 'Salgado',
        preco: 12.22,
        descricao: 'Almoço no TCU',
      ),
      Despesa(
        titulo: 'Metro',
        preco: 5.50,
        descricao: 'Esqueci meu cartão',
      ),
    ],
  ),

  //
  Cartao(
    tipo: 'crédito',
    name: 'C6',
    despesas: [
      Despesa(
        titulo: 'Bar',
        preco: 120.22,
        descricao: 'Cerveja com amigos',
      ),
      Despesa(
        titulo: 'Diablo IV',
        preco: 350,
        descricao: 'Desculpa ;-;',
      ),
      Despesa(
        titulo: 'Onlyfans',
        preco: 150,
        descricao: 'Ana Clara',
      ),
    ],
  )
];
