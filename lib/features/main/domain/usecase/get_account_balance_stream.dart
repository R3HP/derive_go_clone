import 'package:deriv_go_clone/features/main/data/model/balance.dart';
import 'package:deriv_go_clone/features/main/domain/repository/deriv_repository.dart';

class GetBalanceUseCase {
  final DerivRepository derivRepository;

  GetBalanceUseCase({
    required this.derivRepository,
  });

  Stream<Balance> call(){
    return derivRepository.getBalanceStream();
  }
}
