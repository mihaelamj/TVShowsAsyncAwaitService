//
//  File.swift
//  
//
//  Created by iMacPro on 06.12.2021..
//

import RequestAdapter
import TVShowsResponseResults
import TVShowsEndpoint

public struct API {
    
    // MARK: Properties -
    
    var adapters: [RequestAdapter.Adapter]
    
    // MARK: Init -
    
    public init(adapters: [RequestAdapter.Adapter] = []) {
        self.adapters = adapters
    }
}
