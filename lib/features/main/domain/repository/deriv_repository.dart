import 'package:deriv_go_clone/features/main/data/model/balance.dart';
import 'package:deriv_go_clone/features/main/data/model/tick.dart';

abstract class DerivRepository{
  Stream<List<Tick>> getTicksStream();
  Stream<Balance> getBalanceStream();
}