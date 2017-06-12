//: # Parsing JSON - Now with Decodable
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
    var language_name: String
    var host: Host
}

let meetup = try! JSONDecoder().decode(Meetup.self, from: json)
