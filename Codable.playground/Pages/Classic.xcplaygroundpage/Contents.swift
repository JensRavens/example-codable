//: # Parsing JSON - The classical approach
//: [Next](@next)
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

//: Define an error in case we need to throw:
enum ParseError: Error {
    case MissingKey
}

//: The hosting company. Has a special function to parse a dict.
struct Host {
    var name: String
    
    static func from(_ dict: [String:Any]) throws -> Host {
        if let name = dict["name"] as? String {
            return Host(name: name)
        }
        throw ParseError.MissingKey
    }
}

//: The actual meetup. Has a special function to parse a dict.
struct Meetup {
    var name: String
    var language: String
    var host: Host
    
    static func from(_ dict: [String:Any]) throws -> Meetup {
        if let name = dict["name"] as? String,
            let language = dict["language_name"] as? String,
            let hostValues = dict["host"] as? [String:Any]
        {
            return Meetup(name: name, language: language, host: try Host.from(hostValues))
        }
        throw ParseError.MissingKey
    }
}

// Parse json into a Dictionary[String:Any]
let dict = try! JSONSerialization.jsonObject(with: json, options: []) as! [String:Any]
// Now we can finally parse.
let meetup = try! Meetup.from(dict)

