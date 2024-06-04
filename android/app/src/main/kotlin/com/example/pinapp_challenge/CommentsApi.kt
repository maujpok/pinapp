// Autogenerated from Pigeon (v19.0.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon
@file:Suppress("UNCHECKED_CAST", "ArrayInDataClass")


import android.util.Log
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MessageCodec
import io.flutter.plugin.common.StandardMessageCodec
import java.io.ByteArrayOutputStream
import java.nio.ByteBuffer

private fun wrapResult(result: Any?): List<Any?> {
  return listOf(result)
}

private fun wrapError(exception: Throwable): List<Any?> {
  return if (exception is FlutterError) {
    listOf(
      exception.code,
      exception.message,
      exception.details
    )
  } else {
    listOf(
      exception.javaClass.simpleName,
      exception.toString(),
      "Cause: " + exception.cause + ", Stacktrace: " + Log.getStackTraceString(exception)
    )
  }
}

/**
 * Error class for passing custom error details to Flutter via a thrown PlatformException.
 * @property code The error code.
 * @property message The error message.
 * @property details The error details. Must be a datatype supported by the api codec.
 */
class FlutterError (
  val code: String,
  override val message: String? = null,
  val details: Any? = null
) : Throwable()

/** Generated class from Pigeon that represents data sent in messages. */
data class CommentModel (
  val postId: Long,
  val id: Long,
  val name: String,
  val email: String,
  val body: String

) {
  companion object {
    @Suppress("LocalVariableName")
    fun fromList(__pigeon_list: List<Any?>): CommentModel {
      val postId = __pigeon_list[0].let { num -> if (num is Int) num.toLong() else num as Long }
      val id = __pigeon_list[1].let { num -> if (num is Int) num.toLong() else num as Long }
      val name = __pigeon_list[2] as String
      val email = __pigeon_list[3] as String
      val body = __pigeon_list[4] as String
      return CommentModel(postId, id, name, email, body)
    }
  }
  fun toList(): List<Any?> {
    return listOf<Any?>(
      postId,
      id,
      name,
      email,
      body,
    )
  }
}

private object CommentsApiCodec : StandardMessageCodec() {
  override fun readValueOfType(type: Byte, buffer: ByteBuffer): Any? {
    return when (type) {
      128.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          CommentModel.fromList(it)
        }
      }
      else -> super.readValueOfType(type, buffer)
    }
  }
  override fun writeValue(stream: ByteArrayOutputStream, value: Any?)   {
    when (value) {
      is CommentModel -> {
        stream.write(128)
        writeValue(stream, value.toList())
      }
      else -> super.writeValue(stream, value)
    }
  }
}

/** Generated interface from Pigeon that represents a handler of messages from Flutter. */
interface CommentsApi {
  fun fetchComments(postId: Long, callback: (Result<List<CommentModel>>) -> Unit)

  companion object {
    /** The codec used by CommentsApi. */
    val codec: MessageCodec<Any?> by lazy {
      CommentsApiCodec
    }
    /** Sets up an instance of `CommentsApi` to handle messages through the `binaryMessenger`. */
    @JvmOverloads
    fun setUp(binaryMessenger: BinaryMessenger, api: CommentsApi?, messageChannelSuffix: String = "") {
      val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.pinapp_challenge.CommentsApi.fetchComments$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val postIdArg = args[0].let { num -> if (num is Int) num.toLong() else num as Long }
            api.fetchComments(postIdArg) { result: Result<List<CommentModel>> ->
              val error = result.exceptionOrNull()
              if (error != null) {
                reply.reply(wrapError(error))
              } else {
                val data = result.getOrNull()
                reply.reply(wrapResult(data))
              }
            }
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
    }
  }
}
