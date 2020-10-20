import SwiftUI

func orderReleases() -> [ReleaseDetails] {
  let releases = Releases.allReleases
  
  return releases.sorted(by: { $0.title < $1.title })
}

struct ReleaseListView: View {
  let releases = orderReleases()

  @State private var visibleReleaseDetails: ReleaseDetails?
  
  var body: some View {
    NavigationView {
      List {
        ForEach(releases) { releaseDetails in
          Button(action: {
            visibleReleaseDetails = releaseDetails
          }, label: {
            ReleaseItemView(title: releaseDetails.title, image: releaseDetails.image)
          })
        }
      }
      .foregroundColor(.primary)
      .listStyle(InsetGroupedListStyle())
      .navigationBarTitle("Releases")
    }
    .onOpenURL { url in
      guard let releaseDetails = releases.first(where: { $0.url == url }) else { return }
      visibleReleaseDetails = releaseDetails
    }
    .sheet(item: $visibleReleaseDetails, content: { releaseDetails in
      ReleaseDetailsView(details: releaseDetails)
    })
  }
}

struct ReleaseListView_Previews: PreviewProvider {
  static var previews: some View {
    ReleaseListView()
  }
}
