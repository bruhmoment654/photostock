import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/settings/presentation/settings_wm.dart';

class SettingsScreen extends ElementaryWidget<ISettingsWM> {
  const SettingsScreen(
      {super.key, WidgetModelFactory wmFactory = defaultSettingsWM})
      : super(wmFactory);

  @override
  Widget build(ISettingsWM wm) {
    final l10n = wm.l10n;
    final theme = wm.theme;
    return Scaffold(
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 80, bottom: 20),
          child: Container(
            decoration: BoxDecoration(
                color: theme.colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.swapThemeSetting,
                        style: theme.textTheme.labelLarge,
                      ),
                      IconButton(
                          onPressed: wm.swapTheme,
                          icon: const Icon(Icons.swap_horiz))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.changeLanguageSetting,
                        style: theme.textTheme.labelLarge,
                      ),
                      IconButton(
                          onPressed: wm.swapLanguage,
                          icon: const Icon(Icons.text_fields))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.clearCacheSetting,
                        style: theme.textTheme.labelLarge,
                      ),
                      IconButton(
                          onPressed: wm.clearCache,
                          icon: const Icon(Icons.delete))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.showDetailsSetting,
                        style: theme.textTheme.labelLarge,
                      ),
                      IconButton(
                          onPressed: wm.showDetails,
                          icon: const Icon(Icons.info))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
