import 'package:flutter/cupertino.dart';
import 'package:nested/nested.dart';
import 'package:photostock/common/widgets/di_scope.dart';
import 'package:photostock/features/locale/di/locale_scope.dart';
import 'package:photostock/features/locale/presentation/locale_controller.dart';
import 'package:photostock/features/locale/presentation/locale_widget.dart';
import 'package:provider/provider.dart';

class LocaleProvider extends SingleChildStatelessWidget {
  const LocaleProvider({super.key});

  static LocaleController of(BuildContext context) =>
      Provider.of<LocaleController>(context, listen: false);

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return DiScope<ILocaleScope>(
      onFactory: LocaleScope.create,
      onDispose: (scope) => scope.dispose(),
      child: LocaleWidget(
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}
