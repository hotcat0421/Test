import Foundation
import Moya

//제공하는 서비스들을 정의
public enum API {
    case fetchPost(data : BoardRequest) //요청
    case deletePost(boardID: Int)
    case pathPost(data : BoardRequest, boardID: Int)
    case getPost(get: Response, boardID: Int)
}
// -BaseUrl: 기본 도메인 작성
extension API: TargetType {
    public var baseURL: URL {
        return URL(string: "https://port-0-mindway-8th-assignment-backend-rm6l2llvxqc0bt.sel5.cloudtype.app/board/")!
    }
// -Path: 기본 Path를 정의 (endpoint 작성)
    public var path: String {
        switch self {
        case .fetchPost:
            return ""
        case .deletePost(let boardID):
            return "\(boardID)"
        case .pathPost(let boardID):
            return "\(boardID)"
        case .getPost(let boardID):
            return "\(boardID)"
        }
    }
// -Method: 어떤 방식으로 통신 할 것이냐
    public var method: Moya.Method {
        switch self {
        case .fetchPost:
            return .post
        case .deletePost:
            return .delete
        case .pathPost:
            return .put
        case .getPost:
            return .get
        }
    }
// -task: 어떻게 데이터를 전송 할 것이냐
    public var task: Task {
        switch self {
        case .deletePost, .pathPost, .getPost:
            return .requestPlain
        case .fetchPost(let data):
            return .requestJSONEncodable(data)
        }
    }
// -headers: 헤더에 어떤 값을 넣을 것이냐
//Moya 라이브러리에서 headers 속성은 네트워크 요청에 포함될 HTTP 헤더를 정의하는 데 사용
    public var headers: [String : String]? {
        switch self {
        default:
//            API 요청의 본문이 JSON 형식이라는 것을 나타냄
            return ["Content-Type": "application/json"]
        }
    }
}

