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
    "Book": 2.5,
    "Pen": 1,
  };

  var myAddress = Address(street: "Main St", city: "Takhmao", zipCode: "12000");

  // Order with delivery
  var order1 = Order(
    products: {"Book": 5, "Pen": 3}, 
    deliveryMethod: DeliveryMethod.delivery,
    deliveryAddress: myAddress,
    catalog: catalog,
  );

  // Order pickup
  var order2 = Order(
    products: {"Pen": 5},
    deliveryMethod: DeliveryMethod.pickup,
    catalog: catalog,
  );

  print("Order1 total: \$${order1.computeTotal()}"); // 20.5
  print("Order2 total: \$${order2.computeTotal()}"); // 5
}


