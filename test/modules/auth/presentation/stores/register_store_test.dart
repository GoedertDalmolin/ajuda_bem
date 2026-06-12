import 'package:ajuda_bem/modules/auth/presentation/stores/register_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart';

void main() {
  group('RegisterStore', () {
    test('starts with empty fields and disabled submit', () {
      final store = RegisterStore();

      expect(store.name, isEmpty);
      expect(store.email, isEmpty);
      expect(store.phone, isEmpty);
      expect(store.password, isEmpty);
      expect(store.confirmPassword, isEmpty);
      expect(store.acceptedTerms, isFalse);
      expect(store.isPasswordObscured, isTrue);
      expect(store.isConfirmPasswordObscured, isTrue);
      expect(store.passwordsMatch, isFalse);
      expect(store.canSubmit, isFalse);
    });

    test('updates all form fields', () {
      final store = RegisterStore();

      store.setName('Instituto Esperança');
      store.setEmail('contato@instituto.org');
      store.setPhone('(11) 99999-9999');
      store.setPassword('123456');
      store.setConfirmPassword('123456');
      store.setAcceptedTerms(true);

      expect(store.name, 'Instituto Esperança');
      expect(store.email, 'contato@instituto.org');
      expect(store.phone, '(11) 99999-9999');
      expect(store.password, '123456');
      expect(store.confirmPassword, '123456');
      expect(store.acceptedTerms, isTrue);
    });

    test('enables submit when required fields are valid', () {
      final store = _validStore();

      expect(store.passwordsMatch, isTrue);
      expect(store.canSubmit, isTrue);
    });

    test('keeps submit disabled when name is missing', () {
      final store = _validStore()..setName('');

      expect(store.canSubmit, isFalse);
    });

    test('keeps submit disabled when email is missing', () {
      final store = _validStore()..setEmail('');

      expect(store.canSubmit, isFalse);
    });

    test('keeps submit disabled when phone is missing', () {
      final store = _validStore()..setPhone('');

      expect(store.canSubmit, isFalse);
    });

    test('keeps submit disabled when terms are not accepted', () {
      final store = _validStore()..setAcceptedTerms(false);

      expect(store.canSubmit, isFalse);
    });

    test('keeps submit disabled when passwords do not match', () {
      final store = _validStore()..setConfirmPassword('654321');

      expect(store.passwordsMatch, isFalse);
      expect(store.canSubmit, isFalse);
    });

    test('keeps passwordsMatch false while one password field is empty', () {
      final store = RegisterStore();

      store.setPassword('123456');
      expect(store.passwordsMatch, isFalse);

      store.setPassword('');
      store.setConfirmPassword('123456');
      expect(store.passwordsMatch, isFalse);
    });

    test('toggles password visibility controls', () {
      final store = RegisterStore();

      store.togglePasswordVisibility();
      store.toggleConfirmPasswordVisibility();

      expect(store.isPasswordObscured, isFalse);
      expect(store.isConfirmPasswordObscured, isFalse);
    });

    test('reacts when terms acceptance changes submit availability', () {
      final store = _validStore()..setAcceptedTerms(false);
      final values = <bool>[];
      final dispose = autorun((_) => values.add(store.canSubmit));

      store.setAcceptedTerms(true);
      store.setAcceptedTerms(false);

      dispose();

      expect(values, [false, true, false]);
    });
  });
}

RegisterStore _validStore() {
  return RegisterStore()
    ..setName('Instituto Esperança')
    ..setEmail('contato@instituto.org')
    ..setPhone('(11) 99999-9999')
    ..setPassword('123456')
    ..setConfirmPassword('123456')
    ..setAcceptedTerms(true);
}
