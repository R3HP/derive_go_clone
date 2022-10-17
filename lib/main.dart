import 'package:deriv_go_clone/features/main/data/datasource/deriv_data_source.dart';
import 'package:deriv_go_clone/features/main/data/repository/deriv_repostitory_impl.dart';
import 'package:deriv_go_clone/features/main/domain/usecase/get_account_balance_stream.dart';
import 'package:deriv_go_clone/features/main/domain/usecase/get_tick_stream_use_case.dart';
import 'package:deriv_go_clone/features/main/presentation/bloc/cubit/balance_cubit.dart';
import 'package:deriv_go_clone/features/main/presentation/bloc/cubit/ticks_cubit.dart';
import 'package:deriv_go_clone/features/main/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => BalanceCubit(GetBalanceUseCase(
                derivRepository:
                    DerivRepositoryImpl(dataSource: DerivDataSourceImpl())))),
        BlocProvider(
            create: (context) => TicksCubit(GetTickStreamUseCse(
                derivRepository:
                    DerivRepositoryImpl(dataSource: DerivDataSourceImpl())))),
      ],
      
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: const AppBarTheme(color: Colors.black)),
        home: const HomeScreen(),
        
      ),
    );
  }
}
