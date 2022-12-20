import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie99/features/layout/cubit/layout_cubit.dart';
import 'package:movie99/features/layout/models/bottom_nav_item.dart';
import 'package:movie99/features/layout/widgets/bottom_navigation_bar.dart';

class LayoutLanding extends StatelessWidget {
  const LayoutLanding({super.key});

  @override
  Widget build(BuildContext context) {
    LayoutCubit layoutCubit = context.read<LayoutCubit>();
    return Scaffold(
      body: BlocBuilder<LayoutCubit, int>(
        builder: (context, state) {
          return IndexedStack(
            index: layoutCubit.state,
            children: bottomNavItems.map((e) => e.page).toList(),
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
