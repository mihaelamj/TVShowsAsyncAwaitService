//
//  File.swift
//  
//
//  Created by iMacPro on 06.12.2021..
//

import RequestAdapter
import TVShowsResponseResults
import TVShowsEndpoint

// MARK: - TVShowsRxAPI -

public struct API {
    
  // MARK: Typealiases -
  
    public typealias ReqAdapter = RequestAdapter.Adapter
    public typealias TVSEndpoint = TVShowsEndpoint.Endpoint
    
    // MARK: Properties -
    
    var adapters: [ReqAdapter]
    
    // MARK: Init -
    
    public init(adapters: [RequestAdapter.Adapter] = []) {
        self.adapters = adapters
    }
}
