import 'dart:math';

import 'package:account_data_portal/src/data/models/api_data/buyer.dart';
import 'package:account_data_portal/src/presentation/widgets/constant_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

class BuyerView extends StatelessWidget {
  const BuyerView({Key? key, this.data}) : super(key: key);
  final List<Buyer>? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Buyer Transaction Proportion Chart (Top 5)',
            style: titleStyle,
          ),
          const Text(
            '2021-05-31 to 2022-05-31 Top 5 Buyer trading volume as a 100.00 of total trading volume',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 500,
            child: PieChart(
              PieChartData(
                startDegreeOffset: -90,
                sections: data!
                    .map((e) => PieChartSectionData(
                          badgeWidget: Text(e.supplier ?? ''),
                          badgePositionPercentageOffset: 1.2,
                          color: Color(
                            (Random().nextDouble() * 0xFFFFFF).toInt(),
                          ).withOpacity(0.7),
                          value: e.percent!.toDouble(),
                          radius: 200,
                        ))
                    .toList(),
                sectionsSpace: 0,
                centerSpaceRadius: 0,
                borderData: FlBorderData(show: false),
              ),
            ),
          ),
          const Text('3 results'),
          Expanded(
            child: PlutoGrid(
              columns: [
                PlutoColumn(
                  readOnly: true,
                  title: 'supplier',
                  field: 'supplier',
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
                  title: 'seller',
                  field: 'seller',
                  type: PlutoColumnType.text(),
                ),
              ],
              rows: data!
                  .map(
                    (e) => PlutoRow(
                      cells: {
                        'supplier': PlutoCell(value: e.supplier),
                        'transactions': PlutoCell(value: e.transactions),
                        'percent': PlutoCell(value: e.percent),
                        'amount': PlutoCell(value: e.amount),
                        'qty': PlutoCell(value: e.qty),
                        'seller': PlutoCell(value: e.buyer),
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
          ),
        ],
      ),
    );
  }
}
