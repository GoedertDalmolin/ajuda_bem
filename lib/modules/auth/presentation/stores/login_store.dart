import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool isPasswordObscured = true;

  @computed
  bool get canSubmit => email.isNotEmpty && password.isNotEmpty;

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void togglePasswordVisibility() {
    isPasswordObscured = !isPasswordObscured;
  }
}
