import 'package:deriv_go_clone/features/main/data/datasource/deriv_data_source.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  final DerivDataSource dataSource = DerivDataSourceImpl();


  test('get currency stream', (){
    dataSource.getDataStreamForSelectedCurrency();
    // stream.listen((event) {
    //   print(event);
    // });
  });
  
}