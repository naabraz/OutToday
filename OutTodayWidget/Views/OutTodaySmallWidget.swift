import SwiftUI

struct NumberOfReleases: View {
  let numberOfReleases: Int
  
  var body: some View {
    ZStack {
      Text(String(numberOfReleases))
        .bold()
        .padding(6)
        .foregroundColor(.black)
    }.background(Color.white)
    .cornerRadius(8)
    .padding(8)
  }
}

struct OutTodaySmallWidget: View {
  let randomRelease: RandomReleaseofTheDay
  
  var body: some View {    
    HStack {
      Image(randomRelease.release.image)
        .resizable()
        .overlay(NumberOfReleases(numberOfReleases: randomRelease.numberOfReleases), alignment: .bottomTrailing)
    }
  }
}
