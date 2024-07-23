import Foundation

//JSON 데이터를 Swift 객체로 변환하는 기능을 제공
public struct BoardResponse: Decodable {
    public let title: String
    public let content: String
}
