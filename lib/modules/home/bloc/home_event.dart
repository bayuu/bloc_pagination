import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/modules/home/model/post.dart';
import 'package:login_app/services/end_point.dart';

class HomeEvent {}

abstract class HomeState {}

class HomeUninitialized extends HomeState {}

class HomeLoaded extends HomeState {
  List<ResponsePost>? homes;
  bool? hasReachedMax;

  HomeLoaded({this.homes, this.hasReachedMax});

  HomeLoaded copyWith({List<ResponsePost>? homes, bool? hasReachedMax}) {
    return HomeLoaded(
        homes: homes ?? this.homes,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState? initialState) : super(HomeUninitialized());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    List<ResponsePost>? homes;
    if (state is HomeUninitialized) {
      print('masuk1');
      homes = await EndPoint().getData(0, 10);
      yield HomeLoaded(hasReachedMax: false, homes: homes);
    } else {
      HomeLoaded homeLoaded = state as HomeLoaded;
      homes =
          await EndPoint().getData(homeLoaded.homes!.length, 10);
      // ignore: unnecessary_null_comparison
      yield (homes == null)
          ? homeLoaded.copyWith(hasReachedMax: true)
          : HomeLoaded(
          homes: homeLoaded.homes! + homes, hasReachedMax: false);
    }
  }
}
