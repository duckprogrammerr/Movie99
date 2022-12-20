import 'package:bloc/bloc.dart';
import 'package:movie99/features/layout/models/bottom_nav_item.dart';

class LayoutCubit extends Cubit<int> {
  LayoutCubit() : super(0);
  BottomNavItem get currentItem => bottomNavItems[state];

  goToHome() => selectIndex(0);

  selectIndex(int index) => emit(index);
}
