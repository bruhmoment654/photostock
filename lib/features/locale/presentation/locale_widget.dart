import 'package:elementary/elementary.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:photostock/features/locale/presentation/locale_controller.dart';
import 'package:photostock/features/locale/presentation/locale_wm.dart';
import 'package:provider/provider.dart';

class LocaleWidget extends ElementaryWidget<ILocaleWM> {
  const LocaleWidget(
      {required this.child,
      super.key,
      WidgetModelFactory wmFactory = defaultLocaleWMFactory})
      : super(wmFactory);

  /// Child.
  final Widget child;

  @override
  Widget build(ILocaleWM wm) {
    return Provider<LocaleController>.value(
      value: wm,
      child: child,
    );
  }
}
