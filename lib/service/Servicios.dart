import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import 'package:swipe_card_app/model/preguntas.dart';

//import 'package:snake_ladder1/model/SnakePositions.dart';
//import 'package:snake_ladder1/model/preguntas_juego.dart';

class Servicios {
  static var client = http.Client();

Future<void> fetchData(int questionIndex, bool answer) async {
  final url = Uri.parse('https://tuapi.com/verificar_respuesta');
  

  try {
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "question_id": questionIndex,
        "answer": answer,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("Respuesta del servidor: ${data['message']}");
    } else {
      print("Error: ${response.statusCode}");
    }
  } catch (e) {
    print("Error en la solicitud: $e");
  }
}

static Future<List<Preguntas>> cargarPreguntas(String nomArchivo) async {
    final String contenido = await rootBundle.loadString(nomArchivo);
    final List<dynamic> jsonData = jsonDecode(contenido);
    return jsonData.map((item) => Preguntas.fromJson(item)).toList();
}
  
  

  

  
}