// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:parapay/models/team_model.dart';
import 'package:parapay/models/competition_model.dart';
import 'package:parapay/services/api_service.dart';
import 'package:parapay/util/getter.dart';
import 'dart:convert' as convert;

class HomeProvider with ChangeNotifier {
  HomeProvider() {
    getCompetitions();
  }

  List<Competition> competitions = [];
  List<Match> matches = [];
  bool isLoading = true;
  ApiService apiService = ApiService();

  getCompetitions() async {
    isLoading = true;
    notifyListeners();
    competitions = await apiService.getcompetition();
    isLoading = false;
    notifyListeners();
  }

  getMatches(int id) async {
    isLoading = true;
    notifyListeners();
    matches = await apiService.getMatches(id);
    isLoading = false;
    notifyListeners();
  }
}
