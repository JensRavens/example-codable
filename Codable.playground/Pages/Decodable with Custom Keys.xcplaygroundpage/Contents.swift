//: # Parsing JSON - Custom Keys
//: [Previous](@previous) | [Next](@next)
import Foundation

//: Here's our data from the internetz.
let json = """
  {
    "id": 1,
    "name": "swift.berlin",
    "language_name": "swift",
    "host": {
        "name": "Flixbus"
    }
  }
  """.data(using: String.Encoding.utf8)!

//: The hosting company, now conforming to `Decodable`.
struct Host: Decodable {
    var name: String
}

//: The actual meetup, now conforming to `Decodable`.
struct Meetup: Decodable {
    var name: String
    var language: String
    var host: Host
    
    private enum CodingKeys: String, CodingKey {
        case name, language = "language_name", host
    }
}

let meetup = try! JSONDecoder().decode(Meetup.self, from: json)
