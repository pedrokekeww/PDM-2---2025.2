// Agregação e Composição
import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  Map<String, dynamic> toJson() {
    return {
      "nome": _nome,
    };
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  Map<String, dynamic> toJson() {
    return {
      "nome": _nome,
      "dependentes": _dependentes.map((d) => d.toJson()).toList(),
    };
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  Map<String, dynamic> toJson() {
    return {
      "nomeProjeto": _nomeProjeto,
      "funcionarios": _funcionarios.map((f) => f.toJson()).toList(),
    };
  }
}

void main() {
  // 1. Criar varios objetos Dependentes
  Dependente savio = Dependente("Savio");
  Dependente nonato = Dependente("Nonato");
  Dependente joao = Dependente("Joao");
  Dependente rick = Dependente("Rick");
  Dependente joana = Dependente("Joana");
  Dependente ana = Dependente("Ana");

  // 2. Criar varios objetos Funcionario
  Funcionario cayque = Funcionario("Cayque", []);
  Funcionario gustavo = Funcionario("Gustavo", []);
  Funcionario luis = Funcionario("Luis", []);
  Funcionario pedro = Funcionario("Pedro", []);

  // 3. Associar os Dependentes criados aos respectivos funcionarios
  cayque = Funcionario("Cayque", [savio, nonato]);
  gustavo = Funcionario("Gustavo", [joao]);
  luis = Funcionario("Luis", [ana]);
  pedro = Funcionario("Pedro", [joana, rick]);

  // 4. Criar uma lista de Funcionarios
  List<Funcionario> equipe = [luis, pedro, gustavo, cayque];

  // 5. Criar um objeto Equipe Projeto
  EquipeProjeto ifmaps = EquipeProjeto("IFGO", equipe);

  // 6. Printar no formato JSON o objeto Equipe Projeto
  print(JsonEncoder.withIndent('  ').convert(ifmaps.toJson()));
}
