abstract class AppStates{}

class InitialAppState extends AppStates{}

class ChangeIndexScreen extends AppStates{}

class GetBusinessDataSuccess extends AppStates{}

class GetBusinessDataLoading extends AppStates{}

class GetBusinessDataError extends AppStates{
  final String error;
  GetBusinessDataError(this.error);
}

class GetSportsDataSuccess extends AppStates{}

class GetSportsDataLoading extends AppStates{}

class GetSportsDataError extends AppStates{
  final String error;
  GetSportsDataError(this.error);
}

class GetScienceDataSuccess extends AppStates{}

class GetScienceDataLoading extends AppStates{}

class GetScienceDataError extends AppStates{
  final String error;
  GetScienceDataError(this.error);
}

class ChangeAppMode extends AppStates{}

class SaveAppMode extends AppStates{}

class GetAppMode extends AppStates{}

class SearchLoading extends AppStates{}

class SearchError extends AppStates{
  final String error;
  SearchError(this.error);
}

class SearchSuccess extends AppStates{}





