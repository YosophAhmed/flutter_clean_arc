import 'dart:async';

import 'package:clean_arc_project/presentation/base/base_view_model.dart';

class LoginViewModel
    implements BaseViewModel, LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();

  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  // Inputs
  @override
  void init() {}

  @override
  void dispose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  void setUserName({
    required String userName,
  }) {}

  @override
  void setPassword({
    required String passWord,
  }) {}

  @override
  void login() {}

  // Outputs
  @override
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream.map(
        (password) => _isPasswordValid(password),
      );

  @override
  Stream<bool> get outIsUserNameValid => _userNameStreamController.stream.map(
        (userName) => _isUserNameValid(userName),
      );

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }
}

abstract class LoginViewModelInputs {
  void setUserName({
    required String userName,
  });
  void setPassword({
    required String passWord,
  });
  void login();

  Sink get inputUserName;
  Sink get inputPassword;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outIsUserNameValid;
  Stream<bool> get outIsPasswordValid;
}
