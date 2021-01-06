public func getData () -> [ReleaseDetails] {
  if let localData = readReleasesFile() {
    return parseReleases(jsonData: localData)
  }
  
  return []
}

public struct Releases {
  static let allReleases = getData()
}
