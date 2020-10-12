import SwiftUI

struct ReleaseItemView: View {
  let title: String
  let image: String
  
  var body: some View {
    HStack {
      Image(image)
        .resizable()
        .frame(width: 64, height: 64)
      Text("\(title)")
        .font(.title3)
    }
  }
}
