import SwiftUI

struct NumberOfReleases: View {
  let numberOfReleases: Int
  
  var body: some View {
    VStack {
      if numberOfReleases > 1 {
        Text(String(numberOfReleases))
          .font(.caption)
          .bold()
          .padding(8)
          .foregroundColor(.white)
      }
    }
    .background(Color.black)
    .frame(width: 100, height: 100, alignment: .bottomTrailing)
    .opacity(0.8)
  }
}
