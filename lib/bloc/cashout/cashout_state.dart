import 'package:equatable/equatable.dart';

abstract class CashoutState extends Equatable {
  const CashoutState();

  @override
  List<Object> get props => [];
}

class CashoutInitial extends CashoutState {}

class CashoutInProgress extends CashoutState {}

class CashoutSuccess extends CashoutState {
  final double amount;
  final String method; // "direct" or "promo"

  const CashoutSuccess({required this.amount, required this.method});

  @override
  List<Object> get props => [amount, method];
}

class CashoutFailure extends CashoutState {
  final String message;

  const CashoutFailure({required this.message});

  @override
  List<Object> get props => [message];
}
