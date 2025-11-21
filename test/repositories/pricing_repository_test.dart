import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/repositories/order_repository.dart';

void main() {
  group('PricingRepository', () {
    final pricing = PricingRepository();

    test('calculates total for six-inch sandwiches', () {
      expect(pricing.calculateTotal(quantity: 1, isFootlong: false), 7);
      expect(pricing.calculateTotal(quantity: 2, isFootlong: false), 14);
      expect(pricing.calculateTotal(quantity: 10, isFootlong: false), 70);
    });

    test('calculates total for footlong sandwiches', () {
      expect(pricing.calculateTotal(quantity: 1, isFootlong: true), 11);
      expect(pricing.calculateTotal(quantity: 3, isFootlong: true), 33);
    });

    test('returns 0 for zero or negative quantities', () {
      expect(pricing.calculateTotal(quantity: 0, isFootlong: true), 0);
      expect(pricing.calculateTotal(quantity: -1, isFootlong: false), 0);
    });
  });
}