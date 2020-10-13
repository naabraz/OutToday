import SwiftUI

struct EmptyReleasesText: View {
  var body: some View {
    ZStack {
      Text(String("No releases today"))
        .font(.caption)
        .bold()
        .padding(6)
        .foregroundColor(.black)
    }.background(Color.yellow)
    .cornerRadius(8)
    .padding(8)
    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
  }
}

struct OutTodaySmallWidgetEmptyView: View {
  var body: some View {
    ZStack {
      Color.black
      Image("eddie-404")
        .resizable()
        .scaledToFill()
    }
    .overlay(EmptyReleasesText(), alignment: .bottom)
  }
}
