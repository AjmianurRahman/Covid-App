import 'dart:convert';

import 'package:covid_app/Models/WorldStatsModel.dart';
import 'package:covid_app/Services/Utilities/app_urls.dart';
import 'package:http/http.dart' as https;

class StatsServices {
  Future<WorldStatsModel> fetchWorldStatsRecords() async {
    final response = await https.get(Uri.parse(AppUrls.worldStatesApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return WorldStatsModel.fromJson(data) ;
    } else {

      throw Exception('ERROR');
    }
  }

  Future<List<dynamic>> fetchCountriesStatsRecords() async {
    var data;
    final response = await https.get(Uri.parse(AppUrls.countriesList));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('ERROR');
    }
  }
}
