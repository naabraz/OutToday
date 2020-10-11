import Foundation

public struct DateHelper {
  static func formatDate() -> String {
    let date = Date()
    let dateFormatter = DateFormatter()
    
    dateFormatter.locale = Locale(identifier: "pt_BR")
    dateFormatter.setLocalizedDateFormatFromTemplate("dd-MM")
    
    let formattedDate = dateFormatter.string(from: date).replacingOccurrences(of: "/", with: "")
    
    return formattedDate
  }
}
