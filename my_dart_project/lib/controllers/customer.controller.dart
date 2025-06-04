import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class CustomerController {
  Router get router {
    Router router = Router();
    router.get('/', _getAllCustomers);
    router.get('/<id>', _getCustomerById);

    return router;
  }

  Response _getAllCustomers() {
    return Response.ok('All Customers');
  }

  Response _getCustomerById() {
    return Response.ok("Customer By Id");
  }
}
