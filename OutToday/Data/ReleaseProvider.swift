import Foundation

public struct ReleaseProvider {
  static func getReleaseDates(releases: [ReleaseDetails], year: String) -> [Date] {
    var releaseDates = [] as [Date]
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    
    releases.forEach { release in
      let releaseDateKey = String(release.key.enumerated().map { $0 > 0 && $0 % 2 == 0 ? ["/", $1] : [$1]}.joined())
      
      releaseDates.append(formatter.date(from: releaseDateKey+"/"+year)!)
    }
    
    return releaseDates
  }
  
  static func getNearestReleaseDate(releaseDates: [Date]) -> String {
    if let closestDate = releaseDates.sorted().first(where: {$0.timeIntervalSinceNow > 0}) {
      let closest = String(closestDate.description).prefix(10)
      let dateArray = closest.split{$0 == "-"}.map(String.init)
      let key = dateArray[2]+dateArray[1]
      
      return key
    }
    
    return "No nearest date"
  }
  
  static func getNearestReleases() -> [ReleaseDetails] {
    let releases = Releases.allReleases
    var nearestReleases = [] as [ReleaseDetails]

    let date = Date()
    let calendar = Calendar.current
    let year = String(calendar.component(.year, from: date))
    
    let releaseDates = getReleaseDates(releases: releases, year: year)
    let nearestReleaseDate = getNearestReleaseDate(releaseDates: releaseDates)
    
    releases.forEach { release in
      if (release.key == nearestReleaseDate) {
        nearestReleases.append(release)
      }
    }
        
    return nearestReleases
  }

  static func getRandomRelease() -> RandomReleaseofTheDay {
    let date = DateHelper.formatDate()
    let releases = Releases.allReleases
    var releasesOfTheDay = [ReleaseDetails]()
    
    print("nearestReleases ", getNearestReleases())
    
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
