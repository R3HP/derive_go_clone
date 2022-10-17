import 'package:deriv_go_clone/features/main/presentation/bloc/cubit/ticks_cubit.dart';
import 'package:deriv_go_clone/features/main/presentation/widgets/chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChartSection extends StatefulWidget {
  const ChartSection({
    Key? key,
  }) : super(key: key);

  @override
  State<ChartSection> createState() => _ChartSectionState();
}

class _ChartSectionState extends State<ChartSection>
    with SingleTickerProviderStateMixin {
  late TransformationController controller;
  late AnimationController animationController;
  Animation<Matrix4>? animation;

  @override
  void initState() {
    super.initState();
    controller = TransformationController();
    animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 200))
          ..addListener(() => controller.value = animation!.value);

    context.read<TicksCubit>().getTicksForSelectedCurrency();
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      minScale: 1,
      maxScale: 2,
      transformationController: controller,
      child: SizedBox(
        width: double.infinity,
        height: 400,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<TicksCubit, TicksState>(
            builder: (context, state) {
              if (state is TicksLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (state is TicksLoaded) {
                return ListView(scrollDirection: Axis.horizontal, children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width + 50,
                      child: Chart(tickList: state.tickList))
                ]);
              } else if (state is TickError) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else {
                return const Center(
                  child: Text('Unexpected Error'),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  void resetAnimation() {
    animation = Matrix4Tween(begin: controller.value, end: Matrix4.identity())
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.ease));

    animationController.forward(from: 0);
  }
}
