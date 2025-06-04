import 'dart:io';

import 'package:my_dart_project/controllers/user_controller.dart';

void main() async {
  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
  print('Server running on http://${server.address.host}:${server.port}');

  await for (HttpRequest request in server) {
    UserController userController = UserController();
    userController.printHelloOnController();
    request.response
      ..write('Hello from Dart backend!')
      ..close();
  }
}
