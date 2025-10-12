enum DeliveryMethod { delivery, pickup }

class Address {
  final String street;
  final String city;
  final String zipCode;

  Address({required this.street, required this.city, required this.zipCode});
}

class Order {

  final Map<String, int> products;
  final DeliveryMethod deliveryMethod;
  final Address? deliveryAddress;
  final Map<String, double> catalog; // reference to product catalog

  Order({
    required this.products,
    required this.deliveryMethod,
    required this.catalog,
    this.deliveryAddress,
  });

  double computeTotal() {
    double total = 0;

    products.forEach((name, quantity) {
      double? price = catalog[name];
      if (price != null) {
        total += price * quantity;
      }
    });

    if (deliveryMethod == DeliveryMethod.delivery) {
      total += 5.0; // delivery fee
    }

    return total;
  }
}

void main() {
  Map<String, double> catalog = {
    "Apple": 2.0,
    "Banana": 1.5,
  };

  var myAddress = Address(street: "123 Main St", city: "Phnom Penh", zipCode: "12000");

  // Order with delivery
  var order1 = Order(
    products: {"Apple": 5, "Banana": 3}, 
    deliveryMethod: DeliveryMethod.delivery,
    deliveryAddress: myAddress,
    catalog: catalog,
  );

  // Order pickup
  var order2 = Order(
    products: {"Apple": 5},
    deliveryMethod: DeliveryMethod.pickup,
    catalog: catalog,
  );

  print("Order1 total: \$${order1.computeTotal()}"); // 5*2 + 3*1.5 + 5 = 18.5
  print("Order2 total: \$${order2.computeTotal()}"); // 5*2 = 10
}


