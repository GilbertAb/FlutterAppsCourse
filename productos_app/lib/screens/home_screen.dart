import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);
    final authService = Provider.of<AuthService>(context, listen: false);

    if (productsService.isLoading) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        leading: IconButton(
            onPressed: () {
              authService.logout();
              Navigator.pushReplacementNamed(context, 'login');
            },
            icon: Icon(Icons.logout)),
      ),
      body: ListView.builder(
          itemCount: productsService.products.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () {
                productsService.selectedProduct =
                    productsService.products[index].copy();
                Navigator.pushNamed(context, 'product');
              },
              child: ProductCard(product: productsService.products[index]))),
      // Add new product
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          productsService.selectedProduct =
              Product(available: true, name: '', price: 0);
          Navigator.pushNamed(context, 'product');
        },
      ),
    );
  }
}
