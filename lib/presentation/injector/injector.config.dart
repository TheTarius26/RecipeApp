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

import '../../data/datasource/local/bookmark/bookmark_local_service.dart'
    as _i5;
import '../../data/datasource/remote/dio_client.dart' as _i4;
import '../../data/datasource/remote/recipe/recipe_remote_service.dart' as _i6;
import '../../data/repository/bookmark_repository_impl.dart' as _i8;
import '../../data/repository/recipe_repository_impl.dart' as _i10;
import '../../domain/repository/bookmark_repository.dart' as _i7;
import '../../domain/repository/recipe_repository.dart' as _i9;
import '../../domain/usecase/bookmark/add_bookmark_usecase.dart' as _i14;
import '../../domain/usecase/bookmark/delete_all_bookmark_usecase.dart' as _i11;
import '../../domain/usecase/bookmark/delete_bookmark_usecase.dart' as _i12;
import '../../domain/usecase/bookmark/get_all_bookmark_usecase.dart' as _i13;
import '../../domain/usecase/recipe/get_recipe_by_keyword_usecase.dart' as _i15;
import '../blocs/home/home_bloc.dart' as _i16;

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
    gh.singleton<_i5.BookmarkLocalService>(_i5.BookmarkLocalService());
    gh.singleton<_i6.RecipeRemoteService>(
        _i6.RecipeRemoteService(gh<_i3.Dio>()));
    gh.singleton<_i7.BookmarkRepository>(
        _i8.BookmarkRepositoryImpl(gh<_i5.BookmarkLocalService>()));
    gh.singleton<_i9.RecipeRepository>(
        _i10.RecipeRepositoryImpl(gh<_i6.RecipeRemoteService>()));
    gh.singleton<_i11.DeleteAllBookmarkUseCase>(
        _i11.DeleteAllBookmarkUseCase(gh<_i7.BookmarkRepository>()));
    gh.singleton<_i12.DeleteBookmarkUseCase>(
        _i12.DeleteBookmarkUseCase(gh<_i7.BookmarkRepository>()));
    gh.singleton<_i13.GettAllBookmarkUseCase>(
        _i13.GettAllBookmarkUseCase(gh<_i7.BookmarkRepository>()));
    gh.singleton<_i14.AddBookmarkUseCase>(
        _i14.AddBookmarkUseCase(gh<_i7.BookmarkRepository>()));
    gh.singleton<_i15.GetRecipeByKeywordUseCase>(
        _i15.GetRecipeByKeywordUseCase(gh<_i9.RecipeRepository>()));
    gh.factory<_i16.HomeBloc>(() => _i16.HomeBloc(
          gh<_i15.GetRecipeByKeywordUseCase>(),
          gh<_i13.GettAllBookmarkUseCase>(),
        ));
    return this;
  }
}
