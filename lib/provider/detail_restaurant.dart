import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:projek2/Apiresto.dart';
import 'package:projek2/model/resto_detail.dart';
import 'package:projek2/Apiresto.dart';
import 'package:projek2/model/resto_detail.dart';
import 'package:projek2/provider/list_restaurant.dart';

enum ResultState { loading, error, noData, hasData }

class DetailRestaurantProvider extends ChangeNotifier {
  final Service service;
  final String id;

  late DetailRestaurantResult _detailRestaurant;
  late ResultState _state;
  String _message = '';

  DetailRestaurantProvider({required this.id, required this.service}) {
    getDetailRestaurant(id);
  }

  String get message => _message;
  DetailRestaurantResult get result => _detailRestaurant;
  ResultState get state => _state;

  Future<dynamic> getDetailRestaurant(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final detailRestaurant = await service.getDetailId(id);
      if (detailRestaurant.error) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _detailRestaurant = detailRestaurant;
      }
    } on SocketException {
      _state = ResultState.error;
      notifyListeners();
      return _message = "No internet connection";
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = e.toString();
    }
  }
}
