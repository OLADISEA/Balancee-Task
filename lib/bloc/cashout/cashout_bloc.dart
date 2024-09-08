import 'package:flutter_bloc/flutter_bloc.dart';

import 'cashout_event.dart';
import 'cashout_state.dart';

class CashoutBloc extends Bloc<CashoutEvent, CashoutState> {
  CashoutBloc() : super(CashoutInitial()) {
    on<CashoutRequest>(_onCashoutRequest);
  }

  Future<void> _onCashoutRequest(
      CashoutRequest event, Emitter<CashoutState> emit) async {
    emit(CashoutInProgress());
    try {
      // Simulate cashout processing
      await Future.delayed(Duration(seconds: 2));

      if (event.amount > 0) {
        emit(CashoutSuccess(amount: event.amount, method: event.method));
      } else {
        throw Exception("Invalid cashout amount");
      }
    } catch (e) {
      emit(CashoutFailure(message: 'Cashout failed: ${e.toString()}'));
    }
  }
}
