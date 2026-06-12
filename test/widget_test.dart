import 'package:ajuda_bem/app_module.dart';
import 'package:ajuda_bem/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows login screen content and visual tokens', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ModularApp(module: AppModule(), child: const AppWidget()),
    );

    await tester.pumpAndSettle();

    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('Seja bem-vindo ao AjudaBem!'), findsOneWidget);
    expect(find.text('E-mail:'), findsOneWidget);
    expect(find.text('Senha:'), findsOneWidget);
    expect(find.text('Entrar'), findsOneWidget);
    expect(find.text('Ou'), findsOneWidget);
    expect(find.text('Faça login com o Google'), findsOneWidget);
    expect(find.text('Faça login com o Facebook'), findsOneWidget);
    expect(find.byType(SvgPicture), findsNWidgets(2));
    expect(find.text('Criar conta'), findsOneWidget);
    expect(find.text('Esqueci minha senha'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));

    final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
    expect(scaffold.backgroundColor, const Color(0xFFF3F3F3));

    final welcome = tester.widget<Text>(
      find.text('Seja bem-vindo ao AjudaBem!'),
    );
    expect(welcome.style?.fontFamily, contains('Manrope'));
    expect(welcome.style?.fontSize, 16);
    expect(welcome.style?.fontWeight, FontWeight.w700);
    expect(welcome.style?.letterSpacing, 0);
    expect(welcome.style?.color, const Color(0xFF04957C));

    final enter = tester.widget<Text>(find.text('Entrar'));
    expect(enter.style?.fontFamily, contains('Manrope'));
    expect(enter.style?.fontSize, 16);
    expect(enter.style?.fontWeight, FontWeight.w700);
    expect(enter.style?.color, Colors.white);
  });
}
