package br.com.elgin.plugin_flutter_elgin;

import android.app.Activity;
import android.content.Intent;

import androidx.annotation.NonNull;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

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
  private static final String CHANNEL = "elgin.plugin/e1";
  private static final int IDH_INTENTS_REQUEST_CODE = 1000;
  private static final int REQUEST_CODE_WRITE_EXTERNAL_STORAGE = 2000;
  private static MethodChannel.Result methodChannelResult;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), CHANNEL);
    channel.setMethodCallHandler(this);
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

  private void startIntent(Map<String, Object> argumentsIntent) {
    final String activityFilterPath = (String) argumentsIntent.get("activityFilterPath");
    final String intentPayload = (String) argumentsIntent.get("intentPayload");

    final Intent intent = new Intent(activityFilterPath);

    intent.putExtra("comando", intentPayload);

    // verify that the intent will resolve to an activity
    if (intent.resolveActivity(activity.getPackageManager()) == null) {
      methodChannelResult.error("ActivityNotFound", "No Activity to resolve", null);
      return;
    }

    activity.startActivityForResult(intent, IDH_INTENTS_REQUEST_CODE);
  }

  @Override
  public boolean onActivityResult(int requestCode, int resultCode, Intent data) {

    if (resultCode == Activity.RESULT_OK && requestCode == IDH_INTENTS_REQUEST_CODE) {
      try{
        if (data == null) return false;
        final String ret = data.getStringExtra("retorno");
        JSONArray jsonArrayReturn = new JSONArray(ret);
        // just to check the format of the json returned by idh
        JSONObject jsonObjectReturn = jsonArrayReturn.getJSONObject(0);
        
        methodChannelResult.success(jsonArrayReturn.toString());
        return true;
      } catch (JSONException jsonException) {
        jsonException.printStackTrace();
        methodChannelResult.error("JSON_FORMAT_ERROR", "The JSON format is incorrect or DigitalHub App is not installed", null);
        return false;
      }

    }
    methodChannelResult.error("NO_RETURN", "No return of function intent", null);
    return false;
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
    binding.addActivityResultListener(this);

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
