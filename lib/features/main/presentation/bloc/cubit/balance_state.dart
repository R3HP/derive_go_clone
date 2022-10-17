part of 'balance_cubit.dart';

@immutable
abstract class BalanceState {}

class BalanceInitial extends BalanceState {}

class BalanceLoading extends BalanceState{}

class BalanceLoaded extends BalanceState {
  final Balance balance;
  BalanceLoaded({
    required this.balance,
  });
}

class BalanceError extends BalanceState {
  final String errorMessage;
  BalanceError({
    required this.errorMessage,
  });
}
