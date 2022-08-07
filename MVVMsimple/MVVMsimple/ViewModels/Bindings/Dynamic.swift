//
//  Dynamic.swift
//  MVVMsimple
//
//  Created by SERGEI on 03.08.2022.
//

import Foundation

class Dynamic<T>{
    typealias Listner = <T> -> Void
    
    private var listener: Listner?
    
    func bind(_ listener: Listner?){
        self.listener = listener
    }
}
