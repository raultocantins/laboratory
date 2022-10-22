//Essa função é para buscar informações do veículo pela placa

import 'dart:io';

fn2() {
  show() async {
    String trucks = (await File('trucks.txt').readAsString());

    if (trucks == "" || trucks == "[]") {
      print("Nenhum caminhão cadastrado");
    } else {
      print(trucks);
    }
  }

  show();
}
