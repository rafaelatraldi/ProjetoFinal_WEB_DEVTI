import 'package:appfinal/api/acesso_api.dart';
import 'package:appfinal/model/pessoa.dart';
import 'package:appfinal/util/componentes.dart';
import 'package:flutter/material.dart';

class Consulta extends StatefulWidget {
  const Consulta({Key? key}) : super(key: key);

  @override
  State<Consulta> createState() => _ConsultaState();
}

class _ConsultaState extends State<Consulta> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  List<Pessoa> lista = [];

  @override
  Widget build(BuildContext context) {
    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    listarTodas() async {
      List<Pessoa> pessoas = await AcessoApi().listaPessoas();
      setState(() {
        lista = pessoas;
      });
    }

    return Scaffold(
      appBar: Componentes().criaAppBar('Consulta de Pessoa', home),
      body: Form(
        key: formController,
        child: Column(children: [
          Componentes().criaBotao(formController, listarTodas, "Listar Todas"),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, indice) {
                  return Card(
                    elevation: 6,
                    margin: const EdgeInsets.all(5),
                    child: Componentes().criaItemPessoa(lista[indice]),
                  );
                },
              ),
            ),
          )
        ]),
      ),
    );
  }
}
