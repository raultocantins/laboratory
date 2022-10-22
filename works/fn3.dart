//Essa função é para excluir caminhão
import 'dart:convert';
import 'dart:io';

fn3() {
  removeTruck(placa) async {
    String trucksFile = await File('trucks.txt').readAsString();
    if (trucksFile == "" || trucksFile == "[]") {
      print("Ainda nenhum caminhão cadastrado");
      return;
    } else {
      List<dynamic> trucks = json.decode(trucksFile);
      trucks.map((e) => json.decode(e) as Map<String, dynamic>);
      trucks.removeWhere((truck) => truck['placa'] == placa);
      File('trucks.txt').writeAsString(json.encode(trucks));
    }
    print("Caminhão removido com sucesso");
  }

  getPlaca() {
    print("Por favor, insira a placa a qual deseja remover o caminhão");
    String? placaChoosed = stdin.readLineSync();
    if (placaChoosed == null || placaChoosed == '') {
      print("Placa inválida, por favor tente novamente");
      getPlaca();
    } else {
      removeTruck(placaChoosed);
    }
  }

  exec() {
    getPlaca();
  }

  exec();
}
