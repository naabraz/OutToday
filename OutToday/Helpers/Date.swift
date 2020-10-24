import Foundation

public struct DateHelper {
  static func getClosestDate() -> String {
//    let allReleases = Releases.allReleases
    
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    
    let calendar = Calendar.current
    let year = String(calendar.component(.year, from: date))
    
    let date1 = formatter.date(from: "14/03/"+year)
    let date2 = formatter.date(from: "15/11/"+year)
    let date3 = formatter.date(from: "16/12/"+year)
    
    let s = "0409"
    let r = String(s.enumerated().map { $0 > 0 && $0 % 2 == 0 ? ["/", $1] : [$1]}.joined())
    
    print("closestDate" + r)
    
    let dateList = [date1!, date2!, date3!]
    
    if let closestDate = dateList.sorted().first(where: {$0.timeIntervalSinceNow > 0}) {
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
    
    print("closestDate", getClosestDate())
    
    return formattedDate
  }
}
