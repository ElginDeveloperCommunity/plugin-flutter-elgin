package br.com.elgin.plugin_flutter_elgin;

import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;

import androidx.annotation.NonNull;

import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;

/** PluginFlutterElginPlugin */
public class PluginFlutterElginPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware, PluginRegistry.ActivityResultListener {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private Activity activity;
  private Context context;
  private static final String CHANNEL = "elgin.plugin/e1";
  private static final int IDH_INTENTS_REQUESTCODE = 1000;
  private static final int REQUEST_CODE_WRITE_EXTERNAL_STORAGE = 2000;
  private static MethodChannel.Result methodChannelResult;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), CHANNEL);
    channel.setMethodCallHandler(this);
    context = flutterPluginBinding.getApplicationContext();
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    // result that returns the value to flutter
    methodChannelResult = result;

    if (call.method.equals("intent")) {
      startIntent(call.argument("arguments"));
    } else if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  // ACTIVITY AWARE STUFF

  // https://stackoverflow.com/a/66268739
  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
    // plugin is now attached to an Activity
    this.activity = binding.getActivity();

  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    // the Activity the plugin was attached to was destroyed to change configuration
    // This call will be followed by onReattachedToActivityForConfigChanges
    this.activity = null;
  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
    // the plugin is now attached to a new Activity after a configuration change
    onAttachedToActivity(binding);
  }

  @Override
  public void onDetachedFromActivity() {
    // the plugin is no longer associated with an Activity. Clean up references
    this.activity = null;
  }
}
