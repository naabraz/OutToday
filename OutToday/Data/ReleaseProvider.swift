import Foundation

public struct ReleaseProvider {
  static func getRelease() -> ReleaseDetails {
    let date = DateHelper.formatDate()

    return Releases.allReleases[date] ?? Releases.emptyRelease
  }
  
  static func getAllReleases() -> [ReleaseDetails] {
    let releases = Releases.allReleases.map() {
      ReleaseDetails(
        date: "\($0.value.date)",
        title: "\($0.value.title)",
        producers: "\($0.value.producers)",
        studio: "\($0.value.studio)",
        recorded: "\($0.value.recorded)",
        image: "\($0.value.image)",
        key: "\($0.value.key)"
      )
    }
    
    return releases
  }
}
