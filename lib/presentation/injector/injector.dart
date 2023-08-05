import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_app/presentation/injector/injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDepedencies() => getIt.init();
