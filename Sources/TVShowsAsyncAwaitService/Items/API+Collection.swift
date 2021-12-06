//
//  API+Collection.swift
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
  func getCollection<T>(ofType: T.Type, dataRequest: DataRequest, decodingStrategy: JSONDecoder.KeyDecodingStrategy) where T: Decodable {
  }
}
