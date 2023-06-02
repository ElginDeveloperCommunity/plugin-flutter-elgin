import 'package:plugin_flutter_elgin/src/printer/printer.dart';
import 'package:plugin_flutter_elgin/src/tef/tef.dart';
import 'plugin_flutter_elgin_platform_interface.dart';

export './src/tef/returns/index.dart';

class PluginFlutterElgin {
  late Printer printer;
  late Tef tef;

  PluginFlutterElgin() {
    printer = Printer();
    tef = Tef();
  }

  Future<String?> getPlatformVersion() {
    return PluginFlutterElginPlatform.instance.getPlatformVersion();
  }
}
