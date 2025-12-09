// class AuthService {
//   Future<bool> loginCenter(
//     String email,
//     String password,
//     String passcode,
//   ) async {
//     await Future.delayed(Duration(seconds: 1));

//     if (email == 'center@wildhelp.org' &&
//         password == '123456' &&
//         passcode == 'WILDLIFE2025') {
//       return true;
//     }
//     return false;
//   }
// }
class AuthService {
  Future<bool> loginCenter(
    String email,
    String password,
    String passcode,
  ) async {
    await Future.delayed(Duration(seconds: 1));

    if (email.isNotEmpty && password.isNotEmpty && passcode.isNotEmpty) {
      return true; // allow all non-empty values
    }
    return false;
  }
}
