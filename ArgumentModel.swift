import SwiftData
import Foundation

@Model
class ArgumentModel {
    var topic: String
    var goalForArgument: String
    var user1Perspective: String
    var user2Perspective: String
    var user1UnderstandingOfUser2: String
    var user2UnderstandingOfUser1: String
    var timestamp: Date

    init(
        topic: String,
        goalForArgument: String,
        user1Perspective: String,
        user2Perspective: String,
        user1UnderstandingOfUser2: String,
        user2UnderstandingOfUser1: String,
        timestamp: Date = Date()
    ) {
        self.topic = topic
        self.goalForArgument = goalForArgument
        self.user1Perspective = user1Perspective
        self.user2Perspective = user2Perspective
        self.user1UnderstandingOfUser2 = user1UnderstandingOfUser2
        self.user2UnderstandingOfUser1 = user2UnderstandingOfUser1
        self.timestamp = timestamp
    }
}
