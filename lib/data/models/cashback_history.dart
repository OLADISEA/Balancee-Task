import 'package:isar/isar.dart';

part 'cashback_history.g.dart';  // Necessary for code generation

@Collection()
class CashbackHistory {
  Id? id;  // ISAR auto-increment ID field

  @Index()  // Optional: if you need to index this field for faster queries
  late DateTime transactionDate;  // Use DateTime instead of String

  late double amountEarned;

  late String bookingDetails;

  late String description;  // Add description field

  // Constructor
  CashbackHistory({
    required this.transactionDate,
    required this.amountEarned,
    required this.bookingDetails,
    required this.description,
  });
}
