import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class UserController {
  Router get router {
    final router = Router();

    router.get('/', _getAllUsers);
    router.get('/<id>', _getUserById);

    return router;
  }

  Response _getAllUsers(Request request) {
    return Response.ok('All users');
  }

  Response _getUserById(Request request, String id) {
    return Response.ok('User ID: $id');
  }
}
