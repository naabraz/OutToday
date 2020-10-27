import SwiftUI
import WidgetKit

struct OutTodaySmallWidgetEmptyView: View {
  var body: some View {
    ZStack {
      Color.black
      Image("eddie-404")
        .resizable()
        .scaledToFill()
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
    .widgetURL(URL(string: "release://404"))
  }
}

struct OutTodaySmallWidgetEmptyView_Previews: PreviewProvider {
  static var previews: some View {
    OutTodaySmallWidgetEmptyView().previewContext(WidgetPreviewContext(family: .systemMedium))
  }
}
