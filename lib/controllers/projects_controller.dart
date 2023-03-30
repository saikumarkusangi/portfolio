import 'package:flutter/material.dart';
import 'package:portfolio/models/projects_models.dart';

import '../services/network_services.dart';

class ProjectController extends ChangeNotifier {
  bool isLoading = false;
  List<ProjectsModel> projects = [];

  ProjectController() {
    fetchProject();
  }

  Future<void> fetchProject() async {
    isLoading = true;
    notifyListeners();
    projects = await NetworkManager.fecthProjects();
    isLoading = false;
    notifyListeners();
  }
}
