import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'plugin_flutter_elgin_method_channel.dart';

abstract class PluginFlutterElginPlatform extends PlatformInterface {
  /// Constructs a PluginFlutterElginPlatform.
  PluginFlutterElginPlatform() : super(token: _token);

  static final Object _token = Object();

  static PluginFlutterElginPlatform _instance = MethodChannelPluginFlutterElgin();

  /// The default instance of [PluginFlutterElginPlatform] to use.
  ///
  /// Defaults to [MethodChannelPluginFlutterElgin].
  static PluginFlutterElginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PluginFlutterElginPlatform] when
  /// they register themselves.
  static set instance(PluginFlutterElginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
