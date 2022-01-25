import 'dart:math';

import 'funcoes.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class Agenda extends StatefulWidget {
  const Agenda({Key? key}) : super(key: key);

  @override
  _AgendaState createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
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
                  "Agendar Horário",
                  style: TextStyle(fontSize: 25, color: Colors.red),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Image.asset(
                      'assets/icon/schedule.png',
                      width: 150,
                      height: 150,
                    )),
                choosedWorker
                    ? choosedService
                        ? choosedTime
                            ? FinishedSchedule()
                            : EscolherHorario()
                        : EscolherServico()
                    : EscolherProfissional(),
                SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EscolherProfissional extends StatefulWidget {
  const EscolherProfissional({Key? key}) : super(key: key);

  @override
  _EscolherProfissionalState createState() => _EscolherProfissionalState();
}

class _EscolherProfissionalState extends State<EscolherProfissional> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "Escolha um Profissional",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white)),
            onPressed: () {
              choosedWorker = true;
              int num = Random().nextInt(workers.length);
              schedule = {
                "name": workers[num]["name"],
                "perfil": workers[num]["perfil"],
                "service": "",
                "schedule": workers[num]["schedule"],
                "timeIndex": ""
              };
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
            child: Row(children: [
              Icon(
                Icons.person,
                size: 80,
                color: Colors.black,
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  Text(
                    "Sem Preferência",
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                  Text(
                    "Todos os serviços",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  )
                ],
              ),
            ]),
          ),
        ),
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: workers.length,
            itemBuilder: (_, index) => Container(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {
                      choosedWorker = true;
                      schedule = {
                        "name": workers[index]["name"],
                        "perfil": workers[index]["perfil"],
                        "service": "",
                        "schedule": workers[index]["schedule"],
                        "timeIndex": "",
                        "colors": [],
                        "rate":1
                      };
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (c, a1, a2) => const Agenda(),
                          transitionsBuilder: (c, anim, a2, child) =>
                              FadeTransition(opacity: anim, child: child),
                          transitionDuration: const Duration(milliseconds: 100),
                        ),
                      );
                      setState(() {});
                    },
                    child: Row(children: [
                      Image.asset(
                        'assets/perfil/${workers[index]["perfil"]}',
                        width: 80,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          Text(
                            workers[index]["name"],
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                          Text(
                            workers[index]["job"],
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          )
                        ],
                      ),
                    ]),
                  ),
                ))
      ],
    );
  }
}

class EscolherServico extends StatefulWidget {
  const EscolherServico({Key? key}) : super(key: key);

  @override
  _EscolherServicoState createState() => _EscolherServicoState();
}

class _EscolherServicoState extends State<EscolherServico> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "Escolha um Serviço",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 30,
        ),
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: services.length,
          itemBuilder: (_, index) => Container(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: ElevatedButton(
              onPressed: () {
                choosedService = true;
                schedule["service"] = services[index]["name"];
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (c, a1, a2) => const Agenda(),
                    transitionsBuilder: (c, anim, a2, child) =>
                        FadeTransition(opacity: anim, child: child),
                    transitionDuration: const Duration(milliseconds: 100),
                  ),
                );
                setState(() {});
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(300, 60),
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    services[index]["name"],
                    style: TextStyle(fontSize: 30, color: Colors.red),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "R\$ ${services[index]["value"]}",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class EscolherHorario extends StatefulWidget {
  const EscolherHorario({Key? key}) : super(key: key);

  @override
  _EscolherHorarioState createState() => _EscolherHorarioState();
}

class _EscolherHorarioState extends State<EscolherHorario> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "Escolha um Horário",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 30,
        ),
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 24,
            itemBuilder: (_, index) => Container(
                  padding: EdgeInsets.fromLTRB(150, 30, 150, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: schedule["schedule"][index]
                            ? Colors.red
                            : Colors.white,
                        fixedSize: Size(100, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(300))),
                    onPressed: () {
                      if (schedule["schedule"][index] == true) return;
                      choosedTime = true;
                      schedule["timeIndex"] = index;
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (c, a1, a2) => const Agenda(),
                          transitionsBuilder: (c, anim, a2, child) =>
                              FadeTransition(opacity: anim, child: child),
                          transitionDuration: const Duration(milliseconds: 100),
                        ),
                      );
                      setState(() {});
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          timer[index],
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                )),
      ],
    );
  }
}

class FinishedSchedule extends StatefulWidget {
  const FinishedSchedule({Key? key}) : super(key: key);

  @override
  _FinishedScheduleState createState() => _FinishedScheduleState();
}

class _FinishedScheduleState extends State<FinishedSchedule> {
  List colors = [
    Random().nextInt(randomColors.length),
    Random().nextInt(randomColors.length)
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "Agendamento completo",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          height: 120,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
                colors: [randomColors[colors[0]], randomColors[colors[1]]],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                tileMode: TileMode.clamp),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'assets/perfil/${schedule["perfil"]}',
                        width: 100,
                        height: 100,
                      ),
                      Spacer(),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 1,
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                        iconSize: 30,
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "${schedule["name"]}",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            timer[schedule["timeIndex"]],
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(schedule["service"],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25))
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40))),
            onPressed: () {
              choosedWorker = false;
              choosedService = false;
              choosedTime = false;
              schedule["colors"] = colors;
              scheduled.add(schedule);
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
            child: Row(children: [
              Icon(
                Icons.person_add,
                size: 80,
                color: Colors.black,
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  Text(
                    "Concluido",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
