public func getData () -> [ReleaseDetails] {
  if let localData = readLocalFile(forName: "Releases") {
    return parse(jsonData: localData)
  }
  
  return []
}

public struct Releases {
  static let allReleases = getData()
}
