abstract class States{}
class InitialState extends States{}
class ChangeBottomNaveState extends States{}
class GetSettingsState extends States{}
class OnErrorSettingsState extends States{}
class ChangeProfileImageSettingsState extends States{}
class ChangeCoverImageSettingsState extends States{}
class LoadingSettingsState extends States{}

class UploadPostSuccessState extends States{}
class DeletePostImageSuccessState extends States{}
class PickPostImageSuccessState extends States{}


class HomeInitState extends States{}
class HomeGetPostsSuccessState extends States{}
class HomeGetPostsErrorState extends States{}