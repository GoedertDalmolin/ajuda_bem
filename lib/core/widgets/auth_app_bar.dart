import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'ajuda_bem_logo.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppBar({super.key, this.showBackButton = false, this.onBack});

  final bool showBackButton;
  final VoidCallback? onBack;

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: preferredSize.height,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: showBackButton
          ? IconButton(
              onPressed: onBack,
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.primary,
              ),
              tooltip: 'Voltar',
            )
          : null,
      title: const AjudaBemLogo(),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 24),
          child: SvgPicture.asset(
            'assets/icons/notify_icon.svg',
            width: 32,
            height: 32,
          ),
        ),
      ],
    );
  }
}
