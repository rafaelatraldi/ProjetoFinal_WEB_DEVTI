import 'package:appfinal/api/acesso_api.dart';
import 'package:appfinal/model/cidade.dart';
import 'package:appfinal/model/pessoa.dart';
import 'package:appfinal/util/combo_cidade.dart';
import 'package:appfinal/util/componentes.dart';
import 'package:appfinal/util/radio_sexo.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro([Key? key]) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtSexo = TextEditingController(text: 'M');
  TextEditingController txtIdade = TextEditingController();
  TextEditingController txtCidade = TextEditingController();

  @override
  Widget build(BuildContext context) {
    cadastrar() {
      Pessoa p = Pessoa(0, txtNome.text, txtSexo.text, int.parse(txtIdade.text),
          Cidade(int.parse(txtCidade.text), "", ""));
      AcessoApi().InserePessoa(p.toJson());
      Navigator.of(context).pushReplacementNamed('/consulta');
    }

    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("Cadastro de Pessoa", home),
      body: Form(
        key: formController,
        child: Column(
          children: [
            Componentes().criaInputTexto(
                TextInputType.text, "Nome", txtNome, "Informe o nome"),
            Componentes().criaInputTexto(
                TextInputType.number, "Idade", txtIdade, "Informe a idade"),
            Center(child: RadioSexo(controller: txtSexo)),
            Center(child: ComboCidade(controller: txtCidade)),
            Componentes().criaBotao(formController, cadastrar, "Cadastrar"),
          ],
        ),
      ),
    );
  }
}
