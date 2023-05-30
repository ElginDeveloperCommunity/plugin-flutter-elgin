import 'package:plugin_flutter_elgin/src/printer/printer.dart';
import 'plugin_flutter_elgin_platform_interface.dart';

class PluginFlutterElgin {
  late Printer printer;

  PluginFlutterElgin() {
    printer = Printer();
  }

  Future<String?> getPlatformVersion() {
    return PluginFlutterElginPlatform.instance.getPlatformVersion();
  }
}
