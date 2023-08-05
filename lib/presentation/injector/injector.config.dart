// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource/remote/dio_client.dart' as _i4;
import '../../data/datasource/remote/recipe/recipe_remote_service.dart' as _i5;
import '../../data/repository/recipe_repository_impl.dart' as _i7;
import '../../domain/repository/recipe_repository.dart' as _i6;
import '../../domain/usecase/get_recipe_by_keyword.dart' as _i8;
import '../blocs/home/home_bloc.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.Dio>(_i4.DioClient());
    gh.singleton<_i5.RecipeRemoteService>(
        _i5.RecipeRemoteService(gh<_i3.Dio>()));
    gh.singleton<_i6.RecipeRepository>(
        _i7.RecipeRepositoryImpl(gh<_i5.RecipeRemoteService>()));
    gh.singleton<_i8.GetRecipeByKeyword>(
        _i8.GetRecipeByKeyword(gh<_i6.RecipeRepository>()));
    gh.factory<_i9.HomeBloc>(() => _i9.HomeBloc(gh<_i8.GetRecipeByKeyword>()));
    return this;
  }
}
