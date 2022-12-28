import 'package:bloc/bloc.dart';

class PageViewCubit extends Cubit<int> {
  PageViewCubit() : super(1);

  changePage(int value) => emit(value);
}
