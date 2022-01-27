// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'agenda.dart';
import 'avaliacoes.dart';
import 'carrinho.dart';
import 'main.dart';
import 'perfil.dart';
import 'receita.dart';

bool choosedWorker = false;
bool choosedService = false;
bool choosedTime = false;
bool appbar = false;
bool scheduledActive = false;

Widget thisPage = Perfil();

List services = [];
List workers = [];
dynamic products = [];
dynamic schedule = [];
List scheduled = [];

List list = [];
List timer = [
  "8:00",
  "8:30",
  "9:00",
  "9:30",
  "10:00",
  "10:30",
  "11:00",
  "11:30",
  "12:00",
  "12:30",
  "13:00",
  "13:30",
  "14:00",
  "14:30",
  "15:00",
  "15:30",
  "16:00",
  "16:30",
  "17:00",
  "17:30",
  "18:00",
  "18:30",
  "19:00",
  "19:30",
  "20:00",
];
List randomColors = [
  Colors.blue,
  Colors.red,
  Colors.yellow,
  Colors.green,
  Colors.purple,
  Colors.orange
];

getTime() {
  if (scheduled.length == 0) return "Nenhum";
    list = [];
  for (var i = 0; i < scheduled.length; i++) {
    list.add(scheduled[i]["timeIndex"]);
  }
  return timer[list.reduce((curr, next) => curr < next ? curr : next)];
}
