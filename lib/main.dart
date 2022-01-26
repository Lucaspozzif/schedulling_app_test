import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leandro_e_alessandro/avaliacoes.dart';
import 'package:leandro_e_alessandro/carrinho.dart';
import 'package:leandro_e_alessandro/perfil.dart';
import 'receita.dart';
import 'agenda.dart';
import 'dart:io';
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
        foregroundColor: Colors.black,
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

  Future<void> productsJson() async {
    final String response =
        await rootBundle.loadString("assets/json/products.json");
    final data = await json.decode(response);
    return products = data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple.shade100,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  fixedSize: Size(250, 80),
                ),
                child: Text(
                  "Pular Login (debug)",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                onPressed: () {
                  servicesJson();
                  workersJson();
                  productsJson();
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (c, a1, a2) => Registro(),
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
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    "Próximo serviço",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    scheduledActive ? getTime() : "Nenhum",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (c, a1, a2) => Registro(),
                      transitionsBuilder: (c, anim, a2, child) =>
                          FadeTransition(opacity: anim, child: child),
                      transitionDuration: const Duration(milliseconds: 100),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple.shade100,
                  fixedSize: Size(100, 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Agenda",
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                ),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
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
    return BottomAppBar(
      notchMargin: 4,
      shape: CircularNotchedRectangle(),
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
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
            icon: Icon(
              Icons.account_circle,
              color: Colors.purple.shade100,
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
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
            icon: Icon(
              Icons.star,
              color: Colors.purple.shade100,
            ),
          ),
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
            icon: Icon(
              Icons.payments,
              color: Colors.purple.shade100,
            ),
          ),
        ],
      ), /*
        appBar: AppBar(
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
            icon: Icon(Icons.account_circle),),
        SizedBox(
          width: 30,
        ),
      ],
    )*/
    );
  }
}
