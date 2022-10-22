import 'dart:io';

import '../works/fn1.dart';
import '../works/fn2.dart';
import '../works/fn3.dart';

principal() {
  menu() {
    Map<String, String> options = {
      "1": "Cadastrar novo caminhão",
      "2": "Buscar informações do veículo pela placa",
      "3": "Excluir caminhão",
      "0": "Encerrar programa",
    };
    print(
        "\n Bem vindo ao sistema de cadastro de caminhão da Caltins Calcário Tocantins\nSelecione a opcão desejada no menu abaixo.\n ");
    options.forEach((key, value) {
      print('$key -> $value');
      print("----------------------");
    });
  }

  optionSelected(int option) {
    switch (option) {
      case 1:
        fn1();
        break;
      case 2:
        fn2();
        break;
      case 3:
        fn3();
        break;
    }
  }

  end() {
    print("Sistema está sendo encerrado");
    return;
  }

  chooseOption() {
    print("Digite a opção desejada:");
    String? optionChoosed = stdin.readLineSync();
    if (optionChoosed == null ||
        optionChoosed == "" ||
        RegExp(r'^[a-z]+$').hasMatch(optionChoosed)) {
      print(
          "Opção inválida, por favor escolha uma das opções acima ou digite '0' para encerrar o programa");
      chooseOption();
    } else {
      if (int.parse(optionChoosed) == 0) {
        end();
      }
      optionSelected(int.parse(optionChoosed));
    }
  }

  exec() {
    menu();
    chooseOption();
  }

  exec();
}
