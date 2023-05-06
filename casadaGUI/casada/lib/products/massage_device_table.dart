import 'package:flutter/material.dart';

import '../data/massage_device.dart';

class MassageDeviceTable extends StatefulWidget {
  final List<MassageDevice> data;

  MassageDeviceTable({required this.data});

  @override
  _MassageDeviceTableState createState() => _MassageDeviceTableState();
}

class _MassageDeviceTableState extends State<MassageDeviceTable> {
  late final _dataTableSource = _DataTableSource(widget.data);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: PaginatedDataTable(
          header: Text('Masažni uređaji'),
          columns: [
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
              label: Text('Tip'),
            ),
          ],
          source: _dataTableSource,
          rowsPerPage: 5, // number of rows to show per page
        ));
  }
}

class _DataTableSource extends DataTableSource {
  final List<MassageDevice> _data;
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
        DataCell(Text(item.productId.toString())),
        DataCell(Text(item.productName.toString())),
        DataCell(Text(item.productPrice.toString())),
        DataCell(Text(item.productActiveStatus.toString())),
        DataCell(Text(item.productCode.toString())),
        DataCell(Text(item.massageDeviceTypeName.toString())),
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
