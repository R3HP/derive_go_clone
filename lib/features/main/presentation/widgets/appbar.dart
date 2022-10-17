import 'package:deriv_go_clone/features/main/presentation/bloc/cubit/balance_cubit.dart';
import 'package:deriv_go_clone/features/main/presentation/widgets/user_currency_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<BalanceCubit>().getBalanceForUser();
    return AppBar(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          CircleAvatar(
            radius: 25,
            foregroundImage: Image.asset(
              'assets/images/wallet_2.png',
              fit: BoxFit.cover,
            ).image,
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: BlocBuilder<BalanceCubit, BalanceState>(
              builder: ((context, state) {
                if (state is BalanceLoading) {
                  return const Center(child: CircularProgressIndicator.adaptive());
                } else if (state is BalanceLoaded) {
                  return FittedBox(
                    child: Text(
                      state.balance.balanceAsString+ '    ' + state.balance.currency,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }else if (state is BalanceError){
                  return FittedBox(child: Text(state.errorMessage));
                }else{
                  return const Center(child: CircularProgressIndicator.adaptive());
                }
              }),
            ),
          ),
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) => const UserCurrencyModalBottomSheet());
              },
              icon: const Icon(Icons.expand_more))
        ],
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(Icons.wallet_travel_sharp),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
