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
  private static MethodChannel.Result methodChannelResult;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), Defines.CHANNEL);
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    // result that returns the value to flutter
    methodChannelResult = result;

    if (call.method.equals(Defines.INTENT)) {
      Map<String, Object> arguments = call.argument(Defines.ARGUMENTS);
      if (arguments == null) {
        result.error(Defines.ERROR_MISSING_ARGUMENTS, Defines.ERROR_MISSING_ARGUMENTS_DESC, null);
        return;
      }
      startIntent(Utils.convertMap(arguments));
    } else if (call.method.equals(Defines.GET_PLATFORM_VERSION)) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else {
      result.notImplemented();
    }
  }

  private void startIntent(Map<String, String> argumentsIntent) {
    final String activityFilterPath = argumentsIntent.remove(Defines.ACTIVITY_FILTER_PATH);
    final String intentPayload = argumentsIntent.remove(Defines.INTENT_PAYLOAD);
    final int code;

    final Intent intent = new Intent(activityFilterPath);

    if (intentPayload != null) {
      // normal idh flow
      code = Defines.IDH_INTENTS_ARRAY_REQUEST_CODE;
      intent.putExtra(Defines.COMANDO, intentPayload);
    } else {
      // tef flow
      code = Defines.IDH_INTENTS_OBJECT_REQUEST_CODE;
      for (String key : argumentsIntent.keySet()) {
        intent.putExtra(key, argumentsIntent.get(key));
      }
    }

    // verify that the intent will resolve to an activity
    if (intent.resolveActivity(activity.getPackageManager()) == null) {
      methodChannelResult.error(Defines.ERROR_ACTIVITY_NOT_FOUND, Defines.ERROR_ACTIVITY_NOT_FOUND_DESC, null);
      return;
    }

    activity.startActivityForResult(intent, code);
  }

  @Override
  public boolean onActivityResult(int requestCode, int resultCode, Intent data) {

    if (resultCode == Activity.RESULT_OK ) {
      try{
        if (data == null) return false;
        final String ret = data.getStringExtra(Defines.RETORNO);

        if (requestCode == Defines.IDH_INTENTS_ARRAY_REQUEST_CODE) {
          JSONArray jsonArrayReturn = new JSONArray(ret);
          // just to check the format of the json returned by idh
          jsonArrayReturn.getJSONObject(0);

          methodChannelResult.success(jsonArrayReturn.toString());
          return true;
        } else if (requestCode == Defines.IDH_INTENTS_OBJECT_REQUEST_CODE){
          // just to check the format of the json returned by idh
          JSONObject jsonObjectReturn = new JSONObject(ret);
          methodChannelResult.success(jsonObjectReturn.toString());
          return true;
        } else {
          methodChannelResult.error(Defines.ERROR_NO_RETURN, Defines.ERROR_NO_RETURN_DESC, null);
          return false;
        }
      } catch (JSONException jsonException) {
        jsonException.printStackTrace();
        methodChannelResult.error(Defines.ERROR_JSON_FORMAT, Defines.ERROR_JSON_FORMAT_DESC, null);
        return false;
      }

    }
    methodChannelResult.error(Defines.ERROR_RESULT_CODE, Defines.ERROR_RESULT_CODE_DESC, null);
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
