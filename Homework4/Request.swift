import Foundation

//Request 구조체는 서버로 전송할 데이터를 정의하는 데 사용
public struct BoardRequest: Codable {
    var title: String
    var content: String
    //초기화 메서드를 통해 Request 구조체의 인스턴스를 쉽게 생성할 수 있다,이 메서드는 특정 title과 content 값을 가진 Request 객체를 생성하는 데 사용
    public init(title: String, content: String) {
        self.title = title
        self.content = content
    }
}
