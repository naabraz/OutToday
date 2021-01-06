import Foundation

struct ReleasesJSON: Codable {
  let Releases: [ReleaseDetails]
}

public func readReleasesFile() -> Data? {
  do {
    if let bundlePath = Bundle.main.path(forResource: "Releases", ofType: "json"),
       let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
        return jsonData
    }
  } catch {
    print(error)
  }
  
  return nil
}

public func parseReleases(jsonData: Data) -> [ReleaseDetails] {
  do {
    let decodedJSON = try JSONDecoder().decode(ReleasesJSON.self, from: jsonData)
    return decodedJSON.Releases
  } catch {
    print("Error on JSON decoding")
  }

  return []
}

