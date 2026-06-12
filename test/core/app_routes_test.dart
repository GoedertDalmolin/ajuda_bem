import 'package:ajuda_bem/core/routes/app_routes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('auth route is the app entrypoint', () {
    expect(AppRoutes.auth, '/');
    expect(AppRoutes.register, '/register/');
  });
}
