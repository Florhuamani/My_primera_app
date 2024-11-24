import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mi_pimera_app/providers/My_app_state.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appState = context.watch<MyAppState>();

    if (appState.favorite.isEmpty) {
      return Center(
        child: Text('No tienes favoritos'),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(30),
          child: Text('Tienes ${appState.favorite.length} favoritos:'),
          ),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                childAspectRatio: 400 / 80,
                ),
                children: [
                  for (var pair in appState.favorite)
                  ListTile(
                    leading: IconButton(onPressed: () {
                      appState.removeFavorite(pair);
                    }, 
                    icon: Icon(
                      Icons.delete_outline,
                      semanticLabel: 'Eliminar',
                    ),
                      color: theme.colorScheme.primary,
                  ),
                  title: Text(
                    pair.asLowerCase,
                    semanticsLabel: pair.asPascalCase,
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}