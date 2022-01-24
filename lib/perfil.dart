import 'main.dart';
import 'package:flutter/material.dart';
import 'funcoes.dart';


class Perfil extends StatefulWidget {
  const Perfil({ Key? key }) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu(),
      body: Scaffold(
        appBar: appbar ? MenuAbrir() : null,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 60)),
                Text(
                  "Entre na sua conta",
                  style: TextStyle(fontSize: 25, color: Colors.red),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Icon(Icons.person_add_alt_rounded,size: 150, color: Colors.black,)
                    ),
                SizedBox(
                  height: 60,
                ),
                Text("Ou crie caso ainda não tenha uma"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}