abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsBottomNavState extends NewsState {}

class NewsGetbusinessSucsessState extends NewsState {}

class NewsGetbusinessLoadingState extends NewsState {}

class NewsGetbusinessErorrState extends NewsState {
  final String error;

  NewsGetbusinessErorrState(this.error);
}

class NewsGetsportsSucsessState extends NewsState {}

class NewsGetsportsLoadingState extends NewsState {}

class NewsGetsportsErorrState extends NewsState {
  final String error;

  NewsGetsportsErorrState(this.error);
}

class NewsGetscienceSucsessState extends NewsState {}

class NewsGetscienceLoadingState extends NewsState {}

class NewsGetscienceErorrState extends NewsState {
  final String error;

  NewsGetscienceErorrState(this.error);
}

class NewsGetsearchSucsessState extends NewsState {}

class NewsGetsearchLoadingState extends NewsState {}

class NewsGetsearchErorrState extends NewsState {
  final String error;

  NewsGetsearchErorrState(this.error);
}
