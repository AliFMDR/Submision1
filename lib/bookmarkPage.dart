import 'package:projek2/provider/database_provider.dart';

import 'package:projek2/widget_list_resto.dart';

import 'package:projek2/widget_platform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        if (provider.state == ResultState.hasData) {
          return ListView.builder(
            itemCount: provider.bookmarks.length,
            itemBuilder: (context, index) {
              return TampilanResto(restaurant: provider.bookmarks[index]);
            },
          );
        } else {
          return Center(
            child: Material(
              child: Text(provider.message),
            ),
          );
        }
      },
    );
  }
}
