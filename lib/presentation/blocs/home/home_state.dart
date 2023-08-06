part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  const HomeState({
    this.status = BlocStatus.loading,
    this.message = '',
    this.error,
    this.recipes = const [],
    this.bookmarks = const [],
  });

  final BlocStatus status;
  final String message;
  final Exception? error;
  final List<Recipe> recipes;
  final List<Bookmark> bookmarks;

  HomeState copyWith({
    BlocStatus? status,
    String? message,
    Exception? error,
    List<Recipe>? recipes,
    List<Bookmark>? bookmarks,
  }) {
    return HomeState(
      status: status ?? this.status,
      message: message ?? '',
      error: error,
      recipes: recipes ?? this.recipes,
      bookmarks: bookmarks ?? this.bookmarks,
    );
  }

  @override
  List<Object?> get props => [
        status,
        message,
        error,
        recipes,
        bookmarks,
      ];
}
