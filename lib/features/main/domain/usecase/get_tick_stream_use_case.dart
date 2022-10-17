import 'package:deriv_go_clone/features/main/data/model/tick.dart';
import 'package:deriv_go_clone/features/main/domain/repository/deriv_repository.dart';

class GetTickStreamUseCse {
  final DerivRepository derivRepository;

  GetTickStreamUseCse({
    required this.derivRepository,
  });


  Stream<List<Tick>> call(){
    return derivRepository.getTicksStream();
  }
  



}
