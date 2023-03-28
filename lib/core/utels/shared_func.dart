class AppUtils {
  static bool intToBool(int x) {
    return x > 0;
  }

  static int boolToInt(bool x) {
    if (x == true) {
      return 1;
    } else {
      return 0;
    }
  }
}
