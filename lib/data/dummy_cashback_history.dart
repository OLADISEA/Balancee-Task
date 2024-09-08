import 'models/cashback_history.dart';

List<CashbackHistory> getDummyCashbackHistory() {
  return [
    CashbackHistory(
      transactionDate: DateTime.now().subtract(const Duration(days: 1)),
      amountEarned: 15.50,
      bookingDetails: 'Booking #12345',
      description: 'Hotel stay cashback',
    ),
    CashbackHistory(
      transactionDate: DateTime.now().subtract(const Duration(days: 3)),
      amountEarned: 10.00,
      bookingDetails: 'Booking #67890',
      description: 'Flight cashback',
    ),
    CashbackHistory(
      transactionDate: DateTime.now().subtract(const Duration(days: 5)),
      amountEarned: 7.75,
      bookingDetails: 'Booking #23456',
      description: 'Restaurant cashback',
    ),
    CashbackHistory(
      transactionDate: DateTime.now().subtract(const Duration(days: 7)),
      amountEarned: 20.00,
      bookingDetails: 'Booking #34567',
      description: 'Car rental cashback',
    ),
    CashbackHistory(
      transactionDate: DateTime.now().subtract(const Duration(days: 10)),
      amountEarned: 12.30,
      bookingDetails: 'Booking #45678',
      description: 'Train ticket cashback',
    ),
    CashbackHistory(
      transactionDate: DateTime.now().subtract(const Duration(days: 15)),
      amountEarned: 8.50,
      bookingDetails: 'Booking #56789',
      description: 'Grocery store cashback',
    ),
    CashbackHistory(
      transactionDate: DateTime.now().subtract(const Duration(days: 20)),
      amountEarned: 14.60,
      bookingDetails: 'Booking #67890',
      description: 'Online shopping cashback',
    ),
    CashbackHistory(
      transactionDate: DateTime.now().subtract(const Duration(days: 25)),
      amountEarned: 6.20,
      bookingDetails: 'Booking #78901',
      description: 'Movie tickets cashback',
    ),
    CashbackHistory(
      transactionDate: DateTime.now().subtract(const Duration(days: 30)),
      amountEarned: 25.00,
      bookingDetails: 'Booking #89012',
      description: 'Vacation package cashback',
    ),
    CashbackHistory(
      transactionDate: DateTime.now().subtract(const Duration(days: 35)),
      amountEarned: 18.75,
      bookingDetails: 'Booking #90123',
      description: 'Electronics purchase cashback',
    ),
  ];
}
