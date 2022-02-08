import 'package:flutter/cupertino.dart';
import 'package:parapay/models/team_model.dart';
import 'package:parapay/services/api_service.dart';

class TeamsProvider extends ChangeNotifier {
  Teams team;
  bool isLoading = true;
  ApiService apiService = ApiService();

  getTeam(int id) async {
    isLoading = true;
    notifyListeners();
    team = await apiService.getteam(id);
    print(team);
    isLoading = false;
    notifyListeners();
  }
}