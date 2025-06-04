import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class CustomerController {
  Router get router {
    Router router = Router();
    router.get('/', _getAllCustomers);
    router.get('/<id>', _getCustomerById);

    return router;
  }

  Response _getAllCustomers(Request request) {
    return Response.ok('All Customers');
  }

  Response _getCustomerById(Request request, String id) {
    return Response.ok("Customer By $id");
  }
}
