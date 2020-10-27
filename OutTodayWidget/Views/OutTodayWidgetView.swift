import SwiftUI
import WidgetKit

struct OutTodayWidgetView: View {
  let randomRelease: RandomReleaseofTheDay
  let randomNextRelease: RandomReleaseofTheDay

  @Environment(\.widgetFamily) var family: WidgetFamily

  @ViewBuilder
  var body: some View {
      if (family == .systemSmall) {
        if randomRelease.numberOfReleases > 0 {
          OutTodaySmallWidgetView(randomRelease: randomRelease)
        } else {
          OutTodaySmallWidgetEmptyView()
        }
      }
      
      if (family == .systemMedium) {
        OutTodayMediumWidgetView(
          randomRelease: randomRelease,
          nextRelease: randomNextRelease)
      }
    
    EmptyView()
  }
}
