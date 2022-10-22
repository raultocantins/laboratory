//Essa função é para cadastrar um novo caminhão
import 'dart:convert';
import 'dart:io';
import 'dart:math';

fn1() {
  Map<String, dynamic> truck = {};

  register() {
    print("Seja bem vindo ao cadastro de caminhão\n");
    print("Insira o nome do motorista:");
    String? name = stdin.readLineSync();
    print("Insira a placa do caminhão:");
    String? placa = stdin.readLineSync();

    if (name == null || name == "" || placa == null || placa == "") {
      print("Valores incorretos, por favor insira as informações novamente");
      register();
    } else {
      truck = {"id": Random().nextInt(10), "nome": name, "placa": placa};
    }
  }

  saveTruck() async {
    String trucksFile = await File('trucks.txt').readAsString();
    if (trucksFile == "" || trucksFile == "[]") {
      File('trucks.txt').writeAsString(json.encode([truck]));
    } else {
      List<dynamic> trucks = json.decode(trucksFile);
      trucks.add(truck);
      File('trucks.txt').writeAsString(json.encode(trucks));
    }
    print("Caminhão registrado com sucesso");
  }

  exec() {
    register();
    saveTruck();
  }

  exec();
}
