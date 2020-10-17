import SwiftUI
import WidgetKit

struct OutTodayWidgetView: View {
  
  @Environment(\.widgetFamily) var family: WidgetFamily
  let randomRelease: RandomReleaseofTheDay
  let releases: [ReleaseDetails]

  @ViewBuilder
  var body: some View {
    switch family {
    case .systemSmall:
      OutTodaySmallWidgetView(randomRelease: randomRelease)
    case .systemMedium:
      OutTodayMediumWidgetView(releases: releases)
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
