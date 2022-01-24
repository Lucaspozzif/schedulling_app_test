import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leandro_e_alessandro/avaliacoes.dart';
import 'package:leandro_e_alessandro/carrinho.dart';
import 'package:leandro_e_alessandro/perfil.dart';
import 'receita.dart';
import 'agenda.dart';
import 'avaliacoes.dart';
import 'funcoes.dart';

void main() {
  runApp(MaterialApp(
    title: "Leandro e Alessandro",
    debugShowCheckedModeBanner: false,
    home: InicialPage(),
    theme: ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.red,
      ),
    ),
  ));
}

class InicialPage extends StatefulWidget {
  const InicialPage({Key? key}) : super(key: key);

  @override
  _InicialPageState createState() => _InicialPageState();
}

class _InicialPageState extends State<InicialPage> {
  Future<void> workersJson() async {
    final String response =
        await rootBundle.loadString("assets/json/workers.json");
    final data = await json.decode(response);
    return workers = data;
  }

  Future<void> servicesJson() async {
    final String response =
        await rootBundle.loadString("assets/json/services.json");
    final data = await json.decode(response);
    return services = data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: 
              [ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                  fixedSize: Size(300, 80),
                ),
                child: 
              Text(
                  "Pular Login (debug)",style: TextStyle(color: Colors.red,fontSize: 30),),
                onPressed: () {
                  servicesJson();
                  workersJson();
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
              ),
            ],
          ),
        ],
      ),
    );
  }
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
