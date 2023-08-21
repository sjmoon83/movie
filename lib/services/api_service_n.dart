// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon02/models/now_model.dart';

class ApiServiceNow {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static const String nowPlay = "now-playing";

  static Future<List<NowModel>> getNowPlay() async {
    List<NowModel> nowInstances = [];
    final url = Uri.parse('$baseUrl/$nowPlay');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> results = data['results'];

      for (var nowPlay in results) {
        nowInstances.add(NowModel.fromJson(nowPlay));
      }
      return nowInstances;
    }
    throw Error();
  }
}
