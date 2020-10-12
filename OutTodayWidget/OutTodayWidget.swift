import WidgetKit
import SwiftUI

struct OutTodayWidgetProvider: TimelineProvider {
  func placeholder(in context: Context) -> OutTodayWidgetEntry {
    OutTodayWidgetEntry(date: Date(), release: ReleaseProvider.getRelease())
  }
  
  func getSnapshot(in context: Context, completion: @escaping (OutTodayWidgetEntry) -> ()) {
    let entry = OutTodayWidgetEntry(date: Date(), release: ReleaseProvider.getRelease())
    completion(entry)
  }
  
  func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
    var entries: [OutTodayWidgetEntry] = []
    
    // Generate a timeline consisting of five entries an hour apart, starting from the current date.
    let currentDate = Date()
    for hourOffset in 0 ..< 5 {
      let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
      let entry = OutTodayWidgetEntry(date: entryDate, release: ReleaseProvider.getRelease())
      entries.append(entry)
    }
    
    let timeline = Timeline(entries: entries, policy: .atEnd)
    completion(timeline)
  }
}

struct OutTodayWidgetEntry: TimelineEntry {
  let date: Date
  let release: ReleaseDetails
}

struct OutTodayWidgetEntryView : View {
  var entry: OutTodayWidgetProvider.Entry
  
  var body: some View {
    OutTodaySmallWidget(release: entry.release)
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
    OutTodayWidgetEntryView(entry: OutTodayWidgetEntry(date: Date(), release: ReleaseProvider.getRelease()))
      .previewContext(WidgetPreviewContext(family: .systemSmall))
  }
}
