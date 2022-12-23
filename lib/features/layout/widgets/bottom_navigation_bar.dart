import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie99/core/extensions/context_extension.dart';
import 'package:movie99/features/layout/cubit/layout_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie99/features/layout/models/bottom_nav_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    LayoutCubit layoutCubit = context.read<LayoutCubit>();

    return BlocBuilder<LayoutCubit, int>(
      builder: (context, state) {
        return SizedBox(
          width: context.w,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (var i = 0; i < bottomNavItems.length; i++) ...{
                SizedBox(
                  width: context.w / 4 - 20,
                  child: InkWell(
                    onTap: () => layoutCubit.selectIndex(i),
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: SvgPicture.asset(
                      layoutCubit.state == i
                          ? bottomNavItems[i].activeIcon
                          : bottomNavItems[i].defaultIcon,
                    ),
                  ),
                ),
              },
            ],
          ),
        );
      },
    );
  }
}
