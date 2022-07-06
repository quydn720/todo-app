import 'dart:math';

import 'package:account_data_portal/src/data/models/api_data/pol.dart';
import 'package:account_data_portal/src/presentation/widgets/constant_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

class PolView extends StatelessWidget {
  const PolView({Key? key, this.data}) : super(key: key);
  final List<Pol>? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
            'POL Transaction Proportion Chart (Top 5)',
            style: titleStyle,
          ),
          const Text(
            '2021-05-31 to 2022-05-31 Top 5 POL trading volume as a 100.00 of total trading volume',
            style: TextStyle(fontSize: 16),
          ),
          Expanded(
            child: PieChart(
              PieChartData(
                startDegreeOffset: -90,
                sections: data!
                    .map((e) => PieChartSectionData(
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
          const Text('48 results'),
          Expanded(
            child: PlutoGrid(
              columns: [
                PlutoColumn(
                  readOnly: true,
                  title: 'pol',
                  field: 'pol',
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
                // PlutoColumn(
                //   title: 'amount',
                //   field: 'amount',
                //   type: PlutoColumnType.text(),
                // ),
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
                        'pol': PlutoCell(value: e.pol),
                        'transactions': PlutoCell(value: e.transactions),
                        'percent': PlutoCell(value: e.percent),
                        // 'amount': PlutoCell(value: e.amount),
                        'qty': PlutoCell(value: e.qty),
                        'seller': PlutoCell(value: e.seller),
                        'buyer': PlutoCell(value: e.buyer),
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
