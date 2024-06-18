import 'package:client/features/auth/model/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_viewmodel.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  @override
  AsyncValue<userModel>? build() {
    return null;
  }
  Future<void> signUpUser({
    required String name,
    required String email,
    required String password,
  })async{
    
  }
}
