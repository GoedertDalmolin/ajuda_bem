import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/login_page.dart';
import 'presentation/pages/register_page.dart';
import 'presentation/stores/login_store.dart';
import 'presentation/stores/register_store.dart';

class AuthModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(LoginStore.new);
    i.addSingleton(RegisterStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const LoginPage());
    r.child('/register/', child: (_) => const RegisterPage());
  }
}
