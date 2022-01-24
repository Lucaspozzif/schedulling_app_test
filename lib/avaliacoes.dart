import 'package:flutter/material.dart';
import 'main.dart';
import 'funcoes.dart';

class Avaliacoes extends StatefulWidget {
  const Avaliacoes({ Key? key }) : super(key: key);

  @override
  _AvaliacoesState createState() => _AvaliacoesState();
}

class _AvaliacoesState extends State<Avaliacoes> {
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
                  "Sem avaliações",
                  style: TextStyle(fontSize: 25, color: Colors.red),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Icon(Icons.star,size: 150, color: Colors.black,)
                    ),
                SizedBox(
                  height: 60,
                ),
                Text("Você poderá avaliar os profissionais que contratar"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}