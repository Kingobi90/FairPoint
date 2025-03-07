import Foundation
import SwiftData

@Model
class ArgumentModel {
    var id: UUID = UUID()
    var text: String

    init(text: String) {
        self.text = text
    }
}
