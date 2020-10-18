import SwiftUI

@available(iOSApplicationExtension 14.0, *)
struct OutTodaySmallWidgetEmptyView: View {
  var body: some View {
    ZStack {
      Color.black
      Image("eddie-404")
        .resizable()
        .scaledToFill()
    }
    .widgetURL(URL(string: "release://404"))
  }
}
