import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../../data/service.dart';

class ServicesDataTable extends StatelessWidget {
  final List<Service> services;

  ServicesDataTable({required this.services});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Početak')),
        DataColumn(label: Text('Kraj')),
        DataColumn(label: Text('Opis')),
        DataColumn(label: Text('Cijena/€')),
        DataColumn(label: Text('Narudžba')),
        DataColumn(label: Text('Proizvod')),
      ],
      rows: services.map((service) {
        return DataRow(cells: [
          DataCell(Text(service.serviceId.toString())),
          DataCell(Text(DateFormat('dd-MM-yyyy').format(service.serviceStartDate!))),
          DataCell(Text(DateFormat('dd-MM-yyyy').format(service.serviceFinishDate!))),
          DataCell(Text(service.serviceNote.toString())),
          DataCell(Text(service.servicePrice.toString())),
          DataCell(Text(service.orderNumber.toString())),
          DataCell(Text(service.productName.toString())),
        ]);
      }).toList(),
    );
  }
}