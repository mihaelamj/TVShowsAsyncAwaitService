//
//  UserAuthAdapter.swift
//  
//
//  Created by iMacPro on 06.12.2021..
//

import Foundation
import RequestAdapter
import TVShowsEndpoint

public struct UserAuthAdapter : API.ReqAdapter {
  func onResponse(response: URLResponse?, data: Data?) {
    if let urlResponse = response as? HTTPURLResponse {
      TVShowsEndpoint.UserAuthData.saveToRepositoryFrom(urlResponse: urlResponse)
    }
  }
}
