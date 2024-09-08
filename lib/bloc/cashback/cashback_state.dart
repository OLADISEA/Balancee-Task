import 'package:equatable/equatable.dart';
import '../../data/models/cashback_transaction.dart';

abstract class CashbackState extends Equatable {
  const CashbackState();

  @override
  List<Object> get props => [];
}

class CashbackInitial extends CashbackState {}

class CashbackLoading extends CashbackState {}

class CashbackLoaded extends CashbackState {
  final List<CashbackTransaction> transactions;

  const CashbackLoaded({required this.transactions});

  @override
  List<Object> get props => [transactions];
}

class CashbackUpdated extends CashbackState {
  final List<CashbackTransaction> transactions;
  final double newCashbackAmount;
  const CashbackUpdated({required this.transactions, required this.newCashbackAmount});
}

class CashbackError extends CashbackState {
  final String message;

  const CashbackError({required this.message});

  @override
  List<Object> get props => [message];
}
