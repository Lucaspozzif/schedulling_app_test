import 'dart:math';

import 'package:flutter/material.dart';
import 'main.dart';
import 'funcoes.dart';
import 'agenda.dart';

class Avaliacoes extends StatefulWidget {
  const Avaliacoes({Key? key}) : super(key: key);

  @override
  _AvaliacoesState createState() => _AvaliacoesState();
}

class _AvaliacoesState extends State<Avaliacoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu(),
      body: Scaffold(
        appBar: appbar ? MenuAbrir() : null,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [scheduled.isEmpty? noRates() : Rates()],
            ),
          ),
        ),
      ),
    );
  }
}

class noRates extends StatefulWidget {
  const noRates({Key? key}) : super(key: key);

  @override
  State<noRates> createState() => _noRatesState();
}

class _noRatesState extends State<noRates> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(padding: EdgeInsets.only(top: 60)),
      Text(
        "Sem avaliações",
        style: TextStyle(fontSize: 25, color: Colors.red),
      ),
      Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Icon(
            Icons.star,
            size: 150,
            color: Colors.black,
          )),
      SizedBox(
        height: 60,
      ),
      Text("Você poderá avaliar os profissionais que contratar"),
      Container(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white)),
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
            setState(() {});
          },
          child: Row(
            children: [
              Icon(
                Icons.new_label_outlined,
                size: 80,
                color: Colors.black,
              ),
              Text(
                "Agendar um novo serviço",
                style: TextStyle(color: Colors.black, fontSize: 20),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}

class Rates extends StatefulWidget {
  const Rates({Key? key}) : super(key: key);

  @override
  _RatesState createState() => _RatesState();
}

class _RatesState extends State<Rates> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "Avalie sua experiência",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 30,
        ),
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: scheduled.length,
          itemBuilder: (_, index) => Container(
            height: 120,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                  colors: [
                    randomColors[scheduled[index]["colors"][0]],
                    randomColors[scheduled[index]["colors"][1]]
                  ],
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
                          'assets/perfil/${scheduled[index]["perfil"]}',
                          width: 100,
                          height: 100,
                        ),
                        Column(
                          children: [
                            scheduled[index]["rate"] > 0
                                ? Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Colors.yellow,
                                  )
                                : Container(),
                            scheduled[index]["rate"] > 1
                                ? Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Colors.yellow,
                                  )
                                : Container(),
                            scheduled[index]["rate"] > 2
                                ? Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Colors.yellow,
                                  )
                                : Container(),
                            scheduled[index]["rate"] > 3
                                ? Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Colors.yellow,
                                  )
                                : Container(),
                            scheduled[index]["rate"] > 4
                                ? Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Colors.yellow,
                                  )
                                : Container(),
                          ],
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
                          onPressed: () {
                            if (scheduled[index]["rate"] > 4)
                              scheduled[index]["rate"] = 0;
                            scheduled[index]["rate"]++;
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (c, a1, a2) => const Avaliacoes(),
                                transitionsBuilder: (c, anim, a2, child) =>
                                    FadeTransition(opacity: anim, child: child),
                                transitionDuration:
                                    const Duration(milliseconds: 100),
                              ),
                            );
                          },
                          icon: Icon(Icons.star),
                          color: Colors.yellow,
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
                              scheduled[index]["name"],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text(
                              timer[scheduled[index]["timeIndex"]],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(scheduled[index]["service"],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25))
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
