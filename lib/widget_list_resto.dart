import 'package:flutter/material.dart';
import 'package:projek2/RestaurantDetailPage.dart';
import 'package:projek2/model/resto_list.dart';

class TampilanResto extends StatelessWidget {
  final Restaurant restaurant;

  const TampilanResto({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            leading: Image.network(
              "https://restaurant-api.dicoding.dev/images/large/" +
                  restaurant.pictureId,
              width: 100,
            ),
            title: Text(restaurant.name),
            subtitle: Row(
                children: [Icon(Icons.location_pin), Text(restaurant.city)]),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return RestaurantDetailPage(idResto: restaurant.id);
              }));
            }));
  }
}
