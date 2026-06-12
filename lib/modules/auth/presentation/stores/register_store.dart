import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = RegisterStoreBase with _$RegisterStore;

abstract class RegisterStoreBase with Store {
  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String phone = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @observable
  bool isPasswordObscured = true;

  @observable
  bool isConfirmPasswordObscured = true;

  @observable
  bool acceptedTerms = false;

  @computed
  bool get passwordsMatch =>
      password.isNotEmpty &&
      confirmPassword.isNotEmpty &&
      password == confirmPassword;

  @computed
  bool get canSubmit =>
      name.isNotEmpty &&
      email.isNotEmpty &&
      phone.isNotEmpty &&
      passwordsMatch &&
      acceptedTerms;

  @action
  void setName(String value) {
    name = value;
  }

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setPhone(String value) {
    phone = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setConfirmPassword(String value) {
    confirmPassword = value;
  }

  @action
  void togglePasswordVisibility() {
    isPasswordObscured = !isPasswordObscured;
  }

  @action
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordObscured = !isConfirmPasswordObscured;
  }

  @action
  void setAcceptedTerms(bool value) {
    acceptedTerms = value;
  }
}
