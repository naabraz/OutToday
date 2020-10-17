import Foundation

public struct RandomReleaseofTheDay {
  public let release: ReleaseDetails
  public let numberOfReleases: Int
  
  init(
    release: ReleaseDetails? = nil,
    numberOfReleases: Int
  ) {
    self.release = release ?? ReleaseDetails(
      date: "",
      title: "",
      producers: "",
      studio: "",
      recorded: "",
      image: "",
      key: ""
    )
    self.numberOfReleases = numberOfReleases
  }
}
