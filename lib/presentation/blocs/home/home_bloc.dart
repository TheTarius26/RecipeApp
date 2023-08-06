import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_app/core/param/recipe_param.dart';
import 'package:recipe_app/core/resource/app_error.dart';
import 'package:recipe_app/core/resource/bloc_status.dart';
import 'package:recipe_app/data/datasource/local/type_adapter/bookmark_hive.dart';
import 'package:recipe_app/domain/entity/recipe/recipe.dart';
import 'package:recipe_app/domain/usecase/bookmark/get_all_bookmark_usecase.dart';
import 'package:recipe_app/domain/usecase/recipe/get_recipe_by_keyword_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

@Injectable(order: 4)
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._getRecipeByKeyword,
    this._getAllBookmark,
  ) : super(const HomeState()) {
    on<HomeInitial>(_onInitial);
  }

  final GetRecipeByKeywordUseCase _getRecipeByKeyword;
  final GettAllBookmarkUseCase _getAllBookmark;

  Future<void> _onInitial(
    HomeInitial event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(status: BlocStatus.loading));
      final result = await _getRecipeByKeyword(RecipeParam());
      final bookmarks = await _getAllBookmark();
      emit(
        state.copyWith(
          status: BlocStatus.success,
          recipes: result.recipes,
          bookmarks: bookmarks,
        ),
      );
    } on AppError catch (e) {
      emit(
        state.copyWith(
          status: BlocStatus.error,
          error: e,
        ),
      );
    }
  }
}
