import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';
import 'package:my_dart_project/controllers/user_controller.dart';

void main() async {
  final userController = UserController();

  final router = Router()
    ..mount('/users', userController.router.call); // Routes start with /users/

  final handler = Pipeline().addMiddleware(logRequests()).addHandler(router);

  final server = await shelf_io.serve(handler, 'localhost', 8080);
  server.autoCompress = true;
  print('✅ Serving at http://${server.address.host}:${server.port}');
}
