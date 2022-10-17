import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:deriv_go_clone/features/main/data/model/balance.dart';
import 'package:deriv_go_clone/features/main/domain/usecase/get_account_balance_stream.dart';

part 'balance_state.dart';

class BalanceCubit extends Cubit<BalanceState> {
  final GetBalanceUseCase getBalanceUseCase;

  BalanceCubit(
    this.getBalanceUseCase,
  ) : super(BalanceInitial());

  void getBalanceForUser() {
    emit(BalanceLoading());
    try {
      final stream = getBalanceUseCase();
      stream.listen((event) {
        emit(BalanceLoaded(balance: event));
      });
    } catch (error) {
      emit(BalanceError(errorMessage: error.toString()));
    }
  }
}
