import WidgetKit
import SwiftUI

struct OutTodaySmallWidgetView: View {
  let randomRelease: RandomReleaseofTheDay
  
  var body: some View {
    HStack {
      Image(randomRelease.release.image)
        .resizable()
        .overlay(NumberOfReleases(numberOfReleases: randomRelease.numberOfReleases), alignment: .bottomTrailing)
    }
    .widgetURL(randomRelease.release.url)
  }
}

struct OutTodaySmallWidgetView_Previews: PreviewProvider {
  static var previews: some View {
    let randomRelease = RandomReleaseofTheDay(
      release: ReleaseDetails(
        date: "20 November 1980",
        title: "The Book of Souls",
        producers: "Kevin Shirley, Steve Harris",
        studio: "Parlophone, Sanctuary Copyrights/BMG (US)",
        recorded: "Guillaume Tell Studios",
        image: "album-the-book-of-souls",
        key: "2010"
      ),
      numberOfReleases: 1
    )
    
    OutTodaySmallWidgetView(
      randomRelease: randomRelease
    ).previewContext(WidgetPreviewContext(family: .systemSmall))
  }
}
