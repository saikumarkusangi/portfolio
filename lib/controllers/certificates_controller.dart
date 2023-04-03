import 'package:flutter/material.dart';
import 'package:portfolio/models/projects_models.dart';

import '../models/certificates_model.dart';
import '../services/network_services.dart';

class CertificatesController extends ChangeNotifier {
  bool isLoading = false;
  List<CertificatesModel> certificates = [];

  CertificatesController() {
    fetchCertificates();
  }

  Future<void> fetchCertificates() async {
    isLoading = true;
    notifyListeners();
    certificates = await NetworkManager.fetchcertificates();
    isLoading = false;
    notifyListeners();
  }
}
