import 'package:account_data_portal/src/data/models/api_data/supply_country.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

class SupplyCountryView extends StatelessWidget {
  const SupplyCountryView({Key? key, this.data}) : super(key: key);
  final List<SupplyCountry>? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlutoGrid(
        columns: [
          PlutoColumn(
            readOnly: true,
            title: 'country',
            field: 'country',
            type: PlutoColumnType.text(),
            titleTextAlign: PlutoColumnTextAlign.center,
            textAlign: PlutoColumnTextAlign.center,
          ),
          PlutoColumn(
            title: 'transactions',
            field: 'transactions',
            type: PlutoColumnType.text(),
          ),
          PlutoColumn(
            title: 'percent',
            field: 'percent',
            type: PlutoColumnType.text(),
          ),
          PlutoColumn(
            title: 'amount',
            field: 'amount',
            type: PlutoColumnType.text(),
          ),
          PlutoColumn(
            title: 'qty',
            field: 'qty',
            type: PlutoColumnType.text(),
          ),
          PlutoColumn(
            title: 'buyer',
            field: 'buyer',
            type: PlutoColumnType.text(),
          ),
          PlutoColumn(
            title: 'seller',
            field: 'seller',
            type: PlutoColumnType.text(),
          ),
        ],
        rows: data!
            .map(
              (e) => PlutoRow(
                cells: {
                  'country': PlutoCell(value: e.country),
                  'transactions': PlutoCell(value: e.transactions),
                  'percent': PlutoCell(value: e.percent),
                  'amount': PlutoCell(value: e.amount),
                  'qty': PlutoCell(value: e.qty),
                  'buyer': PlutoCell(value: e.buyer),
                  'seller': PlutoCell(value: e.seller),
                },
              ),
            )
            .toList(),
        onChanged: (PlutoGridOnChangedEvent event) {
          debugPrint(event.toString());
        },
        createHeader: (c) => const Text('Header'),
        configuration: PlutoGridConfiguration(
          enableColumnBorder: true,
          gridBorderRadius: BorderRadius.circular(16),
          gridBorderColor: const Color(0xff606C80),
        ),
      ),
    );
  }
}
