import 'package:flutter/material.dart';
import 'package:act2/model/pessoa.dart';

class CadastroPessoa extends StatefulWidget {
  final Function(Pessoa) onCadastrar;

  CadastroPessoa({required this.onCadastrar});

  @override
  _CadastroPessoaState createState() => _CadastroPessoaState();
}

class _CadastroPessoaState extends State<CadastroPessoa> {
  final _formKey = GlobalKey<FormState>();
  String nome = '';
  String sobrenome = '';
  int idade = 0;
  String cpf = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Nome'),
              onChanged: (value) {
                setState(() {
                  nome = value;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Sobrenome'),
              onChanged: (value) {
                setState(() {
                  sobrenome = value;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Idade'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  idade = int.parse(value);
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'CPF'),
              onChanged: (value) {
                setState(() {
                  cpf = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Pessoa novaPessoa = Pessoa(
                    nome: nome,
                    idade: idade,
                    sobrenome: sobrenome,
                    cpf: cpf,
                  );
                  widget.onCadastrar(novaPessoa);
                  Navigator.of(context).pop(); // Cerrar modal
                }
              },
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}