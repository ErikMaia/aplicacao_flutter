// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'funcionario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FuncionarioModel _$FuncionarioModelFromJson(Map<String, dynamic> json) =>
    FuncionarioModel(
      funcionarioId: json['funcionarioId'] as int?,
      nome: json['nome'] as String,
      sobrenome: json['sobrenome'] as String,
      endereco: json['endereco'] as String,
      telefone: json['telefone'] as String,
    );

Map<String, dynamic> _$FuncionarioModelToJson(FuncionarioModel instance) =>
    <String, dynamic>{
      'funcionarioId': instance.funcionarioId,
      'nome': instance.nome,
      'sobrenome': instance.sobrenome,
      'endereco': instance.endereco,
      'telefone': instance.telefone,
    };
