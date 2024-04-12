import 'package:flutter/cupertino.dart';
import 'package:photostock/common/utils/disposable_object/disposable_object.dart';
import 'package:photostock/common/utils/disposable_object/i_disposable_object.dart';
import 'package:photostock/features/app/di/app_scope.dart';
import 'package:photostock/features/locale/data/repository/locale_repository.dart';
import 'package:photostock/features/locale/domain/repository/i_locale_repository.dart';
import 'package:photostock/persistence/storage/locale_storage/locale_storage.dart';
import 'package:provider/provider.dart';

final class LocaleScope extends DisposableObject implements ILocaleScope {
  @override
  ILocaleRepository repository;

  factory LocaleScope.create(BuildContext context) {
    final appScope = context.read<IAppScope>();
    final prefs = appScope.sharedPreferences;
    return LocaleScope(LocaleRepository(LocaleStorage(prefs)));
  }

  LocaleScope(this.repository);
}

abstract interface class ILocaleScope implements IDisposableObject {
  ILocaleRepository get repository;
}
