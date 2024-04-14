import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/locale/presentation/locale_provider.dart';

typedef LocaleWidgetBuilder = Widget Function(
    BuildContext context, Locale locale);

class LocaleBuilder extends StatefulWidget {
  const LocaleBuilder({required this.builder, super.key});

  final LocaleWidgetBuilder builder;

  @override
  State<LocaleBuilder> createState() => _LocaleBuilderState();
}

class _LocaleBuilderState extends State<LocaleBuilder> {
  late final ValueListenable<Locale> _localeListenable;

  @override
  void initState() {
    super.initState();
    _localeListenable = LocaleProvider.of(context).locale;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _localeListenable,
        builder: (context, locale, _) => widget.builder(context, locale));
  }
}
