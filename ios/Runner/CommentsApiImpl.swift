import Pigeon
import Foundation
import URLSession

struct Comment: Codable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}

class CommentsApiImpl: CommentsApi {
    func fetchComments(postId: Int, completion: @escaping ([Comment]?) -> Void) {
      guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments?postId=\(postId)") else { return }
      
      let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
          guard let data = data, error == nil else { return }
          
          do {
              let comments = try JSONDecoder().decode([Comment].self, from: data)
              completion(json ?? [])
          } catch {
              print("Error parsing JSON: \(error)")
              completion([])
          }
      }
      task.resume()
  }
}