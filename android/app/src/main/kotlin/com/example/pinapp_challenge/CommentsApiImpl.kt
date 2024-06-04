import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.net.HttpURLConnection
import java.net.URL

class CommentsApiImpl : CommentsApi {

    override fun fetchComments(postId: Long, callback: (Result<List<CommentModel>>) -> Unit) {
        CoroutineScope(Dispatchers.IO).launch {
            try {
                val url = URL("https://jsonplaceholder.typicode.com/comments?postId=$postId")
                val connection = url.openConnection() as HttpURLConnection
                connection.requestMethod = "GET"
                connection.connect()

                val responseCode = connection.responseCode
                if (responseCode == 200) {
                    val responseBody = connection.inputStream.bufferedReader().use { it.readText() }
                    val comments = parseJsonToComments(responseBody)
                    withContext(Dispatchers.Main) {
                        callback(Result.success(comments))
                    }
                } else {
                    withContext(Dispatchers.Main) {
                        callback(Result.failure(Exception("Error fetching comments: $responseCode")))
                    }
                }
            } catch (e: Exception) {
                withContext(Dispatchers.Main) {
                    callback(Result.failure(e))
                }
            }
        }
    }

    private fun parseJsonToComments(json: String): List<CommentModel> {
        val jsonArray = org.json.JSONArray(json)
        val comments = mutableListOf<CommentModel>()
        for (i in 0 until jsonArray.length()) {
            val jsonObject = jsonArray.getJSONObject(i)
            val comment = CommentModel(
                postId = jsonObject.getLong("postId"),
                id = jsonObject.getLong("id"),
                name = jsonObject.getString("name"),
                email = jsonObject.getString("email"),
                body = jsonObject.getString("body")
            )
            comments.add(comment)
        }
        return comments
    }
}