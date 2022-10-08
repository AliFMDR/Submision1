import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projek2/model/resto_list.dart';
import 'package:projek2/model/resto_detail.dart';
import 'package:projek2/model/resto_search.dart';

class Service {
  final http.Client client;

  Service(this.client);

  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/';

  Future<RestaurantResult> RestaurantList() async {
    final response = await client.get(Uri.parse('${_baseUrl}list'));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('failed to load');
    }
  }

  Future<DetailRestaurantResult> getDetailId(String id) async {
    final response = await client.get(Uri.parse('${_baseUrl}detail/$id'));
    if (response.statusCode == 200) {
      return DetailRestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('failed to load');
    }
  }

  Future<SearchRestaurantResult> getTextField(String query) async {
    final response = await client.get(Uri.parse('${_baseUrl}search?q=$query'));
    if (response.statusCode == 200) {
      return SearchRestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('failed to load');
    }
  }
}
