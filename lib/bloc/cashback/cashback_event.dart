import 'package:equatable/equatable.dart';

abstract class CashbackEvent extends Equatable {
  const CashbackEvent();

  @override
  List<Object> get props => [];
}

class LoadAvailableCashbackEvent extends CashbackEvent {}

class LoadCashbackHistory extends CashbackEvent {}


class UpdateCashbackEvent extends CashbackEvent {
  final double newCashbackAmount;
  const UpdateCashbackEvent(this.newCashbackAmount);
}
