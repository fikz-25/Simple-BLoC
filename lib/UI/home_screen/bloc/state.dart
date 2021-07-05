import 'package:simple_bloc/model/user_model.dart';

abstract class HomeState {}

class Initial implements HomeState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class Loading implements HomeState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class UserLoaded implements HomeState {
  final List<Data> datas;

  const UserLoaded(this.datas);

  @override
  List<Object> get props => [datas];

  @override
  bool get stringify => true;
}
