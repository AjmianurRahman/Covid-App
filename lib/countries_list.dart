import 'package:covid_app/Services/statws_services.dart';
import 'package:covid_app/detailed_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController scon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StatsServices statsServices = StatsServices();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: TextStyle(fontWeight: FontWeight.w300),
                controller: scon,
                decoration: InputDecoration(
                    hintText: 'Search with country name',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
            ),
            Expanded(
                child: FutureBuilder(
                    future: statsServices.fetchCountriesStatsRecords(),
                    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  print('IS CLICKED////////////');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailedScreen(
                                                image: snapshot.data![index]
                                                    ['countryInfo']['flag'],
                                                name: snapshot.data![index]
                                                    ['country'],
                                                totalRecovered: snapshot
                                                    .data![index]['recovered'],
                                                totalDeaths: snapshot
                                                    .data![index]['deaths'],
                                                todayRecovered:
                                                    snapshot.data![index]
                                                        ['todayRecovered'],
                                                critical: snapshot.data![index]
                                                    ['critical'],
                                                totalCases: snapshot
                                                    .data![index]['cases'],
                                              )));
                                },
                                child: ListTile(
                                  title: Text(snapshot.data![index]['country']),
                                  subtitle: Text(snapshot.data![index]['cases']
                                      .toString()),
                                  leading: Image(
                                    height: 50,
                                    width: 70,
                                    fit: BoxFit.cover,
                                    image: NetworkImage(snapshot.data![index]
                                        ['countryInfo']['flag']),
                                  ),
                                ),
                              );
                            }
                            );
                      }else{
                        return Center(child: Text('None'),);
                      }
                    })),
          ],
        ),
      ),
    );
  }
}
