import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon02/models/soon_model.dart';

class ApiServiceSoon {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static const String soon = "coming-soon";

  static Future<List<SoonModel>> getSoon() async {
    List<SoonModel> soonInstances = [];
    final url = Uri.parse('$baseUrl/$soon');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> results = data['results'];

      for (var soon in results) {
        soonInstances.add(SoonModel.fromJson(soon));
      }
      return soonInstances;
    }
    throw Error();
  }
}
