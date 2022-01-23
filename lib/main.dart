import 'package:flutter/material.dart';
import 'agenda.dart';

void main() {
  runApp(MaterialApp(
    home: Agenda(),
    theme: ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.red,
      ),
    ),
  ));
}




class Menu extends StatefulWidget implements PreferredSizeWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();

  @override
  Size get preferredSize => new Size.fromHeight(60);
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        IconButton(onPressed: () {}, icon: Icon(Icons.view_headline)),
        Spacer(),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Leandro e Alessandro",
            style: TextStyle(fontSize: 20),
          )
        ]),
        Spacer(),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
            SizedBox(
              width: 20,
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag))
          ],
        ),
      ],
    );
  }
}

class MenuAbrir extends StatefulWidget implements PreferredSizeWidget {
  const MenuAbrir({Key? key}) : super(key: key);

  @override
  _MenuAbrirState createState() => _MenuAbrirState();

  @override
  Size get preferredSize => new Size.fromHeight(60);
}

class _MenuAbrirState extends State<MenuAbrir> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        //Menumento
        SizedBox(
          width: 30,
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.schedule)),
        Spacer(),
        //Avaliação de serviços
        IconButton(onPressed: () {}, icon: Icon(Icons.star)),
        Spacer(),
        //pagamento e valores
        IconButton(onPressed: () {}, icon: Icon(Icons.credit_card)),
        Spacer(),
        //Meu perfil
        IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)),
        SizedBox(
          width: 30,
        ),
      ],
    );
  }
}
