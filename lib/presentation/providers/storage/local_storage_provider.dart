import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/datasources/isar_datasource.dart';
import '../../../infrastructure/repositories/local_storage_repository_impl.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(IsarDataSource());
});
