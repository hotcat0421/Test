import Foundation
import Moya

final class PostViewModel: ObservableObject {
    //변수 내용을 저장, 변경되면 자동으로 뷰 업데이트함
    @Published var title = ""
    @Published var content = ""
    //Moya 라이브러리를 사용하여 API 요청을 처리하는 PostProvider를 생성
    private let PostProvider = MoyaProvider<API>()
    //게시물을 서버에 제출하기 위한 기능,title과 content를 인자로 받아서 PostProvider를 통해 서버로 요청을 보냄
    func SubmitPost(title: String, content: String) {
        let request = BoardRequest(title: title, content: content)
        // Print the complete URL for debugging
        //print("Request URL: \(PostProvider.endpoint(.fetchPost(data: request)).url.absoluteString ?? "")")
        
        PostProvider.request(.fetchPost(data: request)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                switch statusCode {
                case 200..<300:
                    print("Success: \(statusCode)")
                    // Handle successful response
                    // Example: parse response data if needed
                default:
                    // Print response data for debugging
                    print(result)
                    print("Unexpected status code: \(statusCode)")
                    print(String(data: response.data, encoding: .utf8) ?? "")
                }
            case .failure(let error):
                // Print detailed error message
                print("Network request failed: \(error.localizedDescription)")
            }
        }
    }
}
