import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/model/meal_categorey.dart';

class FoodData {
  final String title;
  final String id;
  final Color color;
  final String description; // New property for description

  const FoodData({
    required this.title,
    required this.id,
    required this.color,
    required this.description,
  });
}

const availableCategories = [
  FoodCategory(
    title: 'Italian Cuisine',
    id: 'c1',
    color: Color(0XFFfc5c65),
    description: 'Delicious pasta and pizza dishes',
  ),
  FoodCategory(
    title: 'Asian Delights',
    id: 'c2',
    color: Color(0XFF45aaf2),
    description: 'Exotic flavors from Asia',
  ),
  FoodCategory(
    title: 'Mediterranean Flavors',
    id: 'c3',
    color: Color(0XFF26de81),
    description: 'Fresh and healthy Mediterranean dishes',
  ),
  FoodCategory(
    title: 'American Classics',
    id: 'c4',
    color: Color(0XFF778ca3),
    description: 'All-time favorite American comfort foods',
  ),
  FoodCategory(
    title: 'Mexican Fiesta',
    id: 'c5',
    color: Color(0XFFFC427B),
    description: 'Spicy and vibrant Mexican dishes',
  ),
  FoodCategory(
    title: 'Vegetarian & Vegan Fare',
    id: 'c6',
    color: Color(0XFFfed330),
    description: 'Plant-based and nutritious choices',
  ),
  FoodCategory(
    title: 'Indulgent Desserts',
    id: 'c7',
    color: Color(0XFFa55eea),
    description: 'Decadent sweet treats for dessert lovers',
  ),
  FoodCategory(
    title: 'Healthy & Fit',
    id: 'c8',
    color: Color(0XFF2bcbba),
    description: 'Nutritious and balanced meal options',
  ),
];

const List<Meal> dummyMeals = [
  Meal(
    id: 'm1',
    categories: ['Italian Cuisine', 'Asian Delights'],
    title: 'Spaghetti with Tomato Sauce',
    description: 'Classic Italian pasta with sauce.',
    imageUrl:
        'https://images.unsplash.com/photo-1622973536968-3ead9e780960?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
    ingredients: [
      '4 Tomatoes',
      '1 Tablespoon of Olive Oil',
      '1 Onion',
      '250g Spaghetti',
      'Spices',
      'Cheese (optional)'
    ],
    steps: [
      'Boil salted water. Blanch and peel tomatoes. Chop.',
      'Sauté onion in olive oil until translucent.',
      'Add chopped tomatoes, juices, and spices. Simmer sauce.',
      'Cook spaghetti. Drain.',
      'Serve sauce over spaghetti. Optional: Add cheese on top.',
    ],
    duration: 20,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: false,
    isLactoseFree: true,
    isVegan: false,
    isVegetarian: false,
  ),
  // Meal 2
  Meal(
    id: 'm2',
    categories: ['Asian Delights'],
    title: 'Sushi Platter',
    description: 'Exquisite platter of fresh sushi.',
    imageUrl:
        'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
    ingredients: [
      'Fresh Salmon',
      'Tuna',
      'Avocado',
      'Sushi Rice',
      'Nori Seaweed',
      'Soy Sauce',
      'Wasabi',
      'Pickled Ginger',
    ],
    steps: [
      'Prepare sushi rice following package instructions.',
      'Slice fish and avocado into thin strips.',
      'Lay nori on a bamboo mat. Spread rice on top.',
      'Add fish and avocado. Roll tightly using the mat.',
      'Cut the roll into bite-sized pieces and serve with soy sauce, wasabi, and pickled ginger.',
    ],
    duration: 30,
    complexity: Complexity.hard,
    affordability: Affordability.luxurious,
    isGlutenFree: false,
    isLactoseFree: true,
    isVegan: false,
    isVegetarian: false,
  ),
  // Meal 3
  Meal(
    id: 'm3',
    categories: ['Italian Cuisine', 'Healthy & Fit'],
    title: 'Caprese Salad',
    description: 'Refreshing and healthy Italian salad.',
    imageUrl:
        'https://images.unsplash.com/photo-1579178404017-47844de5ca6a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
    ingredients: [
      '3 Tomatoes',
      '1 cup of Fresh Mozzarella Cheese',
      '1/2 cup of Fresh Basil Leaves',
      'Balsamic Glaze',
      'Olive Oil',
      'Salt and Pepper',
    ],
    steps: [
      'Slice tomatoes and mozzarella cheese.',
      'Arrange them on a plate with fresh basil leaves.',
      'Drizzle with balsamic glaze and olive oil.',
      'Season with salt and pepper.',
    ],
    duration: 15,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: true,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: true,
  ),
  // Meal 4
  Meal(
    id: 'm4',
    categories: ['American Classics'],
    title: 'Classic Cheeseburger',
    description: 'Refreshing and healthy Italian salad.',
    imageUrl:
        'https://images.unsplash.com/photo-1572802419224-296b0aeee0d9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=815&q=80',
    ingredients: [
      '1/4 lb Ground Beef',
      '1 Hamburger Bun',
      '1 Slice of Cheese',
      'Lettuce',
      'Tomato',
      'Onion',
      'Ketchup',
      'Mustard',
      'Pickles',
    ],
    steps: [
      'Preheat grill or stovetop pan.',
      'Form ground beef into a patty and cook until desired doneness.',
      'Toast hamburger bun on the grill or pan.',
      'Assemble the burger with lettuce, tomato, onion, and pickles.',
      'Add cheese and condiments. Serve with fries or chips.',
    ],
    duration: 20,
    complexity: Complexity.challenging,
    affordability: Affordability.affordable,
    isGlutenFree: false,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: false,
  ),
  // Meal 5
  Meal(
    id: 'm5',
    categories: ['Mediterranean Flavors'],
    description: 'Authentic Spanish saffron-infused rice dish.',
    title: 'Paella',
    imageUrl:
        'https://images.unsplash.com/photo-1515443961218-a51367888e4b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
    ingredients: [
      '1 cup Arborio Rice',
      '1/2 lb Chicken Thighs',
      '1/2 lb Shrimp',
      '1 Chorizo Sausage',
      '1 Onion',
      '2 Tomatoes',
      '1 Red Bell Pepper',
      '1 cup Green Peas',
      '3 cups Chicken Broth',
      'Saffron Threads',
      'Paprika',
      'Garlic',
      'Olive Oil',
    ],
    steps: [
      'In a large pan, sauté chopped onions and garlic in olive oil.',
      'Add chopped tomatoes, red bell pepper, and chorizo.',
      'Stir in Arborio rice, saffron, and paprika.',
      'Pour chicken broth and let it simmer until rice is cooked.',
      'Add chicken thighs, shrimp, and green peas. Cook until chicken is fully cooked and shrimp turns pink.',
    ],
    duration: 45,
    complexity: Complexity.hard,
    affordability: Affordability.pricey,
    isGlutenFree: false,
    isLactoseFree: true,
    isVegan: false,
    isVegetarian: false,
  ),
  // Meal 6
  Meal(
    id: 'm6',
    categories: ['Mexican Fiesta'],
    title: 'Tandoori Chicken',
    description: 'Deliciously spiced Mexican-style grilled chicken.',
    imageUrl:
        'https://images.unsplash.com/photo-1628294895950-9805252327bc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
    ingredients: [
      '4 Chicken Drumsticks',
      '1 cup of Plain Yogurt',
      '1 Lemon',
      '2 Garlic Cloves',
      '1 inch Ginger',
      '1 tablespoon Tandoori Spice Mix',
      'Salt',
      'Cilantro for garnish',
    ],
    steps: [
      'Make deep cuts in chicken drumsticks.',
      'In a bowl, mix yogurt, lemon juice, crushed garlic, grated ginger, tandoori spice mix, and salt.',
      'Coat chicken with the marinade. Refrigerate for a few hours or overnight.',
      'Preheat the oven to 425°F (220°C). Place marinated chicken on a baking sheet.',
      'Bake for 25-30 minutes or until fully cooked. Garnish with cilantro and serve with naan or rice.',
    ],
    duration: 40,
    complexity: Complexity.challenging,
    affordability: Affordability.luxurious,
    isGlutenFree: true,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: false,
  ),
  // Meal 7
  Meal(
    id: 'm7',
    categories: ['Vegetarian & Vegan Fare'],
    description: 'Flavorful Middle Eastern chickpea patties.',
    title: 'Falafel Wrap',
    imageUrl:
        'https://images.unsplash.com/photo-1547058881-aa0edd92aab3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
    ingredients: [
      '1 cup Chickpeas (soaked)',
      '1/2 Onion',
      '2 Garlic Cloves',
      '1/2 cup Fresh Parsley',
      '1 teaspoon Cumin',
      '1 teaspoon Coriander',
      '1/2 teaspoon Baking Soda',
      'Salt and Pepper',
      'Tahini Sauce',
      'Whole Wheat Wraps',
      'Lettuce',
      'Tomato',
    ],
    steps: [
      'Drain soaked chickpeas and pat them dry.',
      'In a food processor, blend chickpeas, onion, garlic, parsley, cumin, coriander, baking soda, salt, and pepper.',
      'Form the mixture into small balls and flatten them to make patties.',
      'Heat oil in a pan and fry the falafel until crispy and golden brown.',
      'Serve falafel in a whole wheat wrap with lettuce, tomato, and drizzle with tahini sauce.',
    ],
    duration: 35,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: false,
    isLactoseFree: true,
    isVegan: true,
    isVegetarian: true,
  ),
  // Meal 8
  Meal(
    id: 'm8',
    categories: ['Healthy & Fit'],
    title: 'Quinoa Salad',
    description: 'Nutritious and refreshing grain salad.',
    imageUrl:
        'https://images.unsplash.com/photo-1615865417491-9941019fbc00?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
    ingredients: [
      '1 cup Quinoa',
      '1/2 cup Cucumber',
      '1/2 cup Cherry Tomatoes',
      '1/4 cup Red Onion',
      '1/4 cup Fresh Parsley',
      '1/4 cup Feta Cheese',
      '2 tablespoons Olive Oil',
      '1 Lemon',
      'Salt and Pepper',
    ],
    steps: [
      'Rinse quinoa thoroughly and cook according to package instructions.',
      'Dice cucumber, cherry tomatoes, red onion, and chop fresh parsley.',
      'In a large bowl, combine cooked quinoa, chopped vegetables, and crumbled feta cheese.',
      'Drizzle with olive oil and lemon juice. Season with salt and pepper.',
      'Toss everything together until well mixed. Serve chilled.',
    ],
    duration: 25,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: true,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: true,
  ),
//////////////////////////////////////
  Meal(
    id: 'm9',
    categories: ['Mediterranean Flavors'],
    title: 'Greek Salad',
    description: 'A refreshing and healthy Mediterranean salad.',
    imageUrl:
        'https://images.unsplash.com/photo-1529059997568-3d847b1154f0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
    ingredients: [
      'Tomatoes',
      'Cucumbers',
      'Olives',
      'Feta Cheese',
      'Olive Oil',
      'Oregano'
    ],
    steps: [
      'Chop tomatoes, cucumbers, and olives.',
      'Crumble feta cheese over the vegetables.',
      'Drizzle olive oil and sprinkle oregano.',
      'Toss everything together and serve.'
    ],
    duration: 15,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: true,
    isLactoseFree: true,
    isVegan: false,
    isVegetarian: true,
  ),

  Meal(
    id: 'm11',
    categories: ['Italian Cuisine'],
    title: 'Margherita Pizza',
    description:
        'A classic Italian pizza topped with tomatoes and fresh basil.',
    imageUrl:
        'https://images.unsplash.com/photo-1604068549290-dea0e4a305ca?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80',
    ingredients: [
      'Pizza Dough',
      'Tomato Sauce',
      'Mozzarella Cheese',
      'Fresh Basil'
    ],
    steps: [
      'Roll out pizza dough and spread tomato sauce.',
      'Sprinkle mozzarella cheese over the sauce.',
      'Bake in a preheated oven until crust is golden and cheese is melted.',
      'Top with fresh basil leaves before serving.'
    ],
    duration: 30,
    complexity: Complexity.challenging,
    affordability: Affordability.affordable,
    isGlutenFree: false,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: true,
  ),

  Meal(
    id: 'm12',
    categories: ['Mexican Fiesta'],
    title: 'Chicken Tacos',
    description: 'Flavorful chicken-filled tacos with a variety of toppings.',
    imageUrl:
        'https://images.unsplash.com/photo-1570461226513-e08b58a52c53?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=874&q=80',
    ingredients: [
      'Chicken',
      'Taco Shells',
      'Lettuce',
      'Tomato',
      'Onion',
      'Sour Cream',
      'Salsa'
    ],
    steps: [
      'Cook chicken with spices until fully cooked.',
      'Warm taco shells in the oven or on a stovetop.',
      'Assemble tacos with chicken, lettuce, tomato, onion, sour cream, and salsa.',
      'Serve with your favorite sides.'
    ],
    duration: 25,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: false,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: false,
  ),
  Meal(
    id: 'm13',
    categories: ['Vegetarian & Vegan Fare'],
    title: 'Chickpea Curry',
    description: 'A hearty and flavorful chickpea curry.',
    imageUrl:
        'https://images.unsplash.com/photo-1612700722193-f0410adb8949?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
    ingredients: [
      'Chickpeas',
      'Coconut Milk',
      'Spices',
      'Onion',
      'Garlic',
      'Rice'
    ],
    steps: [
      'Sauté onion and garlic until fragrant.',
      'Add chickpeas, coconut milk, and spices. Simmer until flavors meld.',
      'Cook rice separately.',
      'Serve chickpea curry over rice.'
    ],
    duration: 35,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: true,
    isLactoseFree: true,
    isVegan: true,
    isVegetarian: true,
  ),

  Meal(
    id: 'm14',
    categories: ['Indulgent Desserts'],
    title: 'Chocolate Lava Cake',
    description: 'Decadent chocolate lava cake with a molten center.',
    imageUrl:
        'https://images.unsplash.com/photo-1673551490812-eaee2e9bf0ef?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
    ingredients: [
      'Dark Chocolate',
      'Butter',
      'Eggs',
      'Flour',
      'Sugar',
      'Vanilla'
    ],
    steps: [
      'Melt chocolate and butter together.',
      'Whisk eggs, sugar, and vanilla until creamy.',
      'Combine melted chocolate with egg mixture.',
      'Fold in flour and divide batter into ramekins.',
      'Bake until edges are set but center is still gooey.'
    ],
    duration: 30,
    complexity: Complexity.challenging,
    affordability: Affordability.pricey,
    isGlutenFree: false,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: true,
  ),

  Meal(
    id: 'm15',
    categories: ['Healthy & Fit'],
    title: 'Grilled Salmon',
    description: 'Healthy grilled salmon fillet with lemon and herbs.',
    imageUrl:
        'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
    ingredients: [
      'Salmon Fillet',
      'Lemon',
      'Herbs',
      'Olive Oil',
      'Salt',
      'Pepper'
    ],
    steps: [
      'Season salmon fillet with salt, pepper, and herbs.',
      'Drizzle with olive oil and squeeze lemon juice over it.',
      'Grill on medium heat until salmon flakes easily with a fork.',
      'Serve with steamed vegetables.'
    ],
    duration: 20,
    complexity: Complexity.simple,
    affordability: Affordability.pricey,
    isGlutenFree: true,
    isLactoseFree: true,
    isVegan: false,
    isVegetarian: false,
  ),

  Meal(
    id: 'm17',
    categories: ['Vegetarian & Vegan Fare'],
    title: 'Vegan Pad Thai',
    description: 'A vegan version of the classic Pad Thai dish.',
    imageUrl:
        'https://images.unsplash.com/photo-1675150277436-9c7348972c11?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=864&q=80',
    ingredients: [
      'Rice Noodles',
      'Tofu',
      'Vegetables',
      'Peanuts',
      'Tamarind Sauce',
      'Sriracha'
    ],
    steps: [
      'Soak rice noodles until softened and drain.',
      'Sauté tofu and vegetables until cooked.',
      'Add cooked noodles, tamarind sauce, and sriracha.',
      'Toss everything together until well combined.',
      'Garnish with crushed peanuts and lime wedges.'
    ],
    duration: 30,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: true,
    isLactoseFree: true,
    isVegan: true,
    isVegetarian: true,
  ),
  Meal(
    id: 'm18',
    categories: ['American Classics'],
    title: 'Macaroni and Cheese',
    description: 'Classic comfort food: creamy macaroni and cheese.',
    imageUrl:
        'https://images.unsplash.com/photo-1555949258-eb67b1ef0ceb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
    ingredients: [
      'Elbow Macaroni',
      'Cheddar Cheese',
      'Milk',
      'Butter',
      'Flour',
      'Bread Crumbs'
    ],
    steps: [
      'Boil macaroni according to package instructions.',
      'Make a cheese sauce with milk, butter, flour, and cheddar cheese.',
      'Combine cooked macaroni with cheese sauce.',
      'Transfer to a baking dish, top with bread crumbs, and bake until golden.'
    ],
    duration: 45,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: false,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: true,
  ),

  Meal(
    id: 'm20',
    categories: ['Italian Cuisine'],
    title: 'Chicken Parmesan',
    description:
        'Italian classic: breaded and fried chicken topped with marinara and cheese.',
    imageUrl:
        'https://images.unsplash.com/photo-1632778149955-e80f8ceca2e8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
    ingredients: [
      'Chicken Breast',
      'Breadcrumbs',
      'Parmesan Cheese',
      'Marinara Sauce',
      'Mozzarella Cheese',
      'Pasta'
    ],
    steps: [
      'Dredge chicken in breadcrumbs and parmesan cheese.',
      'Fry chicken until golden brown and cooked through.',
      'Top with marinara sauce and mozzarella cheese.',
      'Bake until cheese is melted and bubbly.',
      'Serve over cooked pasta.'
    ],
    duration: 50,
    complexity: Complexity.challenging,
    affordability: Affordability.affordable,
    isGlutenFree: false,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: false,
  ),
];
