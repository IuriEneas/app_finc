abstract class Helper {
  static String dotToComma(double number) {
    String string = number.toStringAsFixed(2);
    String stringDois = '';

    string.length;
    string = string.replaceAll('.', ',');

    print('teste: ${string.lastIndexOf(string)}');

    for (int i = string.length - 1; i >= 0; i--) {
      stringDois += string[i];

      if (stringDois.length == 7) {
        final start = stringDois.substring(0, 6);
        final rest = '.${stringDois.substring(6, 7)}';

        stringDois = '$start$rest';
      }

      if (stringDois.length == 11) {
        final milStart = stringDois.substring(0, 10);
        final milRest = '.${stringDois.substring(10, 11)}';

        stringDois = '$milStart$milRest';
      }
    }

    string = '';

    for (int i = stringDois.length - 1; i >= 0; i--) {
      string += stringDois[i];
    }

    return string;
  }

  static String dateFormat(DateTime date) {
    String dayWeek = '';
    String month = '';

    switch (date.month) {
      case 1:
        month = 'Janeiro';
        break;
      case 2:
        month = 'Fevereiro';
        break;
      case 3:
        month = 'Março';
        break;
      case 4:
        month = 'Abril';
        break;
      case 5:
        month = 'Maio';
        break;
      case 6:
        month = 'Junho';
        break;
      case 7:
        month = 'Julho';
        break;
      case 8:
        month = 'Agosto';
        break;
      case 9:
        month = 'Setembro';
        break;
      case 10:
        month = 'Outubro';
        break;
      case 11:
        month = 'Novembro';
        break;
      case 12:
        month = 'Dezembro';
        break;
    }

    switch (date.weekday) {
      case 7:
        dayWeek = 'Domingo';
        break;
      case 1:
        dayWeek = 'Segunda';
        break;
      case 2:
        dayWeek = 'Terça';
        break;
      case 3:
        dayWeek = 'Quarta';
        break;
      case 4:
        dayWeek = 'Quinta';
        break;
      case 5:
        dayWeek = 'Sexta';
        break;
      case 6:
        dayWeek = 'Sábado';
        break;
    }

    return '$dayWeek, ${date.day} de $month de ${date.year}, ${date.hour}:${date.minute}';
  }
}
