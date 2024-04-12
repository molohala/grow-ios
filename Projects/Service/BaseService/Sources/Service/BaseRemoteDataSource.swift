import Alamofire
import Foundation

open class BaseRemoteDataSource<Service> {
    
    public init() {}
    
    public func requestGet<Res: Decodable>(
        url: String,
        res: Res.Type
    ) async throws -> Res {
        try await AF.request(
            url,
            method: .get
        )
        .validate()
        .serializingDecodable(res).value
    }
    
    public func requestGet<Req: Encodable, Res: Decodable>(
        url: String,
        req: Req, _ res: Res.Type
    ) async throws -> Res {
        try await AF.request(
            url,
            method: .get,
            parameters: req,
            encoder: URLEncodedFormParameterEncoder.default
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
    
    public func requestPatch<Req: Encodable, Res: Decodable>(
        url: String,
        req: Req,
        res: Res.Type,
        encoder: ParameterEncoder = JSONParameterEncoder.default
    ) async throws -> Res {
        try await AF.request(
            url,
            method: .patch,
            parameters: req,
            encoder: encoder
        )
        .validate()
        .serializingDecodable(res).value
    }
    
    public func requestDelete<Res: Decodable>(
        url: String,
        res: Res.Type
    ) async throws -> Res {
        try await AF.request(
            url,
            method: .delete,
            encoding: JSONEncoding.default
        )
        .validate()
        .serializingDecodable(res).value
    }
    
    public func requestDelete<Req: Encodable, Res: Decodable>(
        url: String,
        req: Req,
        res: Res.Type,
        encoder: ParameterEncoder = JSONParameterEncoder.default
    ) async throws -> Res {
        try await AF.request(
            url,
            method: .delete,
            parameters: req,
            encoder: encoder
        )
        .validate()
        .serializingDecodable(res).value
    }
}
