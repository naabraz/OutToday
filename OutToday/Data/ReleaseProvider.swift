import Foundation

public struct ReleaseProvider {
  static func getReleasesOfTheDay() -> RandomReleaseofTheDay {
    let date = DateHelper.formatDate()
    let releases = Releases.allReleases
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
}
