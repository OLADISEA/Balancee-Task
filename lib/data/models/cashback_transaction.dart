  class CashbackTransaction {
    final String id;
    final double amount;
    final DateTime date;
    final String bookingDetails;  // Information about the booking that earned the cashback
    final String description;     // Additional details or notes about the transaction

    CashbackTransaction({
      required this.id,
      required this.amount,
      required this.date,
      required this.bookingDetails,
      required this.description,
    });
  }