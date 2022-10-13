import 'package:bloc_network/bloc/user_bloc.dart';
import 'package:bloc_network/services/user_api_provider.dart';
import 'package:bloc_network/services/users_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/action_buttons.dart';
import '../widgets/user_list.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final usersRepository = UsersRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(usersRepository: usersRepository),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Users List'),
        ),
        body: Column(children: [
          Expanded(child: UserList()),
          ActionButtons(),
        ]),
      ),
    );
  }
}
