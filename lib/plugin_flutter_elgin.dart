import 'package:plugin_flutter_elgin/src/printer/printer.dart';
import 'package:plugin_flutter_elgin/src/pix4/pix4.dart';
import 'package:plugin_flutter_elgin/src/sat/sat.dart';
import 'package:plugin_flutter_elgin/src/tef/tef.dart';
import 'plugin_flutter_elgin_platform_interface.dart';

export './src/tef/returns/index.dart';

class PluginFlutterElgin {
  late Printer printer;
  late Tef tef;
  late Pix4 pix4;
  late Sat sat;

  PluginFlutterElgin() {
    printer = Printer();
    tef = Tef();
    pix4 = Pix4();
    sat = Sat();
  }

  Future<String?> getPlatformVersion() {
    return PluginFlutterElginPlatform.instance.getPlatformVersion();
  }
}
