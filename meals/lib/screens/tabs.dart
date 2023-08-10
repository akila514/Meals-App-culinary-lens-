import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/constants/colors.dart';
import 'package:meals/data/meal_data.dart';
import 'package:meals/provider/favourites_provider.dart';
import 'package:meals/screens/home_screen.dart';
import 'package:meals/screens/meals_list_screen.dart';
import 'package:meals/screens/preferences.dart';
import '../provider/filters_provider.dart';
import '../widgets/custom_drawer.dart';

class Tabs extends ConsumerStatefulWidget {
  const Tabs({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TabsState();
  }
}

class _TabsState extends ConsumerState<Tabs> {
  int selectedPageIndex = 0;
  var activeScreenTitle = 'Culinary Lense';

  void _selectScreen(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  void setScreen(String identifire) {
    Navigator.pop(context);

    if (identifire == 'preferences') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const Preferences(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedFilters = ref.watch(filtersProvider);
    final availableMeals = dummyMeals.where((meal) {
      {
        if (selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
          return false;
        }
        if (selectedFilters[Filter.lactosFree]! && !meal.isGlutenFree) {
          return false;
        }
        if (selectedFilters[Filter.vegan]! && !meal.isVegan) {
          return false;
        }
        if (selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }
    }).toList();

    Widget activeScreen = HomeScreen(
      filterdMealList: availableMeals,
    );

    if (selectedPageIndex == 1) {
      final favouriteList = ref.watch(favouritsMealProvider);
      activeScreen = MealsListScreen(
        filteredMeals: availableMeals,
        filteredList: favouriteList,
      );
      activeScreenTitle = 'Favourites';
    }

    if (selectedPageIndex == 0) {
      activeScreen = HomeScreen(
        filterdMealList: availableMeals,
      );
      activeScreenTitle = 'Culinary Lense';
    }
    bool isHome = activeScreenTitle == 'Culinary Lense';
    bool isFav = activeScreenTitle == 'Favourites';

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: isFav ? false : true,
        //automaticallyImplyLeading: isHome || isFav ? false : true,
        centerTitle: isHome || isFav ? true : false,
        title: Text(activeScreenTitle,
            style: isHome
                ? GoogleFonts.comfortaa(
                    fontWeight: FontWeight.bold, color: primaryFontColor)
                : const TextStyle(
                    fontWeight: FontWeight.normal, color: primaryFontColor)),
        actions: [
          isHome
              ? Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications,
                      color: primaryFontColor,
                    ),
                  ),
                )
              : const SizedBox()
        ],
        backgroundColor: backgroundColor,
      ),
      drawer: isHome ? CustomDrawer(onSelectScreen: setScreen) : null,
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: backgroundColor,
        selectedItemColor: const Color.fromARGB(255, 58, 84, 110),
        currentIndex: selectedPageIndex,
        onTap: _selectScreen,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
