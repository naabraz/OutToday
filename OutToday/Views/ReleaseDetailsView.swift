import SwiftUI

struct ReleaseDetailsView: View {
  var details: ReleaseDetails
  
  var body: some View {
    ZStack{
      Color(UIColor.black)
      VStack {
        VStack(alignment: .center) {
          Image(details.image)
            .resizable()
            .scaledToFit()
          HStack {
            Text(details.title)
              .font(.title2)
              .bold()
          }
          .padding([.bottom])
          Text("Release Date:")
            .bold()
            .font(.title3)
          Text(details.date)
            .padding([.bottom])
          if ((details.producers) != nil) {
            Text("Producers:")
              .bold()
              .font(.title3)
              Text(details.producers!)
              .padding([.bottom])
          }
          if ((details.studio) != nil) {
            Text("Studio:")
              .bold()
              .font(.title3)
            Text(details.studio!)
              .padding([.bottom])
          }
          if ((details.recorded) != nil) {
            Text("Recorded:")
              .bold()
              .font(.title3)
            Text(details.recorded!)
              .padding([.bottom])
          }
        }
      }
      .padding([.all])
      .foregroundColor(.white)
    }
  }
}

struct ReleaseDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    let releasePreview = ReleaseDetails(
      date: "04 September 2015",
      title: "The Book of Souls",
      producers: "Kevin Shirley, Steve Harris",
      studio: "Parlophone, Sanctuary Copyrights/BMG (US)",
      recorded: "Guillaume Tell Studios",
      image: "album-the-book-of-souls",
      key: "0000"
    )

    ReleaseDetailsView(details: releasePreview)
  }
}
