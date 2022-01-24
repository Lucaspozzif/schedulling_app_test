import 'package:flutter/material.dart';
import 'package:leandro_e_alessandro/avaliacoes.dart';
import 'package:leandro_e_alessandro/carrinho.dart';
import 'package:leandro_e_alessandro/perfil.dart';
import 'receita.dart';
import 'agenda.dart';
import 'avaliacoes.dart';
import 'funcoes.dart';
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
        IconButton(
            onPressed: () {
              appbar = !appbar;
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => thisPage,
                  transitionsBuilder: (c, anim, a2, child) =>
                      FadeTransition(opacity: anim, child: child),
                  transitionDuration: const Duration(milliseconds: 100),
                ),
              );
            },
            icon: Icon(Icons.view_headline)),
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
            IconButton(
                onPressed: () {
                  appbar = false;
                  thisPage = Carrinho();
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (c, a1, a2) => const Carrinho(),
                      transitionsBuilder: (c, anim, a2, child) =>
                          FadeTransition(opacity: anim, child: child),
                      transitionDuration: const Duration(milliseconds: 100),
                    ),
                  );
                },
                icon: Icon(Icons.shopping_bag))
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
        IconButton(
            onPressed: () {
              appbar = !appbar;
              thisPage = Agenda();
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => const Agenda(),
                  transitionsBuilder: (c, anim, a2, child) =>
                      FadeTransition(opacity: anim, child: child),
                  transitionDuration: const Duration(milliseconds: 100),
                ),
              );
            },
            icon: Icon(Icons.schedule)),
        Spacer(),
        //Avaliação de serviços
        IconButton(
            onPressed: () {
              appbar = !appbar;
              thisPage = Avaliacoes();
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => const Avaliacoes(),
                  transitionsBuilder: (c, anim, a2, child) =>
                      FadeTransition(opacity: anim, child: child),
                  transitionDuration: const Duration(milliseconds: 100),
                ),
              );
            },
            icon: Icon(Icons.star)),
        Spacer(),
        //pagamento e valores
        IconButton(
            onPressed: () {
              thisPage = Receita();
              appbar = !appbar;
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => const Receita(),
                  transitionsBuilder: (c, anim, a2, child) =>
                      FadeTransition(opacity: anim, child: child),
                  transitionDuration: const Duration(milliseconds: 100),
                ),
              );
            },
            icon: Icon(Icons.credit_card)),
        Spacer(),
        //Meu perfil
        IconButton(
            onPressed: () {
              thisPage = Perfil();
              appbar = !appbar;
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => const Perfil(),
                  transitionsBuilder: (c, anim, a2, child) =>
                      FadeTransition(opacity: anim, child: child),
                  transitionDuration: const Duration(milliseconds: 100),
                ),
              );
            },
            icon: Icon(Icons.account_circle)),
        SizedBox(
          width: 30,
        ),
      ],
    );
  }
}
