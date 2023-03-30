import "package:dio/dio.dart";
import "package:portfolio/models/projects_models.dart";

const uri =
    'https://script.googleusercontent.com/macros/echo?user_content_key=4wP08JtcCZHMSnKyfe03ROwWI13_q84gPIzo1zhb9mQ8ogvAjm9--ZJpzHZ6F3osG6UW1i3N0gBEovNQN6bzhfVjOtI4S3zMm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnCQTS6JKqOnd_rS7XXVewmlx5mhrgRqgCjHN82boozDKyOPwJ79KzpXyal9yNsGkt3C1rw-QbCSAsEBvHV6uBYXX9rdibtAh0Q&lib=MRgwWQgLjY_cHS-grVpTZEDVnlS0uLRDp';

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
}
