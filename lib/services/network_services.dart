import "package:dio/dio.dart";
import "package:portfolio/models/projects_models.dart";

import "../models/certificates_model.dart";

const uri =
    'https://script.google.com/macros/s/AKfycbwepVCvaBkxG1BTEYlmqmqc4OhMALAVBwcWtQ_b1BdbLH1ZclW5v3qW2WdOxJbE3hQ/exec';

class NetworkManager {
  static var dio = Dio();

  static Future<List<ProjectsModel>> fecthProjects() async {
    var response = await dio.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((item) => ProjectsModel.fromJson(item)).toList();
    } else {
      throw Exception('Something went wrong!!!');
    }
  }

    static Future<List<CertificatesModel>> fetchcertificates() async {
    var response = await dio.get('https://script.google.com/macros/s/AKfycbx59qf41QWefIw1wk_BgX8a0YnOjzdy3EA9IPd4oZV8dbg33cWTmoR2FKoffgg_W5ZACw/exec');

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((item) => CertificatesModel.fromJson(item)).toList();
    } else {
      throw Exception('Something went wrong!!!');
    }
  }
}

