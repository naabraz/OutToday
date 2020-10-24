import Foundation

public struct DateHelper {
  static func getClosestDate() -> String {
    let releases = Releases.allReleases
    
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    
    var releaseDates:[Date] = []
    
    let date = Date()
    let calendar = Calendar.current
    let year = String(calendar.component(.year, from: date))
    
    releases.forEach { release in
      let r = String(release.key.enumerated().map { $0 > 0 && $0 % 2 == 0 ? ["/", $1] : [$1]}.joined())
      
      releaseDates.append(formatter.date(from: r+"/"+year)!)
    }
    
    if let closestDate = releaseDates.sorted().first(where: {$0.timeIntervalSinceNow > 0}) {
      return String(closestDate.description(with: .current))
    }
    
    return "No closest date"
  }
    
  static func formatDate() -> String {
    let date = Date()
    let dateFormatter = DateFormatter()
    
    dateFormatter.locale = Locale(identifier: "pt_BR")
    dateFormatter.setLocalizedDateFormatFromTemplate("dd-MM")
    
    let formattedDate = dateFormatter.string(from: date).replacingOccurrences(of: "/", with: "")
    
    print("closestDate ", getClosestDate())
    
    return formattedDate
  }
}
