import WidgetKit
import SwiftUI

struct NumberOfReleasesMediumWidget: View {
  let numberOfReleases: Int
  
  var body: some View {
    ZStack {
      if numberOfReleases > 1 {
        Text(String(numberOfReleases))
          .font(.caption)
          .bold()
          .padding(6)
          .foregroundColor(.white)
          .padding(8)
      }
    }
  }
}

struct OutTodayMediumWidgetView: View {
  let randomRelease: RandomReleaseofTheDay
  let nextRelease: RandomReleaseofTheDay
  
  var body: some View {
    HStack {
      Image(randomRelease.release.image)
        .resizable()
        .overlay(NumberOfReleasesMediumWidget(numberOfReleases: randomRelease.numberOfReleases), alignment: .bottomTrailing)
      Image(randomRelease.release.image)
        .resizable()
        .overlay(NumberOfReleasesMediumWidget(numberOfReleases: randomRelease.numberOfReleases), alignment: .bottomTrailing)
    }
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
        image: "album-the-book-of-souls",
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
