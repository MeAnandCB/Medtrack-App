class AppConfig {
  static String devUrl = 'http://10.0.2.2:8000';
  static String mediaUrl = 'http://10.0.2.2:8000';

  // Final urls
  static String baseUrl = devUrl;

  /// Shared pref Keys
  static const String ACCESS = 'access';
  static const String REFRESH_ACCESS = 'refreshAccess';
  static const String LOCAL = 'local';
  //signIn response data saved to shared pref
  static const String USER_NAME = 'user';
  static const String PASSWORD = 'pass';

  static const String LOGIN_DATA = 'logInData';
}
