import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'plugin_flutter_elgin_platform_interface.dart';

/// An implementation of [PluginFlutterElginPlatform] that uses method channels.
class MethodChannelPluginFlutterElgin extends PluginFlutterElginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('elgin.plugin/e1');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
