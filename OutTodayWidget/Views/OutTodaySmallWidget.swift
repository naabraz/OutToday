import SwiftUI

struct OutTodaySmallWidget: View {
  let release: ReleaseDetails

  var body: some View {    
    HStack {
      Image(release.image)
        .resizable()
    }
  }
}
