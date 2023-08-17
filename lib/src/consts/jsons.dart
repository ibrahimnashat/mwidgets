class Jsons {
  static String logo = 'app_logo';
  static String success = 'success';
  static String loading = 'loading';
  static String error = 'error';
  static String empty = 'empty';

  static void setUp({
    String? logo,
    String? success,
    String? loading,
    String? error,
    String? empty,
  }) {
    if (logo != null) Jsons.logo = logo;
    if (success != null) Jsons.success = success;
    if (loading != null) Jsons.loading = loading;
    if (error != null) Jsons.error = error;
    if (empty != null) Jsons.logo = empty;
  }
}
