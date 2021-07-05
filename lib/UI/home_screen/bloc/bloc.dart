import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc/UI/home_screen/bloc/event.dart';
import 'package:simple_bloc/UI/home_screen/bloc/state.dart';
import 'package:simple_bloc/model/user_model.dart';
import 'package:simple_bloc/repository/user_repositoryl.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserRepository userRepository;
  HomeBloc(this.userRepository) : super(Initial());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetAll) {
      yield* _getAllUsers();
      List<Data> data = await userRepository.getUser();
      yield UserLoaded(data);
    }
  }

  Stream<HomeState> _getAllUsers() async* {
    try {
      yield Loading();
    } catch (e) {
      print(e);
    }
  }
}
