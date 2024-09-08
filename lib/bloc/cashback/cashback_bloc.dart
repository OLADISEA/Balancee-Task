import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import '../../data/models/cashback_transaction.dart';
import '../../data/shared_preference_helper.dart';
import '../../services/database/cashback_db.dart';
import '../cashback/cashback_event.dart';
import '../cashback/cashback_state.dart';

class CashbackBloc extends Bloc<CashbackEvent, CashbackState> {
  final Isar isar;

  CashbackBloc({required this.isar}) : super(CashbackInitial()) {
    on<LoadAvailableCashbackEvent>(_onLoadAvailableCashback);
  }

  Future<void> _onLoadAvailableCashback(
      LoadAvailableCashbackEvent event,
      Emitter<CashbackState> emit
      ) async {
    emit(CashbackLoading());
    try {

      // Fetch cashback history using the method from CashBackDatabase.
      //This Ensures this method in CashBackDatabase handles
      // the logic of checking and prepopulating the database, then retrieves the cashback history.
      final cashbackHistories = await CashBackDatabase().fetchCashbackHistory();

      // Convert List<CashbackHistory> to List<CashbackTransaction>
      final transactions = cashbackHistories.map((history) {
        return CashbackTransaction(
          id: history.id.toString(),
          amount: history.amountEarned,
          date: history.transactionDate,
          bookingDetails: history.bookingDetails,
          description: history.description,
        );
      }).toList();

      // Fetch initial available cashback from SharedPreferences
      double availableCashback = SharedPreferencesHelper.getAvailableCashback();

      emit(CashbackUpdated(transactions: transactions,newCashbackAmount: availableCashback));
    } catch (e) {
      emit(const CashbackError(message: 'Failed to load available cashback.'));
    }
  }


}
