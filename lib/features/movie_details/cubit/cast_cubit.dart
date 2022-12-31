import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie99/models/cast.dart';
import 'package:movie99/services/api_service.dart';

part 'cast_state.dart';

class CastCubit extends Cubit<CastState> {
  CastCubit() : super(CastInitial());
  List<Cast> casts = [];

  fetchCastList(int movieId) async {
    emit(CastLoading());
    List<Cast> casts = await ApiService().getMovieCast(movieId);
    emit(CastLoaded(casts: casts));
  }
}
