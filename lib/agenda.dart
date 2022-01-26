import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'funcoes.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:path_provider/path_provider.dart';

class Agenda extends StatefulWidget {
  const Agenda({Key? key}) : super(key: key);

  @override
  _AgendaState createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
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
                choosedWorker
                    ? choosedService
                        ? choosedTime
                            ? FinishedSchedule()
                            : EscolherHorario()
                        : EscolherServico()
                    : EscolherProfissional(),
                SizedBox(height: 600),
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
        Container(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.white70,
                fixedSize: Size(280, 80),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40))),
            onPressed: () {
              choosedWorker = true;
              int num = Random().nextInt(workers.length);
              schedule = {
                "name": workers[num]["name"],
                "perfil": workers[num]["perfil"],
                "service": "",
                "schedule": workers[num]["schedule"],
                "timeIndex": "",
                "workerIndex": num,
                "rate": 1
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
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.person,
                size: 80,
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sem Preferência",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Todos os serviços",
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  )
                ],
              ),
            ]),
          ),
        ),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: workers.length,
            itemBuilder: (_, index) => Center(
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 10)),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white70,
                            fixedSize: Size(280, 80),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40))),
                        onPressed: () {
                          choosedWorker = true;
                          schedule = {
                            "name": workers[index]["name"],
                            "perfil": workers[index]["perfil"],
                            "service": "",
                            "schedule": workers[index]["schedule"],
                            "timeIndex": "",
                            "workerIndex": index,
                            "colors": [],
                            "rate": 1
                          };
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (c, a1, a2) => const Agenda(),
                              transitionsBuilder: (c, anim, a2, child) =>
                                  FadeTransition(opacity: anim, child: child),
                              transitionDuration:
                                  const Duration(milliseconds: 100),
                            ),
                          );
                          setState(() {});
                        },
                        child: Row(children: [
                          SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            'assets/perfil/${workers[index]["perfil"]}',
                            height: 80,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                workers[index]["name"],
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                              Text(
                                workers[index]["job"],
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12),
                              )
                            ],
                          ),
                        ]),
                      ),
                    ],
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
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: services.length,
          itemBuilder: (_, index) => Container(
            padding: EdgeInsets.only(top: 10),
            child: Center(
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
                    primary: Colors.white70,
                    fixedSize: Size(280, 80),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      services[index]["name"],
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "R\$ ${services[index]["value"]}",
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    )
                  ],
                ),
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
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 24,
            itemBuilder: (_, index) => Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: schedule["schedule"][index]
                              ? Colors.black26
                              : Colors.white70,
                          fixedSize: Size(280, 80),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40))),
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
                            transitionDuration:
                                const Duration(milliseconds: 100),
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
                              color: Colors.black54,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
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
                Column(
                  children: [
                    Text(
                      schedule["name"],
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    Image.asset(
                      'assets/perfil/${schedule["perfil"]}',
                      width: 60,
                      height: 60,
                    ),
                  ],
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    schedule["rate"] > 0
                        ? Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.yellow,
                          )
                        : Container(),
                    schedule["rate"] > 1
                        ? Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.yellow,
                          )
                        : Container(),
                    schedule["rate"] > 2
                        ? Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.yellow,
                          )
                        : Container(),
                    schedule["rate"] > 3
                        ? Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.yellow,
                          )
                        : Container(),
                    schedule["rate"] > 4
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
                      timer[schedule["timeIndex"]],
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                    Text(schedule["service"],
                        style: TextStyle(color: Colors.black54, fontSize: 15))
                  ],
                ))
              ],
            )),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white70,
                  fixedSize: Size(130, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40))),
              onPressed: () async {
                choosedWorker = false;
                choosedService = false;
                choosedTime = false;
                scheduled.add(schedule);
                workers[schedule["workerIndex"]]["schedule"]
                    [schedule["timeIndex"]] = true;
                scheduledActive = true;
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
                "Finalizar",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.red.shade100,
                  fixedSize: Size(130, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40))),
              onPressed: () {
                choosedWorker = false;
                choosedService = false;
                choosedTime = false;
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
                "Cancelar",
                style: TextStyle(color: Colors.black87, fontSize: 20),
              ),
            ),
          ],
        )
      ],
    );
  }
}
