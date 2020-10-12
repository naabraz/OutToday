import SwiftUI

struct ReleaseListView: View {
  let releases = Releases.allReleases
  @State private var showingDetails = false
  
  var body: some View {
    NavigationView {
      List {
        ForEach(releases) { releaseDetails in
          Button(action: {
            showingDetails.toggle()
          }, label: {
            ReleaseItemView(title: releaseDetails.title, image: releaseDetails.image)
          }).sheet(isPresented: $showingDetails) {
            ReleaseDetailsView(details: releaseDetails)
          }
        }
      }
      .foregroundColor(.black)
      .listStyle(InsetGroupedListStyle())
      .navigationBarTitle("Iron Maiden Releases")
    }
  }
}

struct ReleaseListView_Previews: PreviewProvider {
  static var previews: some View {
    ReleaseListView()
  }
}
