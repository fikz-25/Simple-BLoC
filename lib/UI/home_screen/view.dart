import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc/UI/home_screen/bloc/bloc.dart';
import 'package:simple_bloc/UI/home_screen/bloc/event.dart';
import 'package:simple_bloc/UI/home_screen/bloc/state.dart';
import 'package:simple_bloc/model/user_model.dart';
import 'package:simple_bloc/repository/user_repositoryl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Data> _userData = [];
  late HomeBloc _homeBloc;

  @override
  void initState() {
    _homeBloc = HomeBloc(UserRepository());
    _fetchUser();
    super.initState();
  }

  void _fetchUser() {
    _homeBloc.add(GetAll());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Simple BLoC"),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        bloc: _homeBloc,
        listener: (context, state) => {
          if (state is UserLoaded) {_userData.addAll(state.datas)}
        },
        builder: (context, state) => Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          child: _userData.isEmpty
              ? _isLoading(state)
              : GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(_userData.length, (i) {
                    return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: MediaQuery.of(context).size.width / 8,
                            backgroundImage: NetworkImage(_userData[i].avatar!),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                              "${_userData[i].firstName!} ${_userData[i].lastName!}")
                        ],
                      ),
                    );
                  }),
                ),
        ),
      ),
    );
  }

  Widget _isLoading(state) {
    if (state is Loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container();
  }
}
