import 'dart:async';

import 'package:clean_arc_project/domain/use_cases/login_usecase.dart';
import 'package:clean_arc_project/presentation/base/base_view_model.dart';

import '../../common/freezed_data_classes.dart';

class LoginViewModel
    implements BaseViewModel, LoginViewModelInputs, LoginViewModelOutputs {

  LoginViewModel();

  // LoginViewModel(
  //   this._loginUseCase,
  // );

  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();

  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  final StreamController _loginButtonStreamController =
      StreamController<void>.broadcast();

  var loginObject = LoginObject(
    '',
    '',
  );

  // final LoginUseCase _loginUseCase;

  // Inputs
  @override
  void init() {}

  @override
  void dispose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
    _loginButtonStreamController.close();
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputAreInputsValid => _loginButtonStreamController.sink;

  @override
  void setUserName({
    required String userName,
  }) {
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(
      userName: userName,
    );
    inputAreInputsValid.add(null);
  }

  @override
  void setPassword({
    required String passWord,
  }) {
    inputPassword.add(passWord);
    loginObject = loginObject.copyWith(
      password: passWord,
    );
    inputAreInputsValid.add(null);
  }

  @override
  Future<void> login() async {
    // (await _loginUseCase.execute(
    //   input: LoginUseCaseInput(
    //     loginObject.userName,
    //     loginObject.password,
    //   ),
    // ))
    //     .fold(
    //   (failure) => {},
    //   (data) => {},
    // );
  }

  // Outputs
  @override
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream.map(
        (password) => _isPasswordValid(password),
      );

  @override
  Stream<bool> get outIsUserNameValid => _userNameStreamController.stream.map(
        (userName) => _isUserNameValid(userName),
      );

  @override
  Stream<bool> get outAreInputsValid => _loginButtonStreamController.stream.map(
        (_) => _areAlInputsValid(),
      );

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }

  bool _areAlInputsValid() {
    return _isUserNameValid(
          loginObject.userName,
        ) &&
        _isPasswordValid(
          loginObject.password,
        );
  }
}

abstract class LoginViewModelInputs {
  void setUserName({
    required String userName,
  });
  void setPassword({
    required String passWord,
  });
  Future<void> login();

  Sink get inputUserName;
  Sink get inputPassword;
  Sink get inputAreInputsValid;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outIsUserNameValid;
  Stream<bool> get outIsPasswordValid;
  Stream<void> get outAreInputsValid;
}
