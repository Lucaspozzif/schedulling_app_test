import 'main.dart';
import 'package:flutter/material.dart';
import 'funcoes.dart';

class Carrinho extends StatefulWidget {
  const Carrinho({ Key? key }) : super(key: key);

  @override
  _CarrinhoState createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
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
                  "Sem Compras",
                  style: TextStyle(fontSize: 25, color: Colors.red),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Icon(Icons.shopping_cart,size: 150, color: Colors.black,)
                    ),
                SizedBox(
                  height: 60,
                ),
                Text("Os seus serviços contratados aparecerão aqui"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}