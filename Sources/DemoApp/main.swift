import Foundation
import SwiftHoedown

func url(location: String = #file) -> URL {
    URL(fileURLWithPath: location).deletingLastPathComponent()
}

func contentOfFile(_ file: String,
                   inSubDirectory directory: String = "",
                   location: String = #file) throws -> String {
    var testDirectory = url(location: location)

    if directory != "" { testDirectory = testDirectory.appendingPathComponent(directory) }
    let fileURL = testDirectory.appendingPathComponent(file)
    return try String(contentsOf: fileURL)
}

let sample = try contentOfFile("sample.md", inSubDirectory: "../../")

if let html = Hoedown.renderHTMLForMarkdown(sample) {
    print(html)
}
