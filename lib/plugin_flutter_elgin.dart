
import 'plugin_flutter_elgin_platform_interface.dart';

class PluginFlutterElgin {
  Future<String?> getPlatformVersion() {
    return PluginFlutterElginPlatform.instance.getPlatformVersion();
  }
}
