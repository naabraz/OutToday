import Foundation

public struct ReleaseProvider {
  static func getRelease() -> ReleaseDetails {
    let date = DateHelper.formatDate()

    return Releases.allReleases[date] ?? Releases.emptyRelease
  }
  
  static func getReleasesOfTheDay() -> RandomReleaseofTheDay {
    let date = DateHelper.formatDate()
    let releases = Releases.allReleasesArray
    var releasesOfTheDay: [ReleaseDetails] = []
    
    releases.forEach { release in
      if(release.key == date) {
        releasesOfTheDay.append(release)
      }
    }
    
    let randomIndex = Int.random(in: 0..<releasesOfTheDay.count)
    let numberOfReleases = releasesOfTheDay.count
    
    let randomRelease = RandomReleaseofTheDay(
      release: releasesOfTheDay[randomIndex],
      numberOfReleases: numberOfReleases
    )
    
    return randomRelease
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
