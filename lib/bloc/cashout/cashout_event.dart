import 'package:equatable/equatable.dart';

abstract class CashoutEvent extends Equatable {
  const CashoutEvent();

  @override
  List<Object> get props => [];
}

class CashoutRequest extends CashoutEvent {
  final double amount;
  final String method; // "direct" or "promo"

  const CashoutRequest({required this.amount, required this.method});

  @override
  List<Object> get props => [amount, method];
}
