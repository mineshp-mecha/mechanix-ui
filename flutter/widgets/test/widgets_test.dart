import 'package:flutter_test/flutter_test.dart';
import 'package:widgets/widgets.dart';
import 'package:widgets/widgets_platform_interface.dart';
import 'package:widgets/widgets_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWidgetsPlatform
    with MockPlatformInterfaceMixin
    implements WidgetsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final WidgetsPlatform initialPlatform = WidgetsPlatform.instance;

  test('$MethodChannelWidgets is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWidgets>());
  });

  test('getPlatformVersion', () async {
    Widgets widgetsPlugin = Widgets();
    MockWidgetsPlatform fakePlatform = MockWidgetsPlatform();
    WidgetsPlatform.instance = fakePlatform;

    expect(await widgetsPlugin.getPlatformVersion(), '42');
  });
}
