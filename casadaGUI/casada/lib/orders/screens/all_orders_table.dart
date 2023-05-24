import 'package:casada/orders/order_repository.dart';
import 'package:casada/orders/orders_bloc.dart';
import 'package:casada/orders/screens/order_detail_screen.dart';
import 'package:casada/orders/screens/order_html_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  TextEditingController _searchController = TextEditingController();
  List<Order> _filteredData = [];
  int _sortColumnIndex = 2;
  bool _sortAscending = true;

  @override
  void initState() {
    super.initState();
    _filteredData = widget.data;
  }

  void _filterData(String searchText) {
    setState(() {
      _filteredData = widget.data.where((order) {
        return order.buyerName
                .toString()
                .toLowerCase()
                .contains(searchText.toLowerCase()) ||
            order.buyerSurname
                .toString()
                .toLowerCase()
                .contains(searchText.toLowerCase());
      }).toList();
    });
  }

  void _sort<T>(
      Comparable<T> Function(Order) getField, int columnIndex, bool ascending) {
    _filteredData.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });

    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(children: [
          CustomPaginatedDataTable(
            header: TextField(
              controller: _searchController,
              onChanged: (value) {
                _filterData(value);
              },
              decoration: InputDecoration(
                labelText: 'Pretraži',
              ),
            ),
            columns: [
              DataColumn(
                label: Text(''),
              ),
              DataColumn(
                label: Text('ID'),
              ),
              DataColumn(
                label: Text('Datum'),
                onSort: (columnIndex, ascending) {
                  _sort<DateTime>((d) => d.orderDate!, columnIndex, ascending);
                },
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
            source: _DataTableSource(_filteredData, context),
            rowsPerPage: 5, // number of rows to show per page
            sortColumnIndex: _sortColumnIndex,
            sortAscending: _sortAscending,
          )
        ]));
  }
}

class _DataTableSource extends DataTableSource {
  final OrdersBloc _ordersBloc = OrdersBloc();
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
        DataCell(Text(DateFormat('yyyy-MM-dd').format(item.orderDate!))),
        DataCell(Text(
            "${item.buyerName.toString()} ${item.buyerSurname.toString()}")),
        DataCell(Text(item.orderStatusName.toString())),
        DataCell(Text(item.paymentMethodName.toString())),
        DataCell(Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  _context,
                  MaterialPageRoute(
                      builder: (context) => OrderDetailScreen(
                            orderId: item.orderId!,
                            buyerId: item.buyerId!,
                          )),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.picture_as_pdf),
              onPressed: () {
                _ordersBloc.getOrderPDF(item.orderId!);
              },
            ),
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                Navigator.push(
                  _context,
                  MaterialPageRoute(
                      builder: (context) =>
                          OrderHtmlScreen(orderId: item.orderId!)),
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
