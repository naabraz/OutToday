import Foundation

struct ReleasesJSON: Codable {
  let Releases: [ReleaseDetails]
}

public func readLocalFile(forName name: String) -> Data? {
  do {
    if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
       let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
      return jsonData
    }
  } catch {
    print(error)
  }
  
  return nil
}

public func parse(jsonData: Data) -> [ReleaseDetails] {
  do {
    let decodedData = try JSONDecoder().decode(ReleasesJSON.self, from: jsonData)
    return decodedData.Releases
  } catch {
    print("Error on JSON decoding")
  }
  
  return []
}

