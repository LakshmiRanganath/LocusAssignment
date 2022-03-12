//
//  LinkNode.swift
//  Locus
//
//  Created by Lakshmi H R on 11/03/22.
//

import Foundation

import Foundation
class LinkNode<K,V> {
    var key: K
    var value: V
    var next: LinkNode?
    var prev: LinkNode?
    
    init(_ key: K, _ value: V) {
        self.key = key
        self.value = value
    }
}
