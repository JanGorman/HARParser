import Foundation

/// Parses a the contents of a .har file
public final class HARParser {

  private let data: Data

  /// Initialize with the contents of a .har file
  ///
  /// - Parameter data: The .har file's contents
  public init(data: Data) {
    self.data = data
  }

  /// Parse the data into `HAR`
  /// - Returns: The decoded struct
  public func parse() throws -> HAR {
    let decoder = JSONDecoder()
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    decoder.dateDecodingStrategy = .formatted(formatter)
    decoder.dataDecodingStrategy = .base64
    return try decoder.decode(HAR.self, from: data)
  }

}

/// The HAR struct representing the .har file's contents
public struct HAR: Codable {

  private let log: Log

  /// The .har version
  public var version: String {
    log.version
  }

  /// THe .har creator
  public var creator: Creator {
    log.creator
  }

  /// The .har entries
  public var entries: [Entry] {
    log.entries
  }

  struct Log: Codable {
    let version: String
    let creator: Creator
    let entries: [Entry]
  }

}

public struct Creator: Codable {
  public let name: String
  public let version: String
}

public struct Entry: Codable {

  public let start: Date
  public let time: TimeInterval
  public let request: Request
  public let response: Response

  enum CodingKeys: String, CodingKey {
    case start = "startedDateTime"
    case time
    case request
    case response
  }

}

public enum HTTPMethod: String, Codable {
  case GET, PUT, POST, DELETE, HEAD, CONNECT, OPTIONS, TRACE, PATCH
}

public struct Request: Codable {
  public let method: HTTPMethod
  public let url: URL
  public let httpVersion: String
  public let cookies: [Cookie]?
  public let headers: [Header]?
  public let query: [QueryItem]?
}

public struct Response: Codable {
  public let status: Int
  public let statusText: String?
  public let httpVersion: String
  public let cookies: [Cookie]?
  public let headers: [Header]?
  public let content: Content
}

public struct Content: Codable {

  public let size: Int
  public let mimeType: String
  public let data: Data
  public var text: String? {
    String(data: data, encoding: .utf8)
  }

  enum CodingKeys: String, CodingKey {
    case size
    case mimeType
    case data = "text"
  }

}

public struct Map: Codable {
  public let name: String
  public let value: String
}

public typealias Cookie = Map
public typealias Header = Map
public typealias QueryItem = Map
