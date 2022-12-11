import 'package:appfinal/api/acesso_api.dart';
import 'package:appfinal/model/cidade.dart';
import 'package:appfinal/util/componentes.dart';
import 'package:flutter/material.dart';

class ConsultaCidade extends StatefulWidget {
  const ConsultaCidade({Key? key}) : super(key: key);

  @override
  State<ConsultaCidade> createState() => _ConsultaCidadeState();
}

class _ConsultaCidadeState extends State<ConsultaCidade> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  List<Cidade> lista = [];

  @override
  Widget build(BuildContext context) {
    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    listarTodas() async {
      //await do acessoapi().listaPessoas();
      List<Cidade> cidades = await AcessoApi().listaCidades();
      setState(() {
        lista = cidades;
      });
    }

    return Scaffold(
      appBar: Componentes().criaAppBar('Consulta de Cidades', home),
      body: Form(
        key: formController,
        child: Column(children: [
          Componentes().criaBotao(
              formController, listarTodas, "Listar Todas as Cidades"),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, indice) {
                  return Card(
                    elevation: 6,
                    margin: const EdgeInsets.all(5),
                    child: Componentes().criaItemCidade(lista[indice]),
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
