import 'package:casada/data/order_product.dart';
import 'package:casada/orders/orders_bloc.dart';
import 'package:casada/products/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../data/product.dart';

class ProductDetails extends StatefulWidget {
  final int orderId;

  const ProductDetails({super.key, required this.orderId});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  TextEditingController _productController = TextEditingController();
  List<Product> productList = [];
  List<Product> filteredList = [];
  TextEditingController searchController = TextEditingController();
  List<OrderProduct> selectedProducts = [];
  String searchQuery = '';
  final ProductsBloc productsBloc = ProductsBloc();
  final OrdersBloc ordersBloc = OrdersBloc();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  void _loadProducts() async {
    productList = await productsBloc.getProductList();
    List<OrderProduct> selectedList =
        await ordersBloc.loadAllOrderProduct(widget.orderId);
    print(selectedList);
    setState(() {
      selectedProducts = selectedList;
    });
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

  List<Product> _suggestion(String text) {
    return productList.where((product) {
      return product.productName
          .toString()
          .toLowerCase()
          .contains(text.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        SizedBox(
          height: 60,
        ),
        Row(
          children: [
            Text(
              'Proizvodi u narudžbi',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 16,),
            ElevatedButton(
              child: Text("Dodaj proizvod"),
              onPressed: () {
                OrderProduct newProduct = OrderProduct();
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
                              TypeAheadField(
                                textFieldConfiguration: TextFieldConfiguration(
                                  controller: _productController,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    labelText: 'Novi proizvod',
                                    errorText: null,
                                  ),
                                ),
                                suggestionsCallback: (pattern) async {
                                  return _suggestion(pattern);
                                },
                                itemBuilder: (context, suggestion) {
                                  return ListTile(
                                    title: Text(suggestion.productName!),
                                  );
                                },
                                onSuggestionSelected: (suggestion) {
                                  setState(() {
                                    _productController.text =
                                        suggestion.productName!;
                                    newProduct.productid = suggestion.productId;
                                    newProduct.productName =
                                        suggestion.productName;
                                    newProduct.productPrice =
                                        suggestion.productPrice;
                                    newProduct.quantity = 1;
                                    newProduct.orderid = widget.orderId;
                                  });
                                },
                              ),
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
                                    newProduct.guarantee = int.tryParse(value);
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
                                product.productid == newProduct.productid))) {
                              setState(() {
                                selectedProducts.add(newProduct);
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
            SizedBox(width: 16,),
            ElevatedButton(
              onPressed: () {
                ordersBloc.updateProducts(selectedProducts);
              },
              child: Text('Spremi'),
            )
          ],
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
                          }
                        });
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        selectedProducts.forEach((productList) {
                          if (productList.productid == product.productid) {
                            productList.quantity =
                                (productList.quantity ?? 0) - 1;
                            if (productList.quantity == 0) {
                              selectedProducts.remove(productList);
                            }
                          }
                        });
                      });
                    },
                  ),
                  /*
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        selectedProducts.removeWhere((productList) =>
                            productList.productid == product.productid);
                      });
                    },
                  ),*/
                ],
              ),
            ),
          ]);
        }).toList(),
      ),
    );
  }
}
