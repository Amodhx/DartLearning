import 'package:my_dart_project/controllers/customer.controller.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';
import 'package:my_dart_project/controllers/user_controller.dart';

void main() async {
  final userController = UserController();
  final customerController = CustomerController();

  final router = Router()
    ..mount('/users', userController.router.call)
    ..mount('/customers', customerController.router.call);

  final handler = Pipeline().addMiddleware(logRequests()).addHandler(router);

  final server = await shelf_io.serve(handler, 'localhost', 8080);
  server.autoCompress = true;
  print('✅ Serving at http://${server.address.host}:${server.port}');
}
