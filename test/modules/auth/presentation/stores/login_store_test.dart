import 'package:ajuda_bem/modules/auth/presentation/stores/login_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('starts with empty credentials and obscured password', () {
    final store = LoginStore();

    expect(store.email, isEmpty);
    expect(store.password, isEmpty);
    expect(store.isPasswordObscured, isTrue);
    expect(store.canSubmit, isFalse);
  });

  test('updates credentials and submit availability', () {
    final store = LoginStore();

    store.setEmail('ong@ajudabem.com');
    expect(store.email, 'ong@ajudabem.com');
    expect(store.canSubmit, isFalse);

    store.setPassword('123456');
    expect(store.password, '123456');
    expect(store.canSubmit, isTrue);
  });

  test('toggles password visibility', () {
    final store = LoginStore();

    store.togglePasswordVisibility();
    expect(store.isPasswordObscured, isFalse);

    store.togglePasswordVisibility();
    expect(store.isPasswordObscured, isTrue);
  });
}
