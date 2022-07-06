import 'package:account_data_portal/src/data/models/api_data/api_data.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

class TradeDataView extends StatefulWidget {
  const TradeDataView({Key? key, this.data}) : super(key: key);
  final List<ApiData>? data;
  @override
  State<TradeDataView> createState() => _TradeDataViewState();
}

class _TradeDataViewState extends State<TradeDataView> {
  final List<PlutoColumn> columns = <PlutoColumn>[
    PlutoColumn(
      cellPadding: 0,
      titlePadding: 0,
      readOnly: true,
      title: 'Trade Date',
      field: 'trade_date',
      type: PlutoColumnType.text(),
      titleTextAlign: PlutoColumnTextAlign.center,
      textAlign: PlutoColumnTextAlign.center,
    ),
    PlutoColumn(
      title: 'Buyer',
      field: 'buyer',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Supplier',
      field: 'supplier',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Products',
      field: 'products',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Details',
      field: 'widgets',
      type: PlutoColumnType.date(),
      readOnly: true,
      renderer: (c) => const Text('AAAAAA'),
      titleTextAlign: PlutoColumnTextAlign.center,
      textAlign: PlutoColumnTextAlign.center,
    ),
  ];

  late List<PlutoRow>? rows;
  @override
  void initState() {
    final transactions = widget.data?.elementAt(0).transactions;
    rows = transactions
        ?.map(
          (e) => PlutoRow(
            cells: {
              'trade_date': PlutoCell(value: e.tradeDate),
              'buyer': PlutoCell(value: e.buyer),
              'supplier': PlutoCell(value: e.supplier),
              'products': PlutoCell(value: e.products),
              'widgets': PlutoCell(value: ''),
            },
          ),
        )
        .toList();
    super.initState();
  }

  /// [PlutoGridStateManager] has many methods and properties to dynamically manipulate the grid.
  /// You can manipulate the grid dynamically at runtime by passing this through the [onLoaded] callback.
  late final PlutoGridStateManager stateManager;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: PlutoGrid(
          columns: columns,
          rows: rows!,
          onLoaded: (PlutoGridOnLoadedEvent event) {
            stateManager = event.stateManager;
            stateManager.autoFitColumn(context, columns[0]);
            stateManager.autoFitColumn(context, columns[3]);
            stateManager.setEditing(false);
          },
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
      ),
    );
  }
}
