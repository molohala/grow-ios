//
//  ErrorExt.swift
//  BaseFeature
//
//  Created by hhhello0507 on 8/11/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import Alamofire

public extension Error {
    var code: Int? {
        guard let afError = self as? AFError else {
            return nil
        }
        switch afError {
        case .responseValidationFailed(let reason):
            switch reason {
            case .unacceptableStatusCode(let code):
                return code
            default: return nil
            }
        case .requestRetryFailed(let error, _):
            return error.code
        default: return nil
        }
    }
}
