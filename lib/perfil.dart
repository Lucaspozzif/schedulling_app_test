import 'agenda.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'funcoes.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple.shade100,
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
          child: Icon(
            Icons.schedule,
            color: Colors.black54,
          )),
      bottomNavigationBar: MenuAbrir(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Container(
            color: Colors.purple.shade100,
            child: Column(
              children: [
                Menu(),
                SizedBox(
                  height: 60,
                ),
                Icon(
                  Icons.account_circle,
                  size: 150,
                  color: Colors.black54,
                ),
                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white70,
                      fixedSize: Size(100, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  onPressed: () {},
                  child: Text(
                    "Entrar",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(width: 20,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white70,
                      fixedSize: Size(100, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  onPressed: () {},
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),],
                ),
                SizedBox(height: 600,)
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
