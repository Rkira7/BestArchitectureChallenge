import 'dart:convert';
import 'dart:io';

import 'package:best_architecture_challenge/model/Error.dart';
import 'package:best_architecture_challenge/model/reporteEntradas.dart';
import 'package:http/http.dart' as http;

class MovimientoProvider{

  final http.Client _httpClient;

  // SI ES NULO SE CREA UN CLIENTE NUEVO --- PARA PRUEBAS UNITARIAS
  MovimientoProvider({http.Client? httpClient}):  _httpClient = httpClient ?? http.Client();

  Future<List<Movimientos>> getMovimientos () async{
    http.Response? response;
    try{
      final url = Uri.https("url", "parametros");
      response =  await _httpClient.get(url);
      //final Map<String, dynamic> responseBody = json.decode(response.body);
      if(response.statusCode == 200){
        return List<Movimientos>.from(json.decode(response.body)["data"].map((c) => Movimientos.fromJson(c)).toList());
      }
      else{
        return throw ErrorApi.fromJson(json.decode(response.body));
      }
    } on SocketException{
      return throw ErrorApi.fromJson(json.decode(response!.body));
    }
    on HttpException {
      return throw ErrorApi.fromJson(json.decode(response!.body));
    }
    catch(e){
      return Future.error(json.decode(response!.body));
    }
  }
}