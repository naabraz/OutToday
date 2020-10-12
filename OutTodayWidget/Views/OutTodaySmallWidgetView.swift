import SwiftUI

struct NumberOfReleases: View {
  let numberOfReleases: Int
  
  var body: some View {
    ZStack {
      Text(String(numberOfReleases))
        .font(.caption)
        .bold()
        .padding(6)
        .foregroundColor(.white)
    }.background(Color.black)
    .cornerRadius(8)
    .padding(8)
  }
}

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
