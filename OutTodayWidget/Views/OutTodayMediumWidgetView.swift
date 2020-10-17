import SwiftUI
import WidgetKit

struct OutTodayMediumWidgetView: View {
  let allReleases: [ReleaseDetails]
  
  var body: some View {
    HStack(alignment: .firstTextBaseline) {
      ForEach(allReleases) { release in
        Image(release.image)
          .resizable()
      }
    }
    .background(Color.black)
  }
}

struct OutTodayMediumWidgetView_Previews: PreviewProvider {
  static var previews: some View {
    let allReleases = [
      ReleaseDetails(
        date: "16 August 2010",
        title: "The Final Frontier",
        producers: "Kevin Shirley, Steve Harris",
        studio: "EMI UME, Sony (United States)",
        recorded: "Compass Point Studios, The Cave Studios",
        image: "album-final-frontier",
        key: "1608"
      ),
      ReleaseDetails(
        date: "04 September 2015",
        title: "The Book of Souls",
        producers: "Kevin Shirley, Steve Harris",
        studio: "Parlophone, Sanctuary Copyrights/BMG (US)",
        recorded: "Guillaume Tell Studios",
        image: "album-the-book-of-souls",
        key: "0409"
      )
    ]
    
    OutTodayMediumWidgetView(
      allReleases: allReleases
    ).previewContext(WidgetPreviewContext(family: .systemMedium))
  }
}
