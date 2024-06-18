import 'package:client/features/auth/model/user_model.dart';
import 'package:client/features/auth/repositories/auth_remote_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_viewmodel.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  late AuthRemoteRepository _remoteRepository ; 
  @override
  AsyncValue<userModel>? build() {
    _remoteRepository = AuthRemoteRepository();
    return null;
  }
  Future<void> signUpUser({
    required String name,
    required String email,
    required String password,
  })async{
    state = const  AsyncValue.loading();
    final res = await _remoteRepository.signup(
                      email: email,
                      password: password,
                      name: name);
                  final val = switch (res) {
                    Left(value: final l) => state = AsyncValue.error(l.message,StackTrace.current),
                    Right(value: final r) => state = AsyncValue.data(r),
                  };
                  print(val);
    
  }
  Future<void> loginUser({
    
    required String email,
    required String password,
  })async{
    state = const  AsyncValue.loading();
    final res = await _remoteRepository.login(
                      email: email,
                      password: password,
                      );
                  final val = switch (res) {
                    Left(value: final l) => state = AsyncValue.error(l.message,StackTrace.current),
                    Right(value: final r) => state = AsyncValue.data(r),
                  };
                  print(val);
    
  }
}
