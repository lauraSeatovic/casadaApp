import 'package:casada/orders/screens/order_deatil_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/custom_paginated_data_table.dart';
import '../../data/order.dart';

class AllOrdersTable extends StatefulWidget {
  final List<Order> data;

  AllOrdersTable({required this.data});

  @override
  _AllOrdersTableState createState() => _AllOrdersTableState();
}

class _AllOrdersTableState extends State<AllOrdersTable> {
  late final _dataTableSource = _DataTableSource(widget.data, context);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomPaginatedDataTable(
          header: Text('Sve narudžbe'),
          columns: [
            DataColumn(
              label: Text(''),
            ),
            DataColumn(
              label: Text('ID'),
            ),
            DataColumn(
              label: Text('Datum'),
            ),
            DataColumn(
              label: Text('Kupac'),
            ),
            DataColumn(
              label: Text('Status'),
            ),
            DataColumn(
              label: Text('Način plaćanja'),
            ),
            DataColumn(
              label: Text(''),
            ),
          ],
          source: _DataTableSource(widget.data, context),
          rowsPerPage: 5, // number of rows to show per page
        ));
  }
}

class _DataTableSource extends DataTableSource {
  final List<Order> _data;
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
        DataCell(Text(item.orderId.toString())),
        DataCell(Text(item.orderDate.toString())),
        DataCell(Text("${item.buyerName.toString()} ${item.buyerSurname.toString()}")),
        DataCell(Text(item.orderStatusName.toString())),
        DataCell(Text(item.paymentMethodName.toString())),
        DataCell(
              IconButton(
                icon: Icon(Icons.info_outline),
                onPressed: () {
            Navigator.push(
              _context,
              MaterialPageRoute(builder: (context) => OrderDetailScreen(orderId: item.orderId!)),
            );
          },
              ),
            ),
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
