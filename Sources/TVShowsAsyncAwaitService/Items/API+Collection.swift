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

//public extension API {
//  func getCollection<T>(ofType: T.Type, dataRequest: DataRequest, decodingStrategy: JSONDecoder.KeyDecodingStrategy) where T: Decodable {
//  }
//}

public extension API {
  
  func getCollection<T>(ofType: T.Type, dataRequest: DataRequest, decodingStrategy:
                        JSONDecoder.KeyDecodingStrategy) async throws where T: Decodable {
    
    try await withUnsafeThrowingContinuation { continuation in // error: Generic parameter 'T' could not be inferred
      
      self.adapters.forEach { $0.beforeSend(dataRequest.request) }
      
      dataRequest
        .validate()
        .responseData { data in
          
          self.adapters.forEach { $0.onResponse(response: data.response, data: data.data) }
          
          guard let data = data.data else {
            let error = data.error ?? AFError.explicitlyCancelled // INFO: Maybe change the error type to something decoding related -
            self.adapters.forEach { $0.onError(request: dataRequest.request, error: error) }
            
            continuation.resume(throwing: error) //single(.failure(error))
            return
            
          }

          do {
            let decoder = TVShowsEndpoint.Endpoint.makeDecoder(decodingStrategy: decodingStrategy)
            let result = try decoder.decode(TVShowsResponseResults.Collection<T>.self, from: data)
            let items: [T] = result.results ?? [] // INFO: Maybe return an error here, if empty -
            self.adapters.forEach { $0.onSuccess(request: dataRequest.request) }
            
            continuation.resume(returning: items) //single(.success(items))
            return
            
          } catch {
            self.adapters.forEach { $0.onError(request: dataRequest.request, error: error) }
            
            continuation.resume(throwing: error) //single(.failure(error))
            return
            
          }
          
          
        }
      
    }
    
  }
}

public struct TestTest {
  func afRequest(url: URL) async throws -> Data {
      try await withUnsafeThrowingContinuation { continuation in
          AF.request(url, method: .get).validate().responseData { response in
              if let data = response.data {
                  continuation.resume(returning: data)
                  return
              }
              if let err = response.error {
                  continuation.resume(throwing: err)
                  return
              }
              fatalError("Error while doing Alamofire url request")
          }
      }
  }


  func getALlStrings() async -> [String] {
      var allChains: [String] = [String]()
      let url = URL(string: "https://www.google.com")

      do {
          let undecodedData = try await self.afRequest(url: url!)
          let decodedData = try JSONDecoder().decode([String].self, from: undecodedData)
          allChains = decodedData
      } catch {
          print(error)
      }

      return allChains
  }
}
