import 'package:casada/products/products_bloc.dart';
import 'package:flutter/material.dart';

import '../../data/product.dart';

class ProductCatalogStep extends StatefulWidget {
  @override
  _ProductCatalogStepState createState() => _ProductCatalogStepState();
}

class _ProductCatalogStepState extends State<ProductCatalogStep> {
  List<Product> productList = []; // Your list of products
  List<Product> filteredList = []; // Filtered list based on search query
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';
  final ProductsBloc productsBloc = ProductsBloc();

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  void _loadProducts() async {
    productList = await productsBloc.getProductList();
    filteredList = productList;
  }

  void filterProducts() {
    final query = searchController.text.toLowerCase();
    final filteredProducts = productList.where((product) {
      final productName = product.productName!.toLowerCase();
      return productName.contains(query);
    }).toList();

    setState(() {
      searchQuery = query;
      filteredList = filteredProducts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: searchController,
          onChanged: (value) {
            filterProducts();
          },
          decoration: InputDecoration(
            labelText: 'Search',
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: filteredList.length,
          itemBuilder: (context, index) {
            final product = filteredList[index];
            return ListTile(
              title: Text(product.productName!),
              subtitle: Text(product.productPrice.toString()),
              trailing: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  // Add the product to the order
                  // You can maintain a list of selected products in the order here
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
