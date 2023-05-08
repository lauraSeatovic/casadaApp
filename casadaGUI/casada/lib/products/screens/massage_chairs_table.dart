import 'package:flutter/material.dart';

import '../../data/massage_chair.dart';

class MassageChairTable extends StatefulWidget {
  final List<MassageChair> data;

  MassageChairTable({required this.data});

  @override
  _MassageChairTableState createState() => _MassageChairTableState();
}

class _MassageChairTableState extends State<MassageChairTable> {
  late final _dataTableSource = _DataTableSource(widget.data);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: PaginatedDataTable(
        header: Text('Masažne fotelje'),
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
            label: Text('Cijena'),
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
        ],
        source: _dataTableSource,
        rowsPerPage: 5, // number of rows to show per page
      ),
    );
  }
}

class _DataTableSource extends DataTableSource {
  final List<MassageChair> _data;
  int _selectedRowCount = 0;
  _DataTableSource(this._data);

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
