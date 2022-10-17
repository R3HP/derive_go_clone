import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:deriv_go_clone/features/main/data/model/tick.dart';
// import 'package:deriv_go_clone/features/main/domain/usecase/get_account_Balance_Stream.dart';
import 'package:deriv_go_clone/features/main/domain/usecase/get_tick_stream_use_case.dart';

part 'ticks_state.dart';

class TicksCubit extends Cubit<TicksState> {
  final GetTickStreamUseCse getTickStreamUseCse;
  // final GetBalanceUseCase getBalanceUseCase;

  TicksCubit(
    this.getTickStreamUseCse,
    // this.getBalanceUseCase,
  ) : super(TicksInitial());

  void getTicksForSelectedCurrency(){
    emit(TicksLoading());
    try {
      final stream = getTickStreamUseCse();
      stream.listen((event) {
        emit(TicksLoaded(tickList: event));
      });
    } catch (error) {
      emit(TickError(errorMessage: error.toString()));
    }
  }
  

}
