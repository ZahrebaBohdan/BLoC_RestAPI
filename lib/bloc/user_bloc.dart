import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/user.dart';
import '../services/users_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersRepository usersRepository;
  UserBloc({required this.usersRepository}) : super(UserInitial()) {
    on<UserLoadEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final List<User> _loadedUserList = await usersRepository.getAllUsers();
        emit(UserLoadedState(loadedUser: _loadedUserList));
      } catch (_) {
        print(_);
        emit(UserErrorState());
      }
    });
    on<UserClearEvent>((event, emit) {
      emit(UserInitial());
    });
  }
}
