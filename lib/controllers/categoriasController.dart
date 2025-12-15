import 'package:get/get.dart';
import 'package:swipe_card_app/model/opcionCategorias.dart';


class CategoriasController extends GetxController {
  final opciones = <OpcionCategorias>[].obs;  
  var seleccionado = (-1).obs;
  Rx<int> numJugadores = 2.obs;//numero de jugadores

  @override
  void onInit() {
    super.onInit();

    opciones.addAll([
      OpcionCategorias(
        titulo: 'Divertido',
        imagen: 'assets/images/card1.png',
        accion: () => Get.snackbar('Acción', 'Perfil presionado'),
      ),
      OpcionCategorias(
        titulo: 'Desafiante',
        imagen: 'assets/images/card1.png',
        accion: () => Get.snackbar('Acción', 'Configuración presionada'),
      ),
      OpcionCategorias(
        titulo: 'Para reir',
        imagen: 'assets/images/card1.png',
        accion: () => Get.offAllNamed('/login'),
      ),
    ]);
  }
}