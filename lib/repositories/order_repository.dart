/// PricingRepository calculates order totals based on sandwich size and quantity.
class PricingRepository {
  /// Price (in GBP) for a six-inch sandwich.
  static const int sixInchPrice = 7;

  /// Price (in GBP) for a footlong sandwich.
  static const int footlongPrice = 11;

  const PricingRepository();

  /// Calculate the total price (in GBP) for the given [quantity].
  ///
  /// If [isFootlong] is true the footlong price is used; otherwise the
  /// six-inch price is used.
  int calculateTotal({required int quantity, required bool isFootlong}) {
    if (quantity <= 0) return 0;
    final unit = isFootlong ? footlongPrice : sixInchPrice;
    return unit * quantity;
  }
}

class OrderRepository {
  int _quantity = 0;
  final int maxQuantity;

  OrderRepository({required this.maxQuantity});

  int get quantity => _quantity;

  bool get canIncrement => _quantity < maxQuantity;
  bool get canDecrement => _quantity > 0;

  void increment() {
    if (canIncrement) {
      _quantity++;
    }
  }

  void decrement() {
    if (canDecrement) {
      _quantity--;
    }
  }
}