import 'package:isar/isar.dart';

part 'cashback_history.g.dart';  // Necessary for code generation

@Collection()
class CashbackHistory {
  Id? id;  // ISAR auto-increment ID field

  @Index()
  late DateTime transactionDate;

  late double amountEarned;

  late String bookingDetails;

  late String description;

  // Constructor
  CashbackHistory({
    required this.transactionDate,
    required this.amountEarned,
    required this.bookingDetails,
    required this.description,
  });
}
