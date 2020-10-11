import SwiftUI

struct ContentView: View {
  let release: ReleaseDetails = ReleaseProvider.getRelease()

  var body: some View {
    Text(release.title)
      .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
