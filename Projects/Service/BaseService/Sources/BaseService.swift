import Alamofire
import Foundation

open class BaseService<Service> {
    
    public init() {}
    
    public func requestGet<Res: Decodable>(url: String, _ req: Parameters, _ res: Res.Type) async throws -> Res {
        try await AF.request(
            URL(string: url)!,
            method: .get,
            parameters: req,
            encoding: URLEncoding.default
        )
        .validate()
        .serializingDecodable(res).value
    }
    
    public func requestPost<Req: Encodable, Res: Decodable>(url: String, _ req: Req, _ res: Res.Type) async throws -> Res {
        try await AF.request(
            URL(string: url)!,
            method: .post,
            parameters: req,
            encoder: JSONParameterEncoder.default
        )
        .validate()
        .serializingDecodable(res).value
    }
}
