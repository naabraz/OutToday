import Foundation

public struct ReleaseProvider {
  static func getClosestDate() -> Void {
    let releases = Releases.allReleases
    var releaseDates = [] as [Date]
    
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"

    let date = Date()
    let calendar = Calendar.current
    let year = String(calendar.component(.year, from: date))
    
    releases.forEach { release in
      let releaseDateKey = String(release.key.enumerated().map { $0 > 0 && $0 % 2 == 0 ? ["/", $1] : [$1]}.joined())
      
      releaseDates.append(formatter.date(from: releaseDateKey+"/"+year)!)
    }

    if let closestDate = releaseDates.sorted().first(where: {$0.timeIntervalSinceNow > 0}) {
      let closest = String(closestDate.description).prefix(10)
      let dateArray = closest.split{$0 == "-"}.map(String.init)
      let key = dateArray[2]+dateArray[1]

      print("closestDate ", key)
    }
  }

  static func getRandomRelease() -> RandomReleaseofTheDay {
    let date = DateHelper.formatDate()
    let releases = Releases.allReleases
    var releasesOfTheDay = [ReleaseDetails]()
    
    getClosestDate()
    
    releases.forEach { release in
      if(release.key == date) {
        releasesOfTheDay.append(release)
      }
    }
    
    if (releasesOfTheDay.count == 0) {
      let randomRelease = RandomReleaseofTheDay(
        numberOfReleases: 0
      )
      
      return randomRelease
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
