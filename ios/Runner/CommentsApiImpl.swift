import Foundation

class CommentsApiImpl : CommentsApi {
    func fetchComments(postId: Int64, completion: @escaping (Result<[CommentModel], Error>) -> Void) {
      guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments?postId=\(postId)") else { return }
      
      let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
          guard let data = data, error == nil else { return }
          
          do {
              let comments = try JSONDecoder().decode([CommentModel].self, from: data)
              completion(.success(comments)) // (comments: comments ?? [])
          } catch {
              print("Error parsing JSON: \(error)")
              completion(.failure(error))
          }
      }
      task.resume()
    }
}