import Foundation

public struct ReleaseDetails {
  public let date: Date
  public let title: String
  public let producers: String
  public let studio: String
  public let recorded: String
  public let url: URL?
  
  init(date: Date, title: String, producers: String, studio: String, recorded: String) {
    self.date = date
    self.title = title
    self.producers = producers
    self.studio = studio
    self.recorded = recorded
    self.url = URL(string: "release://\(title.filter { !$0.isWhitespace })")
  }
}

extension ReleaseDetails: Identifiable {
  public var id: String {
    title
  }
}
