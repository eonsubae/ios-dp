import Foundation

public class JokeProvider {
  
  public let jokes: [Joke]
  
  public init(fileName: String) {
    let bundle = Bundle.main
    let url = bundle.url(forResource: fileName, withExtension: "json")!
    let data = try! Data(contentsOf: url)
    self.jokes = try! JSONDecoder().decode(Array<Joke>.self, from: data)
  }
}
