//: # Encoding JSON
//: [Previous](@previous) | [Next](@next)
import Foundation

//: The hosting company, now conforming to `Encodable`.
struct Host: Encodable {
    var name: String
}

//: The actual meetup, now conforming to `Encodable`.
struct Meetup: Encodable {
    var name: String
    var language: String
    var host: Host
    
    private enum CodingKeys: String, CodingKey {
        case name, language = "language_name", host
    }
}

let meetup = Meetup(name: "swift.berlin", language: "swift", host: Host(name: "Flixbus"))
let json = try! JSONEncoder().encode(meetup)
let jsonString = String(data: json, encoding: .utf8)


