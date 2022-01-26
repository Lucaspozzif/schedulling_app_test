import 'package:flutter/material.dart';
import 'main.dart';
import 'funcoes.dart';
import 'agenda.dart';

class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  RegistroState createState() => RegistroState();
}

class RegistroState extends State<Registro> {
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
              children: [Menu(), scheduled.isEmpty ? noRegister() : Register()],
            ),
          ),
        ),
      ),
    );
  }
}

class noRegister extends StatefulWidget {
  const noRegister({Key? key}) : super(key: key);

  @override
  State<noRegister> createState() => _noRegisterState();
}

class _noRegisterState extends State<noRegister> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Icon(
            Icons.note_add,
            size: 150,
            color: Colors.black54,
          )),
      SizedBox(
        height: 60,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.white70,
                fixedSize: Size(280, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40))),
            onPressed: () {
              choosedWorker = false;
              choosedService = false;
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
            child: Text(
              "Agendar um novo serviço",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 600,
      ),
    ]);
  }
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: scheduled.length,
          itemBuilder: (_, index) => Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white70,
                            fixedSize: Size(280, 80),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40))),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: 100,
                              child: Column(
                                children: [
                                  Text(
                                    scheduled[index]["name"],
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.black54),
                                  ),
                                  Image.asset(
                                    'assets/perfil/${scheduled[index]["perfil"]}',
                                    width: 60,
                                    height: 60,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                scheduled[index]["rate"] > 0
                                    ? Icon(
                                        Icons.star,
                                        size: 15,
                                        color: Colors.yellow,
                                      )
                                    : Container(),
                                scheduled[index]["rate"] > 1
                                    ? Icon(
                                        Icons.star,
                                        size: 15,
                                        color: Colors.yellow,
                                      )
                                    : Container(),
                                scheduled[index]["rate"] > 2
                                    ? Icon(
                                        Icons.star,
                                        size: 15,
                                        color: Colors.yellow,
                                      )
                                    : Container(),
                                scheduled[index]["rate"] > 3
                                    ? Icon(
                                        Icons.star,
                                        size: 15,
                                        color: Colors.yellow,
                                      )
                                    : Container(),
                                scheduled[index]["rate"] > 4
                                    ? Icon(
                                        Icons.star,
                                        size: 15,
                                        color: Colors.yellow,
                                      )
                                    : Container(),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  timer[scheduled[index]["timeIndex"]],
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 25),
                                ),
                                Text(scheduled[index]["service"],
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 12))
                              ],
                            ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print(list);
                      list.remove(scheduled[index]["timeIndex"]);
                      workers[scheduled[index]["workerIndex"]]["schedule"]
                          [scheduled[index]["timeIndex"]] = false;
                      scheduled.removeAt(index);
                      getTime();
                      setState(() {});
                      if (scheduled.isEmpty) {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (c, a1, a2) => const Registro(),
                            transitionsBuilder: (c, anim, a2, child) =>
                                FadeTransition(opacity: anim, child: child),
                            transitionDuration:
                                const Duration(milliseconds: 100),
                          ),
                        );
                      }
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete,
                            size: 24,
                            color: Colors.red[200],
                          )
                        ]),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white70,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        fixedSize: Size(40, 80)),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 700)
      ],
    );
  }
}
