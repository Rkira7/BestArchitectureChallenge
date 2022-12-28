
import 'dart:convert';

import 'package:best_architecture_challenge/model/post.dart';
import 'package:http/http.dart' as http;

class RestProvider {
  final http.Client _httpClient;

  RestProvider({http.Client? httpClient}):  _httpClient = httpClient ?? http.Client(); // SI ES NULO SE CREA UN CLIENTE NUEVO

  Future<List<Post>> getListaPost () async{
    final url = Uri.https('', '/posts');
    final response =  await _httpClient.get(url);
    return List<Post>.from(json.decode(response.body).map((c) => Post.fromJson(c)).toList());

  }



}