import 'package:intl/intl.dart';

class CalculoTreinamento {
  static String calcularStatus(String dataFim) {
    DateTime dataAtual = DateTime.now();

    DateTime dataFimTreinamento = DateFormat("dd/MM/yyyy").parse(dataFim);
    if (dataFimTreinamento.isBefore(dataAtual)) {
      return 'Concluído';
    } else {
      return 'Incompleto';
    }
  }
}