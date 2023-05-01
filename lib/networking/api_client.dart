import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:meow_generator2/model/cat.dart';

class ApiClient {
  static const baseUrl = 'https://api.thecatapi.com/v1';

  Future<Cat> getRandomCat() async {
    final response = await http.get(Uri.parse('$baseUrl/images/search'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body)[0];
      return Cat.fromJson(json);
    } else {
      throw Exception('Failed to load cat');
    }
  }
}
