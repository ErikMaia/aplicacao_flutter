import 'package:aula5/funcionario/data/datasources/remote_api/insert.dart';
import 'package:aula5/funcionario/data/datasources/remote_api/update.dart';
import 'package:aula5/funcionario/data/model/funcionario.dart';

import 'package:aula5/funcionario/presentation/crud/widgets/botao_gravar.dart';
import 'package:aula5/funcionario/presentation/crud/widgets/sobrenome.dart';
import 'package:aula5/funcionario/presentation/crud/widgets/telefone.dart';
import 'package:flutter/material.dart';
import '../../../tarefa/data/model/tarefa.dart';
import 'widgets/endereco.dart';
import 'widgets/nome.dart';

class FuncionarioForm extends StatefulWidget {
  final FuncionarioModel? funcionarioModel;

  const FuncionarioForm({
    Key? key,
    this.funcionarioModel,
  }) : super(key: key);

  @override
  _FuncionarioFormState createState() => _FuncionarioFormState();
}

class _FuncionarioFormState extends State<FuncionarioForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _sobrenomeController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  List<TarefaModel> _tarefas = [];

  @override
  void initState() {
    if (widget.funcionarioModel != null) {
      _nomeController.text = widget.funcionarioModel!.nome;
      _sobrenomeController.text = widget.funcionarioModel!.sobrenome;
      _enderecoController.text = widget.funcionarioModel!.endereco;
      _telefoneController.text = widget.funcionarioModel!.telefone;
      _tarefas = widget.funcionarioModel!.tarefas;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Funcionario')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  NomeFuncionarioField(controller: _nomeController),
                  SobrenomeFuncionarioField(controller: _sobrenomeController),
                  EnderecoFuncionarioField(controller: _enderecoController),
                  TelefoneFuncionarioField(controller: _telefoneController),
                  // Renderizar a lista de tarefas
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _tarefas.length,
                    itemBuilder: (BuildContext context, int index) {
                      final TarefaModel tarefa = _tarefas[index];
                      return ListTile(
                        title: Text(tarefa.descricao),
                        onTap: () {
                          // Adicionara tarefa à lista de tarefas
                          final TarefaModel updatedTarefa = TarefaModel(
                            tarefaId: tarefa.tarefaId,
                            descricao: tarefa.descricao,
                            dataInicio: tarefa.dataInicio,
                            dataTermino: tarefa.dataTermino,
                            status: tarefa.status,
                          );
                          setState(() {
                            _tarefas[index] = updatedTarefa;
                          });
                        },
                      );
                    },
                  ),
                  FuncionarioBotaoGravar(
                    onPressedNovo: () {
                      _nomeController.clear();
                      _sobrenomeController.clear();
                      _enderecoController.clear();
                      _telefoneController.clear();
                      _tarefas.clear();
                    },
                    onPressed: () async {
                      FocusScope.of(context).unfocus();

                      if (_formKey.currentState!.validate()) {
                        final FuncionarioModel funcionario = FuncionarioModel(
                          nome: _nomeController.text,
                          sobrenome: _sobrenomeController.text,
                          endereco: _enderecoController.text,
                          telefone: _telefoneController.text,
                          tarefas: _tarefas,
                        );

                        if (widget.funcionarioModel == null ||
                            widget.funcionarioModel!.funcionarioId == null) {
                          await FuncionarioInsertDataSource()
                              .createFuncionario(funcionario: funcionario);
                        } else {
                          funcionario.funcionarioId =
                              widget.funcionarioModel!.funcionarioId;
                          await FuncionarioUpdateDataSource()
                              .updateFuncionario(funcionario: funcionario);
                        }
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
