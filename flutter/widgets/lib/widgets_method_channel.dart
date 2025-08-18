import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'widgets_platform_interface.dart';

/// An implementation of [WidgetsPlatform] that uses method channels.
class MethodChannelWidgets extends WidgetsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('widgets');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
