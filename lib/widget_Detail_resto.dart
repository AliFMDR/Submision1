import 'package:flutter/material.dart';
import 'package:projek2/model/resto_detail.dart';
import 'package:flutter/src/rendering/viewport.dart';

class RestaurantDetail extends StatelessWidget {
  static const routeName = '/Restaurant_detail';

  final Restaurant restaurant;
  const RestaurantDetail(
      {Key? key, required this.restaurant, required String idResto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('restaurant'),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Image.network(
            "https://restaurant-api.dicoding.dev/images/medium/" +
                restaurant.pictureId,
          ),
          Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: TextStyle(fontSize: 30),
                  ),
                  Row(
                    children: [Icon(Icons.location_pin), Text(restaurant.city)],
                  ),
                  Row(children: [
                    Icon(Icons.star_half_sharp),
                    Text(restaurant.rating.toString())
                  ]),
                  Divider(
                    height: 10,
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Description'),
                          Divider(height: 10),
                          Text(restaurant.description)
                        ],
                      )),
                  Divider(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Text('Menu Food'),
                      Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: restaurant.menus.foods.length,
                          itemBuilder: (_, index) {
                            return Text(restaurant.menus.foods[index].name);
                          },
                        ),
                      ),
                      Text('Menu Drinks'),
                      Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: restaurant.menus.drinks.length,
                          itemBuilder: (_, index) {
                            return Text(restaurant.menus.drinks[index].name);
                          },
                        ),
                      )
                    ],
                  )
                ],
              ))
        ])));
  }
}
