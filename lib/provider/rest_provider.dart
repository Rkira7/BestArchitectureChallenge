
import 'dart:convert';

import 'package:best_architecture_challenge/model/post.dart';
import 'package:http/http.dart' as http;

class RestProvider {
  final http.Client _httpClient;

  // SI ES NULO SE CREA UN CLIENTE NUEVO --- PARA PRUEBAS UNITARIAS
  RestProvider({http.Client? httpClient}):  _httpClient = httpClient ?? http.Client();

  Future<List<Post>> getListaPost () async{
    final url = Uri.https('jsonplaceholder.typicode.com', '/posts');
    final response =  await _httpClient.get(url);
    return List<Post>.from(json.decode(response.body).map((c) => Post.fromJson(c)).toList());

  }



}