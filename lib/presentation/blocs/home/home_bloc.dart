import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_app/core/param/recipe_param.dart';
import 'package:recipe_app/core/resource/app_error.dart';
import 'package:recipe_app/core/resource/bloc_status.dart';
import 'package:recipe_app/core/utils/logger.dart';
import 'package:recipe_app/domain/entity/recipe/recipe.dart';
import 'package:recipe_app/domain/usecase/get_recipe_by_keyword.dart';

part 'home_event.dart';
part 'home_state.dart';

@Injectable(order: 4)
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._getRecipeByKeyword,
  ) : super(const HomeState()) {
    on<HomeInitial>(_onInitial);
  }

  final GetRecipeByKeyword _getRecipeByKeyword;

  Future<void> _onInitial(
    HomeInitial event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(status: BlocStatus.loading));
      final result = await _getRecipeByKeyword(
        RecipeParam(
          keyword: 'chicken',
        ),
      );
      loggerDebug(result.recipes.length.toString());
      emit(
        state.copyWith(
          status: BlocStatus.success,
          recipes: result.recipes,
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
