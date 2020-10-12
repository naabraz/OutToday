public struct Releases {
  static let allReleases = [
    "1110": ReleaseDetails(
      date: "04 September 2015",
      title: "The Book of Souls",
      producers: "Kevin Shirley, Steve Harris",
      studio: "Parlophone, Sanctuary Copyrights/BMG (US)",
      recorded: "Guillaume Tell Studios",
      image: "album-the-book-of-souls",
      key: "1110"
    ),
    "1210": ReleaseDetails(
      date: "16 August 2010",
      title: "The Final Frontier",
      producers: "Kevin Shirley, Steve Harris",
      studio: "EMI UME, Sony (United States)",
      recorded: "Compass Point Studios, The Cave Studios",
      image: "album-final-frontier",
      key: "1210"
    )
  ]
  
  static let emptyRelease = ReleaseDetails(
    date: "Empty",
    title: "No release today :(",
    producers: "Empty",
    studio: "Empty",
    recorded: "Empty",
    image: "Empty",
    key: "0000"
  )
}
