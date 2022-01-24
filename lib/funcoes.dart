// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'agenda.dart';
import 'avaliacoes.dart';
import 'carrinho.dart';
import 'main.dart';
import 'perfil.dart';
import 'receita.dart';

bool escolheuprofissional = false;
bool escolheuservico = false;

bool appbar = false;

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
dynamic agendando = {};
List servicos = [
  {"nome": "Corte", "valor": 50.09},
  {"nome": "Escova", "valor": 400.00},
  {"nome": "Corte", "valor": 50.09},
  {"nome": "Escova", "valor": 400.00},
  {"nome": "Corte", "valor": 50.09},
  {"nome": "Escova", "valor": 400.00},
  {"nome": "Corte", "valor": 50.09},
  {"nome": "Escova", "valor": 400.00},
  {"nome": "Unha", "valor": 15.00}
];

Widget thisPage = Agenda();
