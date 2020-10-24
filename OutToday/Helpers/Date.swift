import Foundation

public struct DateHelper {
  static func getClosestDate() -> String {
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd"
    
    let calendar = Calendar.current
    let year = String(calendar.component(.year, from: date))
    
    let date1 = formatter.date(from: year+"/12/13")
    let date2 = formatter.date(from: year+"/01/08")
    let date3 = formatter.date(from: year+"/03/15")
    
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
