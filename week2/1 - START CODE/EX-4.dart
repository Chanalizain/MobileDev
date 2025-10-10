void main() {
  // Map of pizza prices
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };

  // Example order
  const order = ['margherita', 'pepperoni', 'pineapple'];

  // Your code
  
  double total = 0.0;
  bool unknownPizzaFound = false;

  // Iterate over each pizza name in the order list
  for (String pizza in order) {
    
    // Check if the pizza is a key in the pizzaPrices map
    if (pizzaPrices.containsKey(pizza)) {
      total += pizzaPrices[pizza]!;
    } else {
      print('$pizza pizza is not on the menu');
      unknownPizzaFound = true;
      break; 
    }
  }

  if (!unknownPizzaFound) {
    print('Total: \$$total');
  }
}
