import 'package:flutter/material.dart';
import 'main.dart';

bool escolheuprofissional = false;

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
        appBar: MenuAbrir(),
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
                escolheuprofissional
                    ? EscolherServico()
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
        Container(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white)),
            onPressed: () {
              escolheuprofissional = true;
              Navigator.pushReplacement(context, PageRouteBuilder(
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
        Profissionais(),
      ],
    );
  }
}

class Profissionais extends StatefulWidget {
  const Profissionais({Key? key}) : super(key: key);

  @override
  _ProfissionaisState createState() => _ProfissionaisState();
}

class _ProfissionaisState extends State<Profissionais> {
  List data = [
    {
      "nome": "Leandro Pozzi",
      "funcao": "Cabeleireiro",
      "avaliacao": 5,
      "foto": "man.png",
      "servicos": [
        {"nome": "Corte", "valor": 50.09},
        {"nome": "Escova", "valor": 400}
      ],
    },
    {
      "nome": "Alessandro Pozzi",
      "funcao": "Escovista",
      "avaliacao": 4.5,
      "foto": "man (1).png",
      "servicos": [
        {"nome": "Corte", "valor": 50.09},
        {"nome": "Escova", "valor": 400}
      ],
    },
    {
      "nome": "Daniela Pozzi",
      "funcao": "Manicure",
      "avaliacao": 5,
      "foto": "woman (2).png",
      "servicos": [
        {"nome": "Corte", "valor": 50.09},
        {"nome": "Escova", "valor": 400}
      ],
    },
    {
      "nome": "Flaviane Pozzi",
      "funcao": "Sobrancelha",
      "avaliacao": 4,
      "foto": "woman.png",
      "servicos": [
        {"nome": "Corte", "valor": 50.09},
        {"nome": "Escova", "valor": 400}
      ],
    },
    {
      "nome": "Adelice",
      "funcao": "Cabeleireiro",
      "avaliacao": 4,
      "foto": "woman (1).png",
      "servicos": [
        {"nome": "Corte", "valor": 50.09},
        {"nome": "Escova", "valor": 400}
      ],
    },
    {
      "nome": "Laércio",
      "funcao": "Cabeleireiro",
      "avaliacao": 5,
      "foto": "man (3).png",
      "servicos": [
        {"nome": "Corte", "valor": 50.09},
        {"nome": "Escova", "valor": 400}
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (_, index) => Container(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {},
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
            ));
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
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                fixedSize: Size(300, 60),
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Escova",
                  style: TextStyle(fontSize: 30, color: Colors.red),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "R\$ 200,00",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                )
              ],
            )),
      ],
    );
  }
}
