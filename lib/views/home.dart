import 'package:flutter/material.dart';
import 'package:food_recipe/models/recipe.api.dart';
import 'package:food_recipe/models/recipe.dart';
import 'package:food_recipe/views/widgets/recipe_card.dart';
import 'package:food_recipe/views/detail_recipe.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe>? _recipes; // Updated to allow null for initialization
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _recipes = []; // Initialize with an empty list
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe() ?? [];
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text('Food Recipe'),
          ],
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _recipes?.length ?? 0,
              itemBuilder: (context, index) {
                return GestureDetector(
                child: RecipeCard(
                  title: _recipes![index].name,
                  cookTime: _recipes![index].totalTime,
                  rating: _recipes![index].rating.toString(),
                  thumbnailUrl: _recipes![index].images),
                  onTap: () => {
                    Navigator.push(
                        context, MaterialPageRoute(builder:
                        (context) => DetailResep(
                            name: _recipes![index].name,
                            totalTime: _recipes![index].totalTime,
                            rating: _recipes![index].rating.toString(),
                            image: _recipes![index].images,
                            description: _recipes![index].description, 
                        ),)
                    )
                  },
                );
              },
            ),
    );
  }
}
