import Foundation

public struct DateHelper {
  static func getClosestDate() -> Void {
    let releases = Releases.allReleases
    var releaseDates:[Date] = []
    
    let date = Date()
    let calendar = Calendar.current
    let year = String(calendar.component(.year, from: date))
    
    releases.forEach { release in
      let formatter = DateFormatter()
      formatter.dateFormat = "dd/MM/yyyy"
      
      let releaseDateKey = String(release.key.enumerated().map { $0 > 0 && $0 % 2 == 0 ? ["/", $1] : [$1]}.joined())
      
      releaseDates.append(formatter.date(from: releaseDateKey+"/"+year)!)
    }
        
    if let closestDate = releaseDates.sorted().first(where: {$0.timeIntervalSinceNow > 0}) {
      let closest = String(closestDate.description(with: .current))

      print("closestDate ", closest)
    }
  }
    
  static func formatDate() -> String {
    getClosestDate()

    let date = Date()
    let dateFormatter = DateFormatter()
    
    dateFormatter.locale = Locale(identifier: "pt_BR")
    dateFormatter.setLocalizedDateFormatFromTemplate("dd-MM")
    
    let formattedDate = dateFormatter.string(from: date).replacingOccurrences(of: "/", with: "")
    
    return formattedDate
  }
}
