public func getData () -> [ReleaseDetails] {
  if let localData = readReleasesFile() {
    let parsedReleases = parseReleases(jsonData: localData)
    var releases: [ReleaseDetails] = []
    
    parsedReleases.forEach { release in
      releases.append(
        ReleaseDetails(
          date: release.date,
          title: release.title,
          producers: release.producers,
          studio: release.studio,
          recorded: release.recorded,
          image: release.image,
          key: release.key
        )
      )
    }
    
    return releases
  }
  
  return []
}

public struct Releases {
  static let allReleases = getData()
}
