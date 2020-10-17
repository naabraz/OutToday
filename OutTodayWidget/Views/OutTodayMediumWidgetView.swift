import SwiftUI
import WidgetKit

struct MultipleReleaseView: View {
  let releases: [ReleaseDetails]

  var body: some View {
    HStack(alignment: .firstTextBaseline) {
      ForEach(releases) { release in
        Image(release.image)
          .resizable()
      }
    }
    .background(Color.black)
  }
}

struct SingleReleaseView: View {
  let release: ReleaseDetails
  
  var body: some View {
    HStack() {
      Image(release.image)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .offset(x: -18)
      VStack(alignment: .leading) {
        Text(release.title)
          .font(.body)
          .foregroundColor(.white)
          .padding(.bottom, 5)
        Text(release.date)
          .font(.caption)
          .foregroundColor(.white)
      }
      .padding(.horizontal, 10)
    }
    .frame(width: 300)
    .background(Color.black)
  }
}

struct OutTodayMediumWidgetView: View {
  let releases: [ReleaseDetails]
  var body: some View {
    if (releases.count > 1) {
      MultipleReleaseView(releases: releases)
    } else {
      SingleReleaseView(release: releases[0])
    }
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
    ]
    
    OutTodayMediumWidgetView(
      releases: allReleases
    ).previewContext(WidgetPreviewContext(family: .systemMedium))
  }
}
