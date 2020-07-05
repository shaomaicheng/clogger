package com.cl.fl.clogger

import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import org.json.JSONObject

/** CloggerPlugin */
public class CloggerPlugin: FlutterPlugin, MethodCallHandler {
  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    val channel = MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "clogger")
    channel.setMethodCallHandler(CloggerPlugin());
  }

  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "clogger")
      channel.setMethodCallHandler(CloggerPlugin())
    }
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "clogger") {
      if (call.arguments is JSONObject) {
        val arguments = call.arguments as JSONObject
        val name = arguments.optString("name", "")
        val message = arguments.optString("message", "")
        when (arguments.optInt("level")) {
          LogLevel.info.level -> Log.i(name, message)
          LogLevel.warn.level -> Log.w(name, message)
          LogLevel.error.level -> Log.e(name, message)
          LogLevel.debug.level -> Log.d(name, message)
        }
      }
     result.success(Empty)
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
  }
}

enum class LogLevel(val level:Int){
  info(0),
  warn(1),
  error(2),
  debug(3)
}

object Empty
