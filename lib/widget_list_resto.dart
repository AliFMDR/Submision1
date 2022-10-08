import 'package:flutter/material.dart';
import 'package:projek2/RestaurantDetailPage.dart';
import 'package:projek2/common/navigation.dart';
import 'package:projek2/model/resto_list.dart';
import 'package:projek2/provider/database_provider.dart';
import 'package:provider/provider.dart';

class TampilanResto extends StatelessWidget {
  final Restaurant restaurant;

  const TampilanResto({Key? key, required this.restaurant}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<bool>(
          future: provider.isBookmarked(restaurant.id),
          builder: (context, snapshot) {
            var isBookmarked = snapshot.data ?? false;
            return Material(
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                leading: Hero(
                  tag: restaurant.pictureId,
                  child: Image.network(
                    "https://restaurant-api.dicoding.dev/images/large/" +
                        restaurant.pictureId,
                    width: 100,
                  ),
                ),
                title: Text(
                  restaurant.name,
                ),
                subtitle: Text(restaurant.city),
                trailing: isBookmarked
                    ? IconButton(
                        icon: const Icon(Icons.favorite),
                        color: Theme.of(context).colorScheme.secondary,
                        onPressed: () => provider.removeBookmark(restaurant.id),
                      )
                    : IconButton(
                        icon: const Icon(Icons.favorite_border),
                        color: Theme.of(context).colorScheme.secondary,
                        onPressed: () => provider.addBookmark(restaurant),
                      ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RestaurantDetailPage(restaurant: restaurant.id);
                  }));
                },
              ),
            );
          },
        );
      },
    );
  }
}
