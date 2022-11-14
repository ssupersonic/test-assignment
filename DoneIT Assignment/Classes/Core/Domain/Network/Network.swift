//
//  Network.swift
//  DoneIT Assignment
//
//  Created by Olexii Strilets on 14.11.2022.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift

final class Network<T: Codable> {
    
    private let endpoint: String = NetworkConfig.baseURL
    private let scheduler: ConcurrentDispatchQueueScheduler
    
    init() {
        self.scheduler = ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))
    }
    
    func fetchObjects(_ path: String) -> Observable<[T]> {
        let absolutePath = "\(endpoint)\(path)"
        
        return RxAlamofire
            .data(.get, absolutePath)
            .observe(on: scheduler)
            .map {  data -> [T] in
                return try JSONDecoder().decode([T].self, from: data)
            }
    }
    
}
