import 'package:account_data_portal/src/data/models/api_data/api_data.dart';
import 'package:account_data_portal/src/data/models/api_data/market_analysis.dart';
import 'package:account_data_portal/src/presentation/widgets/constant_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

class MarketAnalysisView extends StatefulWidget {
  const MarketAnalysisView({Key? key, this.data}) : super(key: key);
  final ApiData? data;
  @override
  State<MarketAnalysisView> createState() => _MarketAnalysisViewState();
}

class _MarketAnalysisViewState extends State<MarketAnalysisView> {
  late MarketAnalysis ma;
  @override
  void initState() {
    ma = widget.data!.marketAnalysis!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: ListView(
          children: [
            const Text('Trade Trend Analysis', style: titleStyle),
            const Text(
              '2021-05-31 to 2022-05-31 Vietnam Trend Analysis',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 500,
              child: BarChart(
                BarChartData(
                  gridData: FlGridData(
                    // drawHorizontalLine: false,
                    horizontalInterval: 10000000,
                    getDrawingHorizontalLine: (value) => FlLine(
                      dashArray: [1000, 0],
                      strokeWidth: 0.25,
                    ),
                    drawVerticalLine: false,
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) => const Text('a'),
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        interval: 10000000,
                        showTitles: true,
                        reservedSize: 75,
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  barGroups: [
                    BarChartGroupData(
                      x: ma.data!.elementAt(0).month!,
                      barRods: [
                        BarChartRodData(
                          toY: ma.data!.elementAt(0).amount!.toDouble(),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: ma.data!.elementAt(1).month!,
                      barRods: [
                        BarChartRodData(
                          toY: 101103121,
                          // toY: ma.data!.elementAt(1).amount!.toDouble(),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: ma.data!.elementAt(2).month!,
                      barRods: [
                        BarChartRodData(
                          toY: 91103121,
                          // toY: ma.data!.elementAt(2).amount!.toDouble(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(children: [
                  const Text('Transactions'),
                  Text(ma.transactions.toString()),
                ]),
                Column(children: [
                  const Text('Amount'),
                  Text(ma.amount.toString()),
                ]),
                Column(children: [
                  const Text('Qty'),
                  Text(ma.qty.toString()),
                ]),
              ],
            ),
            SizedBox(
              height: 400,
              child: PlutoGrid(
                columns: [
                  PlutoColumn(
                    cellPadding: 0,
                    titlePadding: 0,
                    readOnly: true,
                    title: 'Month',
                    field: 'month',
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
                rows: ma.data!
                    .map(
                      (e) => PlutoRow(
                        cells: {
                          'month': PlutoCell(value: e.month),
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
            ),
          ],
        ),
      ),
    );
  }
}
