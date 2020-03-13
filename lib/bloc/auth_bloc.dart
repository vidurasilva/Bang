import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:thousand_bits/bloc/auth_event.dart';
import 'package:thousand_bits/bloc/auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc();

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {}
}
