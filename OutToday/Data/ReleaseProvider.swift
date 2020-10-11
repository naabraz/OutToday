import Foundation

public struct ReleaseProvider {
  static func getRelease() -> ReleaseDetails {
    let date = DateHelper.formatDate()
    
    return Releases.allReleases[date] ?? Releases.emptyRelease
  }
}
