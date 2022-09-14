import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projek2/Apiresto.dart';
import 'package:projek2/provider/detail_restaurant.dart';
import 'package:projek2/widget_Detail_resto.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';
  final String idResto;
  const RestaurantDetailPage({Key? key, required this.idResto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: ChangeNotifierProvider<DetailRestaurantProvider>(
        create: (_) =>
            DetailRestaurantProvider(apiService: ApiService(), id: idResto),
        child: Consumer<DetailRestaurantProvider>(
          builder: (context, state, _) {
            if (state.state == ResultState.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.state == ResultState.hasData) {
              final restaurants = state.result.restaurants;
              return RestaurantDetail(
                restaurant: restaurants,
                idResto: '',
              );
            } else if (state.state == ResultState.noData) {
              return Center(child: Text(state.message));
            } else if (state.state == ResultState.error) {
              return Center(child: Text(state.message));
            } else {
              return const Center(
                  child:
                      Text('Cant Load, please check your internet connection'));
            }
          },
        ),
      ),
    );
  }
}
