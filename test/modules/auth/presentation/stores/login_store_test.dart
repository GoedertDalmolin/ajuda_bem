import 'package:ajuda_bem/modules/auth/presentation/stores/login_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart';

void main() {
  group('LoginStore', () {
    test('starts with empty credentials and obscured password', () {
      final store = LoginStore();

      expect(store.email, isEmpty);
      expect(store.password, isEmpty);
      expect(store.isPasswordObscured, isTrue);
      expect(store.canSubmit, isFalse);
    });

    test('updates email and password values', () {
      final store = LoginStore();

      store.setEmail('ong@ajudabem.com');
      store.setPassword('123456');

      expect(store.email, 'ong@ajudabem.com');
      expect(store.password, '123456');
    });

    test('keeps submit disabled with only email', () {
      final store = LoginStore();

      store.setEmail('ong@ajudabem.com');

      expect(store.canSubmit, isFalse);
    });

    test('keeps submit disabled with only password', () {
      final store = LoginStore();

      store.setPassword('123456');

      expect(store.canSubmit, isFalse);
    });

    test('enables submit when email and password are filled', () {
      final store = LoginStore();

      store.setEmail('ong@ajudabem.com');
      store.setPassword('123456');

      expect(store.canSubmit, isTrue);
    });

    test('disables submit again when a required field is cleared', () {
      final store = LoginStore()
        ..setEmail('ong@ajudabem.com')
        ..setPassword('123456');

      store.setPassword('');

      expect(store.canSubmit, isFalse);
    });

    test('toggles password visibility', () {
      final store = LoginStore();

      store.togglePasswordVisibility();
      expect(store.isPasswordObscured, isFalse);

      store.togglePasswordVisibility();
      expect(store.isPasswordObscured, isTrue);
    });

    test('reacts when submit availability changes', () {
      final store = LoginStore();
      final values = <bool>[];
      final dispose = autorun((_) => values.add(store.canSubmit));

      store.setEmail('ong@ajudabem.com');
      store.setPassword('123456');
      store.setEmail('');

      dispose();

      expect(values, [false, true, false]);
    });
  });
}
