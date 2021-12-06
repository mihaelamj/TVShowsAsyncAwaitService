//
//  Service.swift
//  
//
//  Created by iMacPro on 06.12.2021..
//

import Foundation
import RequestAdapter

public struct Service {
  
  public static func showsAPI() -> API {
    return API(adapters: [LogAdapter(logLevel: .debug)])
  }
  
  public static func userAPI() -> API {
    return API(adapters: [LogAdapter(logLevel: .debug), UserAuthAdapter()])
  }
}
