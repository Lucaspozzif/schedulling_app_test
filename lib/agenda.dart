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
                escolheuprofissional
                    ? escolheuservico
                        ? EscolherHorario()
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
              agendando = {
                "nome": "disponível",
                "servico": "",
                "valor": 0,
                "data": []
              };
              escolheuprofissional = true;
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
            itemCount: data.length,
            itemBuilder: (_, index) => Container(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {
                      agendando = {
                        "nome": data[index]["nome"],
                        "servico": "",
                        "valor": 0,
                        "data": []
                      };
                      servicos = data[index]["servicos"];
                      escolheuprofissional = true;
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
                        'assets/perfil/${data[index]["foto"]}',
                        width: 80,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          Text(
                            data[index]["nome"],
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                          Text(
                            data[index]["funcao"],
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
          itemCount: servicos.length,
          itemBuilder: (_, index) => Container(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: ElevatedButton(
              onPressed: () {
                agendando["servico"] = servicos[index]["nome"];
                agendando["valor"] = servicos[index]["valor"];
                escolheuservico = true;
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
                    servicos[index]["nome"],
                    style: TextStyle(fontSize: 30, color: Colors.red),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "R\$ ${servicos[index]["valor"]}",
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
        Text("Foi mal, ainda vou fazer esse aqui hehehe"),
        Container(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white)),
            onPressed: () {
              escolheuprofissional = false;
              escolheuservico = false;
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
                Text("Agendar um novo serviço",style: TextStyle(color: Colors.black,fontSize: 20),)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
