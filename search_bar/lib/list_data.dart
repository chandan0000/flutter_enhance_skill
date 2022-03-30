class FoodItem {
  final String title;
  final String category;
  FoodItem({
    required this.title,
    required this.category,
  });
}

List<FoodItem> loadFoodItem(){
  var fi=<FoodItem>[
FoodItem(title: "Chocolate Shake", category: "MilkShakes"),
FoodItem(title: "Hakka Noodles", category: "Chines"),
FoodItem(title: "Samosa", category: "Indian"),
FoodItem(title: "Oreo Shake", category: "MilkShake"),
FoodItem(title: "Chocolate Shake", category: "MilkShakes"),
FoodItem(title: "Chocolate Shake", category: "MilkShakes"),
FoodItem(title: "Chocolate Shake", category: "MilkShakes"),
FoodItem(title: "Chocolate Shake", category: "MilkShakes"),
FoodItem(title: "Chocolate Shake", category: "MilkShakes"),
FoodItem(title: "Chocolate Shake", category: "MilkShakes"),
FoodItem(title: "Chocolate Shake", category: "MilkShakes"),
FoodItem(title: "Chocolate Shake", category: "MilkShakes"),
FoodItem(title: "Chocolate Shake", category: "MilkShakes"),

  ];
  return fi;
}