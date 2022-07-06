import 'package:account_data_portal/src/data/data_repo.dart';
import 'package:account_data_portal/src/presentation/views/views.dart';
import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/models/api_data/api_data.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(textTheme: GoogleFonts.interTextTheme()),
      home: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  AppViewState createState() => AppViewState();
}

class AppViewState extends State<AppView> {
  int? index = 0;
  late DataRepo dataRepo;

  @override
  void initState() {
    super.initState();
    dataRepo = DataRepo(Dio());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ApiData>>(
      future: dataRepo.getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return AdaptiveNavigationScaffold(
            selectedIndex: 0,
            destinations: _allDestinations.sublist(0, 5),
            body: Padding(
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(),
                      title: Text('An Cuong Wood Working Manufacturing Co.ltd'),
                      subtitle: Text('info@ancuong.com'),
                    ),
                    Row(
                      children: [
                        const Text('Category:'),
                        Wrap(
                          children: List<Widget>.generate(
                            categories.length,
                            (int z) {
                              return ChoiceChip(
                                label: Text(categories[z]),
                                selected: index == z,
                                onSelected: (bool selected) {
                                  setState(() {
                                    index = selected ? z : null;
                                  });
                                },
                              );
                            },
                          ).toList(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1000,
                      child: Builder(builder: (context) {
                        switch (index) {
                          case 0:
                            return TradeDataView(data: snapshot.data);
                          case 1:
                            return MarketAnalysisView(
                              data: snapshot.data?[0],
                            );
                          case 2:
                            return BuyerView(
                              data: snapshot.data?[0].buyer,
                            );
                          case 3:
                            return BuyerView(
                              data: snapshot.data?[0].buyer,
                            );
                          case 4:
                            return SupplyCountryView(
                              data: snapshot.data?[0].supplyCountry,
                            );
                          case 5:
                            return PolView(
                              data: snapshot.data?[0].pol,
                            );
                          case 6:
                            return PodView(
                              data: snapshot.data?[0].pod,
                            );
                          default:
                            return const Center(
                              child: Text('Some error happened'),
                            );
                        }
                      }),
                    ),
                    // ),
                  ],
                ),
              ),
            ),
            persistentFooterButtons: const [Text('AAAA')],
            drawerHeader: const SizedBox(
              height: 100,
              child: Center(
                child: Text(
                  'Account Trade Portal',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const CircularProgressIndicator.adaptive();
        }
      },
    );
  }
}

const _allDestinations = [
  AdaptiveScaffoldDestination(title: 'Alarm', icon: Icons.alarm),
  AdaptiveScaffoldDestination(title: 'Book', icon: Icons.book),
  AdaptiveScaffoldDestination(title: 'Cake', icon: Icons.cake),
  AdaptiveScaffoldDestination(title: 'Directions', icon: Icons.directions),
  AdaptiveScaffoldDestination(title: 'Email', icon: Icons.email),
  AdaptiveScaffoldDestination(title: 'Favorite', icon: Icons.favorite),
  AdaptiveScaffoldDestination(title: 'Group', icon: Icons.group),
  AdaptiveScaffoldDestination(title: 'Headset', icon: Icons.headset),
  AdaptiveScaffoldDestination(title: 'Info', icon: Icons.info),
];

const categories = [
  'Trade Data',
  'Market Analysis',
  'Supplier',
  'Buyer',
  'Supply Country',
  'POL',
  'POD',
];
