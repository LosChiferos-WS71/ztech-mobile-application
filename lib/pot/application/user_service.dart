import '../domain/user.dart';
import '../infrastructure/user_repository.dart';

class UserService {
  final UserRepository _userRepository;

  UserService(this._userRepository);

  Future<User> getUser() async {
    return await _userRepository.getUser();
  }
}
