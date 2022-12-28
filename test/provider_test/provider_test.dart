

import 'dart:io';

import 'package:best_architecture_challenge/provider/rest_provider.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  test("Respuesta Correcta", () async {
    final provider = _getProvider("test/provider_test/mock_response.json");
    final articulos =  await provider.getListaPost();

    //RESPUESTA ESPERADA
    expect(articulos.length, 3);
    expect(articulos[0].id, 1);
    expect(articulos[1].id, 2);
    expect(articulos[2].id, 3);
  });
}

//SIMULAR UNA RESPUESTA DEL SERVIDOR
final headers = {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'};

RestProvider _getProvider(String rutaMock) {
  return RestProvider(httpClient: _mockClientProvider(rutaMock));
}


MockClient _mockClientProvider (String rutaMock) {
  return MockClient((_) async {
   return Response(await File(rutaMock).readAsString(), 200, headers: headers); //EL statusCode es el 200
  });
}
