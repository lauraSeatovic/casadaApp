import 'package:casada/data/order_product.dart';
import 'package:casada/products/products_bloc.dart';
import 'package:flutter/material.dart';

import '../../data/product.dart';

class ProductCatalogStep extends StatefulWidget {
  final List<OrderProduct> productsList;
  final ValueChanged<List<OrderProduct>> onChanged;

  const ProductCatalogStep(
      {required this.productsList, required this.onChanged});

  @override
  _ProductCatalogStepState createState() => _ProductCatalogStepState();
}

class _ProductCatalogStepState extends State<ProductCatalogStep> {
  List<Product> productList = []; // Your list of products
  List<Product> filteredList = []; // Filtered list based on search query
  TextEditingController searchController = TextEditingController();
  List<OrderProduct> selectedProducts = [];
  String searchQuery = '';
  final ProductsBloc productsBloc = ProductsBloc();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            labelText: 'Pretraži',
          ),
        ),
        Container(
          height: 300,
          child: ListView.builder(
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
                    OrderProduct newProduct = OrderProduct();
                    newProduct.productid = product.productId;
                    newProduct.productName = product.productName;
                    newProduct.productPrice = product.productPrice;
                    newProduct.quantity = 1;
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Dodaj proizvod'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Popust',
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        newProduct.discount =
                                            double.tryParse(value);
                                      });
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Popust ne može biti prazan.';
                                      }
                                      if (double.tryParse(value) == null) {
                                        return 'Unesite decimalni broj.';
                                      }
                                      if (double.tryParse(value)! > 100 ||
                                          double.tryParse(value)! < 0) {
                                        return 'Unesite broj između 0 i 100';
                                      }
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                      labelText: 'Trajanje jamstva u mjesecima',
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        newProduct.guarantee =
                                            int.tryParse(value);
                                      });
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Trajanje jamstva ne može biti prazno.';
                                      }
                                      if (int.tryParse(value) == null) {
                                        return 'Unesite cijeli broj.';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Odustani'),
                          ),
                          TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.of(context).pop();
                                if (!(selectedProducts.any((product) =>
                                    product.productid ==
                                    newProduct.productid))) {
                                  setState(() {
                                    selectedProducts.add(newProduct);
                                    widget.onChanged(selectedProducts);
                                  });
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Proizvod je već odabran!'),
                                      duration: Duration(seconds: 3),
                                    ),
                                  );
                                }
                              }
                            },
                            child: Text('Dodaj'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 60,
        ),
        Divider(
          height: 1,
          color: Colors.grey,
          thickness: 1,
          indent: 16,
          endIndent: 16,
        ),
        Text(
          'Proizvodi u narudžbi',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        _buildAddedProductsTable(),
      ],
    );
  }

  Widget _buildAddedProductsTable() {
    return Container(
      alignment: Alignment.centerLeft,
      child: DataTable(
        columns: [
          DataColumn(label: Text('Proizvod')),
          DataColumn(label: Text('Cijena/€')),
          DataColumn(label: Text('Popust')),
          DataColumn(label: Text('Trajanje jamstva/mjeseci')),
          DataColumn(label: Text('Količina')),
          DataColumn(label: Text('')),
        ],
        rows: selectedProducts.map((product) {
          return DataRow(cells: [
            DataCell(Text(product.productName ?? '')),
            DataCell(Text(product.productPrice?.toString() ?? '')),
            DataCell(Text(product.discount?.toString() ?? '')),
            DataCell(Text(product.guarantee?.toString() ?? '')),
            DataCell(Text(product.quantity?.toString() ?? '')),
            DataCell(
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        selectedProducts.forEach((productList) {
                          if (productList.productid == product.productid) {
                            productList.quantity =
                                (productList.quantity ?? 0) + 1;
                            widget.onChanged(selectedProducts);
                          }
                        });
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        selectedProducts.removeWhere((productList) =>
                            productList.productid == product.productid);
                        widget.onChanged(selectedProducts);
                      });
                    },
                  ),
                ],
              ),
            ),
          ]);
        }).toList(),
      ),
    );
  }
}
