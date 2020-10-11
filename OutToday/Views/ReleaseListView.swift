import SwiftUI

struct ReleaseListView: View {
  let releases = ReleaseProvider.getAllReleases()
  @State private var showingDetails = false
  
  var body: some View {
    NavigationView {
      List {
        ForEach(releases) { releaseDetails in
          Button(action: {
            showingDetails.toggle()
          }, label: {
            ReleaseItemView(title: releaseDetails.title)
          })
        }
      }
      .foregroundColor(.black)
      .listStyle(InsetGroupedListStyle())
      .navigationBarTitle("Iron Maiden Releases")
    }
  }
}

struct ReleaseItemView: View {
  let title: String
  
  var body: some View {
    Text("\(title)")
      .font(.title3)
      .padding([.top, .bottom])
  }
}

struct ReleaseListView_Previews: PreviewProvider {
  static var previews: some View {
    ReleaseListView()
  }
}
