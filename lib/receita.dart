import 'package:flutter/material.dart';
import 'main.dart';
import 'funcoes.dart';

class Receita extends StatefulWidget {
  const Receita({Key? key}) : super(key: key);

  @override
  _ReceitaState createState() => _ReceitaState();
}

class _ReceitaState extends State<Receita> {
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
                  "Sem receita",
                  style: TextStyle(fontSize: 25, color: Colors.red),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Icon(
                      Icons.account_balance_wallet,
                      size: 150,
                      color: Colors.black,
                    )),
                SizedBox(
                  height: 60,
                ),
                Text("Seus gastos serão salvos aqui"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
