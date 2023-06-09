import 'package:aula5/cliente/domain/entities/cliente.dart';
import 'package:aula5/tarefa/data/model/tarefa.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cliente.g.dart';

@JsonSerializable()
class ClienteModel extends ClienteEntity {
  final List tarefas;

  const ClienteModel({
    super.clienteId,
    required super.nome,
    required super.sobrenome,
    required super.endereco,
    required super.telefone,
    required this.tarefas,
  });

  factory ClienteModel.fromJson(Map<String, dynamic> json) =>
      _$ClienteModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClienteModelToJson(this);
}
