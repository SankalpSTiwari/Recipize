import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import './color.dart';

import 'model/app_state_model.dart';
import 'recipe_row_item.dart';

class FavoritesListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, model, child) {
        final recipes = model.getRecipes();
        return CustomScrollView(
          semanticChildCount: recipes.length,
          slivers: <Widget>[
            const CupertinoSliverNavigationBar(
              largeTitle: Text('Favorites', style: TextStyle(fontFamily: 'Abel', fontSize: 25, color: mainColor),),
              backgroundColor: primary ,
            ),
            SliverSafeArea(
              top: false,
              minimum: const EdgeInsets.only(top: 8),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index < recipes.length) {
                      return RecipeRowItem(
                          index: index,
                          recipe: recipes[index],
                          lastItem: index == recipes.length - 1);
                    }
                    return null;
                  },
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
