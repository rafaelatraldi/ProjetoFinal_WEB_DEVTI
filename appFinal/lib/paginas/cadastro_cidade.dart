import 'package:appfinal/api/acesso_api.dart';
import 'package:appfinal/model/cidade.dart';
import 'package:appfinal/util/componentes.dart';
import 'package:flutter/material.dart';

class CadastroCidade extends StatefulWidget {
  const CadastroCidade([Key? key]) : super(key: key);

  @override
  State<CadastroCidade> createState() => _CadastroCidadeState();
}

class _CadastroCidadeState extends State<CadastroCidade> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtCidade = TextEditingController();
  // TextEditingController txtSexo = TextEditingController(text: 'M');
  TextEditingController txtEstado = TextEditingController();
//  TextEditingController txtCidade = TextEditingController();

  @override
  Widget build(BuildContext context) {
    cadastrar() {
      Cidade p = Cidade(0, txtCidade.text, txtEstado.text);
      AcessoApi().InsereCidade(p.toJson());
      Navigator.of(context).pushReplacementNamed('/consulta_cidade');
    }

    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("Cadastro de Cidade", home),
      body: Form(
        key: formController,
        child: Column(
          children: [
            Componentes().criaInputTexto(
                TextInputType.text, "Cidade", txtCidade, "Informe a cidade"),
            Componentes().criaInputTexto(
                TextInputType.number, "UF", txtEstado, "Informe a UF"),
            // Center(child: RadioSexo(controller: txtSexo)),
            // Center(child: ComboCidade(controller: txtCidade)),
            Componentes().criaBotao(formController, cadastrar, "Cadastrar"),
          ],
        ),
      ),
    );
  }
}
