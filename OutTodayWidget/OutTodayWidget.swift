import WidgetKit
import SwiftUI

struct OutTodayWidgetProvider: TimelineProvider {
  func placeholder(in context: Context) -> OutTodayWidgetEntry {
    OutTodayWidgetEntry(date: Date(), release: ReleaseProvider.getRandomRelease())
  }
  
  func getSnapshot(in context: Context, completion: @escaping (OutTodayWidgetEntry) -> ()) {
    let entry = OutTodayWidgetEntry(date: Date(), release: ReleaseProvider.getRandomRelease())
    completion(entry)
  }
  
  func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
    var entries: [OutTodayWidgetEntry] = []
    
    // Generate a timeline consisting of five entries an minute apart, starting from the current date.
    let currentDate = Date()
    for hourOffset in 0 ..< 5 {
      let entryDate = Calendar.current.date(byAdding: .minute, value: hourOffset, to: currentDate)!
      let entry = OutTodayWidgetEntry(date: entryDate, release: ReleaseProvider.getRandomRelease())
      entries.append(entry)
    }
    
    let timeline = Timeline(entries: entries, policy: .atEnd)
    completion(timeline)
  }
}

struct OutTodayWidgetEntry: TimelineEntry {
  let date: Date
  let release: RandomReleaseofTheDay
}

struct OutTodayWidgetEntryView : View {
  var entry: OutTodayWidgetProvider.Entry
  
  var body: some View {
    if entry.release.numberOfReleases > 0 {
      OutTodaySmallWidgetView(randomRelease: entry.release)
    } else {
      OutTodaySmallWidgetEmptyView()
    }
  }
}

@main
struct OutTodayWidget: Widget {
  let kind: String = "OutTodayWidget"
  
  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: OutTodayWidgetProvider()) { entry in
      OutTodayWidgetEntryView(entry: entry)
    }
    .configurationDisplayName("Out Today Widget")
    .description("Displays Iron Maiden release for today.")
  }
}

struct OutTodayWidget_Previews: PreviewProvider {
  static var previews: some View {
    OutTodayWidgetEntryView(
      entry: OutTodayWidgetEntry(
        date: Date(),
        release: ReleaseProvider.getRandomRelease()
      )
    )
    .previewContext(WidgetPreviewContext(family: .systemSmall))
  }
}
