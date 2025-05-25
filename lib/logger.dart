class Logger {

  static bool debugMode = true;
  static int level = 1;
  static Map<String, int> levels = {
    "debug": 0,
    "info": 1,
    "error": 2
  };

  static void info(String text) {
    _log("info", 1, text);
  }

  static void debug(String text) {
    _log("debug", 0, text);
  }

  static void error(String text) {
    _log("error", 2, text);
  }

  static void _log(String level_name, int level, String text) {
    if (level > levels[level_name]!) return;
    print("[$level_name] $text");
  }
}