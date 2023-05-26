import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_flutter_elgin/plugin_flutter_elgin.dart';
import 'package:plugin_flutter_elgin/plugin_flutter_elgin_platform_interface.dart';
import 'package:plugin_flutter_elgin/plugin_flutter_elgin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPluginFlutterElginPlatform
    with MockPlatformInterfaceMixin
    implements PluginFlutterElginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PluginFlutterElginPlatform initialPlatform = PluginFlutterElginPlatform.instance;

  test('$MethodChannelPluginFlutterElgin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPluginFlutterElgin>());
  });

  test('getPlatformVersion', () async {
    PluginFlutterElgin pluginFlutterElginPlugin = PluginFlutterElgin();
    MockPluginFlutterElginPlatform fakePlatform = MockPluginFlutterElginPlatform();
    PluginFlutterElginPlatform.instance = fakePlatform;

    expect(await pluginFlutterElginPlugin.getPlatformVersion(), '42');
  });
}
