import SwiftUI
import WidgetKit

struct OutTodayWidgetView: View {
  
  @Environment(\.widgetFamily) var family: WidgetFamily
  let randomRelease: RandomReleaseofTheDay

  @ViewBuilder
  var body: some View {
    switch family {
    case .systemSmall:
      OutTodaySmallWidgetView(randomRelease: randomRelease)
    case .systemMedium:
      OutTodayMediumWidgetView(allReleases: randomRelease)
    @unknown default:
      EmptyView()
    }
  }
}

struct OutTodayWidgetPlaceholderView: View {
  var body: some View {
    Color(UIColor.systemIndigo)
  }
}
