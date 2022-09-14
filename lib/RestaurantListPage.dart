import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projek2/Apiresto.dart';
import 'package:projek2/provider/list_restaurant.dart';
import 'package:projek2/widget_list_resto.dart';

class RestaurantListPage extends StatelessWidget {
  static const routeName = '/restauran_list';
  const RestaurantListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantProvider>(
      create: (_) => RestaurantProvider(apiService: ApiService()),
      child: Consumer<RestaurantProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.state == ResultState.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.result.restaurants.length,
              itemBuilder: (context, index) {
                var restaurant = state.result.restaurants[index];
                return TampilanResto(restaurant: restaurant);
              },
            );
          } else if (state.state == ResultState.noData) {
            return Center(
                child: Material(
              child: Text(state.message),
            ));
          } else if (state.state == ResultState.error) {
            return Center(
                child: Material(
              child: Text(state.message),
            ));
          } else {
            return const Center(
                child: Material(
              child: Text(''),
            ));
          }
        },
      ),
    );
  }
}
