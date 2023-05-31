import 'package:aula5/cliente/data/datasources/remote_api/insert.dart';
import 'package:aula5/cliente/data/datasources/remote_api/update.dart';
import 'package:aula5/cliente/data/model/cliente.dart';
import 'package:flutter/material.dart';
import 'widgets/botao_gravar.dart';
import 'widgets/endereco.dart';
import 'widgets/nome.dart';
import 'widgets/sobrenome.dart';
import 'widgets/telefone.dart';

class ClienteForm extends StatefulWidget {
  final ClienteModel? clienteModel;

  const ClienteForm({
    Key? key,
    this.clienteModel,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ClientePageState createState() => _ClientePageState();
}

class _ClientePageState extends State<ClienteForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _sobrenomeController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();

  @override
  void initState() {
    if (widget.clienteModel != null) {
      _nomeController.text = widget.clienteModel!.nome;
      _sobrenomeController.text = widget.clienteModel!.sobrenome;
      _enderecoController.text = widget.clienteModel!.endereco;
      _telefoneController.text = widget.clienteModel!.telefone;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Cliente')),
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
                  NomeClienteField(controller: _nomeController),
                  SobrenomeClienteField(controller: _sobrenomeController),
                  EnderecoClienteField(
                    controller: _enderecoController,
                  ),
                  TelefoneClienteField(controller: _telefoneController),
                  ClienteBotaoGravar(onPressedNovo: () {
                    _nomeController.clear();
                    _sobrenomeController.clear();
                    _enderecoController.clear();
                    _telefoneController.clear();
                  }, onPressed: () async {
                    FocusScope.of(context).unfocus();

                    if (_formKey.currentState!.validate()) {
                      if (widget.clienteModel == null ||
                          widget.clienteModel!.clienteId == null) {
                        await ClienteInsertDataSource().createCliente(
                          cliente: ClienteModel(
                            nome: _nomeController.text,
                            sobrenome: _sobrenomeController.text,
                            endereco: _enderecoController.text,
                            telefone: _telefoneController.text,
                          ),
                        );
                      } else {
                        await ClienteUpdateDataSource().updateCliente(
                          cliente: ClienteModel(
                            clienteId: widget.clienteModel!.clienteId,
                            nome: _nomeController.text,
                            sobrenome: _sobrenomeController.text,
                            endereco: _enderecoController.text,
                            telefone: _telefoneController.text,
                          ),
                        );
                      }
                    }
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
