abstract class SocialAppState {}

class SocialInitialState extends SocialAppState {}

class SocialGetUserErorrState extends SocialAppState {
  final String Error;
  SocialGetUserErorrState(this.Error);
}

class SocialGetUserSucsessState extends SocialAppState {}

class SocialGetUserLoadingState extends SocialAppState {}

class SocialBottomNavState extends SocialAppState {}

class SocialSucsessImagePickermState extends SocialAppState {}

class SocialErorrImagePickerState extends SocialAppState {}

class SocialSucsessImageUploadState extends SocialAppState {}

class SocialNewPostState extends SocialAppState {}

class SocialErrorImageUploadState extends SocialAppState {}

class SocialUpdateUserSucsessState extends SocialAppState {}

class SocialUpdateUserLoadingState extends SocialAppState {}

class SocialUpdateUserErorrState extends SocialAppState {
  final String Error;

  SocialUpdateUserErorrState(this.Error);
}

class SocialErrorCreatePostState extends SocialAppState {
  final String Error;

  SocialErrorCreatePostState(this.Error);
}

class SocialCreatePostSucsessState extends SocialAppState {}

class SocialCreatePostLoadingState extends SocialAppState {}

class SocialSucsessImagePostPickermState extends SocialAppState {}

class SocialErorrImagePostPickerState extends SocialAppState {}

class SocialSucsessImagePostUploadState extends SocialAppState {}
