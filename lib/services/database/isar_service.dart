import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../data/dummy_cashback_history.dart';
import '../../data/models/cashback_history.dart';

class CashBackDatabase extends ChangeNotifier {
  static late Isar db;

  // Initialize the Isar database and prepopulate it with dummy data
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    db = await Isar.open([CashbackHistorySchema], directory: dir.path);


  }

  // Provide access to the Isar instance
  static Isar getIsarInstance() {
    return db;
  }

  // Dummy cashback history data
  static Future<void> prepopulateData() async {
    final dummyCashbackHistory = getDummyCashbackHistory();

    await db.writeTxn(() async {
      await db.cashbackHistorys.putAll(dummyCashbackHistory);
    });
  }

  // Fetch cashback history from the database
  Future<List<CashbackHistory>> fetchCashbackHistory() async {
    // Check if the cashback history is empty
    final cashbackHistoryCount = await db.cashbackHistorys.count();

    if (cashbackHistoryCount == 0) {
      // If empty, populate the database with dummy cashback history data
      await prepopulateData();
    }

    // Return the list of cashback history
    return await db.cashbackHistorys.where().findAll();
  }


  // Clear the database
  Future<void> clearData() async {
    await db.writeTxn(() async {
      await db.clear();
    });
  }
}
