import 'package:deriv_go_clone/features/main/data/datasource/deriv_data_source.dart';
import 'package:deriv_go_clone/features/main/data/model/balance.dart';
import 'package:deriv_go_clone/features/main/data/model/tick.dart';
import 'package:deriv_go_clone/features/main/domain/repository/deriv_repository.dart';
import 'package:flutter/cupertino.dart';

class DerivRepositoryImpl implements DerivRepository {
  final DerivDataSource dataSource;

  DerivRepositoryImpl({
    required this.dataSource,
  });

  @override
  Stream<List<Tick>> getTicksStream() {
    try {
      return dataSource.getDataStreamForSelectedCurrency();
    } catch (error) {
      throw ErrorDescription(error.toString());
    }
  }

  @override
  Stream<Balance> getBalanceStream() {
    try {
      return dataSource.getBalanceStream();
    } catch (error) {
      throw ErrorDescription(error.toString());
    }
  }
}
