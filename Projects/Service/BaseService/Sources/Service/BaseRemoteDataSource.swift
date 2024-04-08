import Alamofire
import Foundation

open class BaseRemoteDataSource<Service> {
    
    public init() {}
    
    public func requestGet<Res: Decodable>(
        url: String,
        req: Parameters, _ res: Res.Type
    ) async throws -> Res {
        try await AF.request(
            url,
            method: .get,
            parameters: req,
            encoding: URLEncoding.default
        )
        .validate()
        .serializingDecodable(res).value
    }
    
    public func requestPost<Res: Decodable>(
        url: String,
        res: Res.Type
    ) async throws -> Res {
        try await AF.request(
            url,
            method: .post
        )
        .validate()
        .serializingDecodable(res).value
    }
    
    public func requestPost<Req: Encodable, Res: Decodable>(
        url: String,
        req: Req,
        res: Res.Type,
        encoder: ParameterEncoder = JSONParameterEncoder.default
    ) async throws -> Res {
        try await AF.request(
            url,
            method: .post,
            parameters: req,
            encoder: encoder
        )
        .validate()
        .serializingDecodable(res).value
    }
}
