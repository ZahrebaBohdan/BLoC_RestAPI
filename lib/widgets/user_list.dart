import 'package:bloc_network/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserInitial) {
          return Center(child: Text('Empty. Press Load'));
        }
        if (state is UserLoadingState) {
          return Center(child: CircularProgressIndicator(color: Colors.green,));
        }
        if (state is UserErrorState) {
          return Center(child: CircularProgressIndicator(color: Colors.red,));
        }
        if (state is UserLoadedState) {
          return ListView.builder(
            itemCount: state.loadedUser.length,
            itemBuilder: (context, index) => Container(
              color: index % 2 == 0 ? Colors.green[200] : Colors.white,
              child: ListTile(
                leading: Text(
                  'Id: ${state.loadedUser[index].id}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Name: ${state.loadedUser[index].name}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Email: ${state.loadedUser[index].email}',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    Text(
                      'Phone: ${state.loadedUser[index].phone}',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return Center(child: CircularProgressIndicator(color: Colors.amber,));
      },
    );
  }
}
