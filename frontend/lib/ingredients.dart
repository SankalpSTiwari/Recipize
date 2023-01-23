import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/recipe.dart';
import 'model/recipe_repository.dart';
import 'recipes.dart';


class IngredientsList extends StatefulWidget {
  List<String> ingredients;

  IngredientsList({Key key, @required this.ingredients}) : super(key: key);

  @override
  _IngredientsListState createState() => _IngredientsListState();
}

class _IngredientsListState extends State<IngredientsList> {
  TextEditingController nameController = TextEditingController();
  List<String> ingredients;

  @override
  void initState() {
    super.initState();
    ingredients = []..addAll(widget.ingredients);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Ingredients", style: TextStyle(fontFamily: 'Abel', fontSize: 25)),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        actions: <Widget>[
        TextButton(
          onPressed: () async {
            var url = "http://192.168.254.13:5000/${ingredients.join(',')}";
            var response = await http.get(Uri.parse(url));
            if (response.statusCode == 200) {
              Map parsed = jsonDecode(response.body);
              List parsedList = parsed["data"];
              List<Recipe> recipes = parsedList.map((re) =>  Recipe.fromJson(jsonDecode(re))).toList();

              var recipeRepo = RecipeRepository();
              recipeRepo.setRecipes(recipes);

              Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Recipes(recipes : recipes)
                    )
              );

            } else {
              // If the server did not return a 200 OK response,
              // then throw an exception.
              throw Exception('Failed to load');
            }
          },
          child: Text("Confirm",
                    style: TextStyle(
                      fontFamily: 'Abel',
                      color: Colors.black)),
          ),
        ],
      ),
      body: Column(children: <Widget>[
        Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = ingredients[index];
                  return Dismissible(
                    key: Key(item),
                    direction: DismissDirection.startToEnd,
                    child: ListTile(
                      title: Text(item),
                      trailing: IconButton(
                        icon: Icon(Icons.delete_forever),
                        onPressed: () {
                          setState(() {
                            ingredients.removeAt(index);
                          });
                        },
                      ),
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        ingredients.removeAt(index);
                      });
                    },
                  );
                })),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
            child: Row(children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Add an ingredient...',
                      ),
                      controller: nameController),
                ),
              ),
              FloatingActionButton(
                  backgroundColor: Colors.amber,
                  child: Icon(Icons.add, color: Colors.black),
                  onPressed: () async {
                    setState(() {
                      FocusScope.of(context).unfocus();
                      ingredients.insert(0, nameController.text);
                      nameController.clear();
                    });
                  })
            ]))
      ]),
    );
  }
}
