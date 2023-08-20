import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon02/models/pop_model.dart';

class ApiServicePop {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static const String popular = "popular";

  static Future<List<PopModel>> getPopular() async {
    List<PopModel> popInstances = [];
    final url = Uri.parse('$baseUrl/$popular');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> results = data['results'];

      for (var popular in results) {
        popInstances.add(PopModel.fromJson(popular));
      }
      return popInstances;
    }
    throw Error();
  }
}
