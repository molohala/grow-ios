import Alamofire
import Foundation

public class InfinitySession {
    static let session: Session = {
        let configuration = URLSessionConfiguration.af.default
        let apiLogger = APIEventLogger()
        let session = Session(configuration: configuration, interceptor: AuthInterceptor(), eventMonitors: [apiLogger])
        return session
    }()
}

open class BaseRemoteDataSource<Service> {
    
    public init() {
    }
    
    @discardableResult
    public func requestGet<Res: Decodable>(
        url: String,
        res: Res.Type
    ) async throws -> Res {
        try await InfinitySession.session.request(
            url,
            method: .get
        )
        .validate()
        .serializingDecodable(res).value
    }
    
    @discardableResult
    public func requestPost<Res: Decodable>(
        url: String,
        res: Res.Type
    ) async throws -> Res {
        try await InfinitySession.session.request(
            url,
            method: .post
        )
        .validate()
        .serializingDecodable(res).value
    }
    
    @discardableResult
    public func requestPost<Req: Encodable, Res: Decodable>(
        url: String,
        req: Req,
        res: Res.Type,
        encoder: ParameterEncoder = JSONParameterEncoder.default
    ) async throws -> Res {
        try await InfinitySession.session.request(
            url,
            method: .post,
            parameters: req,
            encoder: encoder
        )
        .validate()
        .serializingDecodable(res).value
    }
    
    @discardableResult
    public func requestPatch<Res: Decodable>(
        url: String,
        res: Res.Type
    ) async throws -> Res {
        try await InfinitySession.session.request(
            url,
            method: .patch,
            encoding: JSONEncoding.default
        )
        .validate()
        .serializingDecodable(res).value
    }
    
    @discardableResult
    public func requestPatch<Req: Encodable, Res: Decodable>(
        url: String,
        req: Req,
        res: Res.Type,
        encoder: ParameterEncoder = JSONParameterEncoder.default
    ) async throws -> Res {
        try await InfinitySession.session.request(
            url,
            method: .patch,
            parameters: req,
            encoder: encoder
        )
        .validate()
        .serializingDecodable(res).value
    }
    
    @discardableResult
    public func requestDelete<Res: Decodable>(
        url: String,
        res: Res.Type
    ) async throws -> Res {
        try await InfinitySession.session.request(
            url,
            method: .delete,
            encoding: JSONEncoding.default
        )
        .validate()
        .serializingDecodable(res).value
    }
    
    @discardableResult
    public func requestDelete<Req: Encodable, Res: Decodable>(
        url: String,
        req: Req,
        res: Res.Type,
        encoder: ParameterEncoder = JSONParameterEncoder.default
    ) async throws -> Res {
        try await InfinitySession.session.request(
            url,
            method: .delete,
            parameters: req,
            encoder: encoder
        )
        .validate()
        .serializingDecodable(res).value
    }
}
