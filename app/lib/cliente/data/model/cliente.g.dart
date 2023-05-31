// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClienteModel _$ClienteModelFromJson(Map<String, dynamic> json) => ClienteModel(
      clienteId: json['clienteId'] as int?,
      nome: json['nome'] as String,
      sobrenome: json['sobrenome'] as String,
      endereco: json['endereco'] as String,
      telefone: json['telefone'] as String,
    );

Map<String, dynamic> _$ClienteModelToJson(ClienteModel instance) =>
    <String, dynamic>{
      'clienteId': instance.clienteId,
      'nome': instance.nome,
      'sobrenome': instance.sobrenome,
      'endereco': instance.endereco,
      'telefone': instance.telefone,
    };
