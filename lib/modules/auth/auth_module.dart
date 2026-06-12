import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/login_page.dart';
import 'presentation/stores/login_store.dart';

class AuthModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(LoginStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const LoginPage());
  }
}
