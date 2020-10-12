import SwiftUI

struct ReleasesView: View {
  let release: ReleaseDetails = ReleaseProvider.getRelease()
  
  var body: some View {
    ReleaseListView()
  }
}

struct ReleasesView_Previews: PreviewProvider {
  static var previews: some View {
    ReleasesView()
  }
}
