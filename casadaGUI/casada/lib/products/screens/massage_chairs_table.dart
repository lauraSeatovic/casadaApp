import 'package:casada/common/custom_paginated_data_table.dart';
import 'package:casada/products/products_bloc.dart';
import 'package:casada/products/screens/edit_massage_chair.dart';
import 'package:flutter/material.dart';

import '../../data/massage_chair.dart';

class MassageChairTable extends StatefulWidget {
  final List<MassageChair> data;

  MassageChairTable({required this.data});

  @override
  _MassageChairTableState createState() => _MassageChairTableState();
}

class _MassageChairTableState extends State<MassageChairTable> {
  TextEditingController _searchController = TextEditingController();
  List<MassageChair> _filteredData = [];

  @override
  void initState() {
    super.initState();
    _filteredData = widget.data;
  }

  void _filterData(String searchText) {
    setState(() {
      _filteredData = widget.data.where((chair) {
        return chair.productName
            .toString()
            .toLowerCase()
            .contains(searchText.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(children: [
          CustomPaginatedDataTable(
            header: Row(
              children: [
                Container(
                    width: 150,
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        _filterData(value);
                      },
                      decoration: InputDecoration(
                        labelText: 'Pretraži',
                      ),
                    )),
                SizedBox(
                  width: 20,
                ),
                Text('Masažne fotelje'),
              ],
            ),
            columns: [
              DataColumn(
                label: Text(''),
              ),
              DataColumn(
                label: Text('ID'),
              ),
              DataColumn(
                label: Text('Naziv'),
              ),
              DataColumn(
                label: Text('Cijena/€'),
              ),
              DataColumn(
                label: Text('Aktivan'),
              ),
              DataColumn(
                label: Text('Šifra'),
              ),
              DataColumn(
                label: Text('Klasa'),
              ),
              DataColumn(
                label: Text(''),
              ),
            ],
            source: _DataTableSource(_filteredData, context),
            rowsPerPage: 5, // number of rows to show per page
          ),
        ]));
  }
}

class _DataTableSource extends DataTableSource {
  final List<MassageChair> _data;
  ProductsBloc _productsBloc = ProductsBloc();
  final BuildContext _context;
  int _selectedRowCount = 0;
  _DataTableSource(this._data, this._context);

  @override
  DataRow? getRow(int index) {
    if (index >= _data.length) {
      return null;
    }
    final item = _data[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(("${++index}.").toString())),
        DataCell(Text(item.productId.toString())),
        DataCell(Text(item.productName.toString())),
        DataCell(Text(item.productPrice.toString())),
        DataCell(
          item.productActiveStatus == true
              ? Icon(Icons.check, color: Colors.green)
              : Icon(Icons.close, color: Colors.red),
        ),
        DataCell(Text(item.productCode.toString())),
        DataCell(Text(item.massageChairClassName.toString())),
        DataCell(Row(
          children: [
            IconButton(icon: Icon(Icons.edit), onPressed: () {
              Navigator.push(
                _context,
                MaterialPageRoute(builder: (context) => EditMassageChair(productId: item.productId!, name:item.productName!, price:item.productPrice!.toString(), code:item.productCode!, isActive:item.productActiveStatus!, selectedId: item.massageChairClassId!)),
              );
            }),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                showDialog(
                  context: _context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Izbriši proizvod'),
                      content:
                          Text('Jeste li sigurni da želite obrisati proizvod?'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Odustani'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Obriši'),
                          onPressed: () {
                            _productsBloc.deleteProduct(item.productId!);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        )),
      ],
    );
  }

  @override
  int get rowCount => _data.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedRowCount;
}
