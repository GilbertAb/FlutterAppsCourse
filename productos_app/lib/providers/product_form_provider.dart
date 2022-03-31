import 'package:flutter/cupertino.dart';
import 'package:productos_app/models/models.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Product product;

  ProductFormProvider(this.product);

  bool isValidForm() {
    print(product.name);
    print(product.price);
    print(product.id);
    return formKey.currentState?.validate() ?? false;
  }

  updateAvailability(bool available) {
    print(available);
    product.available = available;
    notifyListeners();
  }
}
