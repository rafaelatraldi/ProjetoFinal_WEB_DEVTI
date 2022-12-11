// import 'package:appfinal/paginas/consulta.dart';
// import 'package:appfinal/util/combo_cidade.dart';
import 'package:appfinal/util/componentes.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:appfinal/paginas/cadastro_cidade.dart';
// import 'package:appfinal/paginas/consulta_cidade.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    cadastro() {
      Navigator.of(context).pushReplacementNamed('/cadastro');
    }

    consulta() {
      Navigator.of(context).pushReplacementNamed('/consulta');
    }

    cadastroCidade() {
      Navigator.of(context).pushReplacementNamed('/cadastro_cidade');
    }

    consultaCidade() {
      Navigator.of(context).pushReplacementNamed('/consulta_cidade');
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("Utilizacao API", home),
      body: Form(
        key: formController,
        child: Column(
          children: [
            Componentes()
                .criaBotao(formController, cadastro, "Cadastro Pessoa"),
            Componentes()
                .criaBotao(formController, consulta, "Consulta Pessoa"),
            Componentes()
                .criaBotao(formController, cadastroCidade, "Cadastro Cidade"),
            Componentes()
                .criaBotao(formController, consultaCidade, "Consulta Cidade"),
          ],
        ),
      ),
    );
  }
}
