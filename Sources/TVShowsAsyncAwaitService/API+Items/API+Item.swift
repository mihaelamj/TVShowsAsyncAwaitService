//
//  API+Item.swift
//  
//
//  Created by iMacPro on 06.12.2021..
//

import Foundation
import Alamofire
import RequestAdapter
import TVShowsEndpoint
import TVShowsResponseResults

public extension API {
  func getItem<T>(dataRequest: DataRequest, decodingStrategy: JSONDecoder.KeyDecodingStrategy) where T: Decodable {
  }
}
