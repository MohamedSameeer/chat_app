abstract class LoginStates{}

class LoginInitState extends LoginStates{}
class LoginChangePasswordState extends LoginStates{}
class LoginSuccessState extends LoginStates{
}
class LoginLoadingState extends LoginStates {}
class LoginErrorState extends LoginStates{}