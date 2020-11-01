import WidgetKit
import SwiftUI

struct OutTodayMediumWidgetView: View {
  let randomRelease: RandomReleaseofTheDay
  let nextRelease: RandomReleaseofTheDay
  
  var body: some View {
    HStack {
      VStack {
        if randomRelease.numberOfReleases > 0 {
          Image(randomRelease.release.image)
            .resizable()
            .overlay(NumberOfReleases(numberOfReleases: randomRelease.numberOfReleases), alignment: .bottomTrailing)
        } else {
          OutTodaySmallWidgetEmptyView()
        }
      }
      .widgetURL(randomRelease.release.url)
      
      VStack {
        Image(nextRelease.release.image)
          .resizable()
          .overlay(NumberOfReleases(numberOfReleases: nextRelease.numberOfReleases), alignment: .bottomTrailing)
      }
      .widgetURL(nextRelease.release.url)
    }
    .background(Color.black)
  }
}

struct OutTodayMediumWidgetView_Previews: PreviewProvider {
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
    
    let nextRelease = RandomReleaseofTheDay(
      release: ReleaseDetails(
        date: "20 November 1980",
        title: "The Book of Souls",
        producers: "Kevin Shirley, Steve Harris",
        studio: "Parlophone, Sanctuary Copyrights/BMG (US)",
        recorded: "Guillaume Tell Studios",
        image: "livealbum-beast-over-hammersmith",
        key: "2010"
      ),
      numberOfReleases: 1
    )
    
    OutTodayMediumWidgetView(
      randomRelease: randomRelease,
      nextRelease: nextRelease
    ).previewContext(WidgetPreviewContext(family: .systemMedium))
  }
}
