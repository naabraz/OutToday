import Foundation

public struct ReleaseDetails {
  public let date: String
  public let title: String
  public let producers: String?
  public let studio: String?
  public let recorded: String?
  public let image: String
  public let key: String
  public let url: URL?
  
  init(
    date: String,
    title: String,
    producers: String? = nil,
    studio: String? = nil,
    recorded: String? = nil,
    image: String,
    key: String
  ) {
    self.date = date
    self.title = title
    self.producers = producers
    self.studio = studio
    self.recorded = recorded
    self.image = image
    self.key = key
    self.url = URL(string: "release://\(title.filter { !$0.isWhitespace })")
  }
}

extension ReleaseDetails: Identifiable {
  public var id: String {
    title
  }
}
