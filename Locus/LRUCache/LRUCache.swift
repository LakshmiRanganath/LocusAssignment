//
//  LRUCache.swift
//  Locus
//
//  Created by Lakshmi H R on 11/03/22.
//

import Foundation
import UIKit

class LRUCache<K : Hashable, V> {
    
    let capacity: Int
    // The number of values currently being stored
    private var countOfElementsInCache = 0
    //Cache dictionary
    private var elementsInCache = [K: LinkNode<K,V>]()
    // The most recently used node
    private var head: LinkNode<K, V>?
    // The least recently used node
    private var tail: LinkNode<K, V>?
    
    //LRUCache initialisation with capacity
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    //MARK: - Fetch value needed from cache
    func get(_ key: K) -> V? {
        guard let nodeToBeUsed = elementsInCache[key] else {
            return nil
        }
        moveNodeToHeadOfCache(nodeToMove: nodeToBeUsed)
        return nodeToBeUsed.value
    }
    
    //MARK: - Add value to cache
    func put(_ key: K, _ value: V) {
        // Key already exists
        if let existingNode = elementsInCache[key]{
            existingNode.value = value
            moveNodeToHeadOfCache(nodeToMove: existingNode)
            return
        }
        // Add node to cache if countOfElementsInCache is less than cache capacity
        if countOfElementsInCache < capacity {
            let newNode = LinkNode(key, value)
            
            if let prevHead = self.head {
                self.head = newNode
                self.head?.next = prevHead
                prevHead.prev = newNode
            }
            else {
                self.head = newNode
            }
            if self.tail == nil {
                self.tail = newNode
            }
            elementsInCache[key] = newNode
            countOfElementsInCache += 1
            
            return
        }
        // else Replace least-used key i.e., tail and move the replaced tail element to head
        if let nodeToReplaceTail = self.tail {
            elementsInCache[nodeToReplaceTail.key] = nil
            nodeToReplaceTail.key = key
            nodeToReplaceTail.value = value
            elementsInCache[key] = nodeToReplaceTail
            moveNodeToHeadOfCache(nodeToMove: nodeToReplaceTail)
            return
        }
    }
    
    //MARK: - Check if value is present in cache
    func isValid(key: K) -> Bool {
        return elementsInCache.keys.contains(key)
    }
    
    //MARK: - Moves nodeToMove to the head of the cache list
    private func moveNodeToHeadOfCache(nodeToMove : LinkNode<K,V>) {
        
        guard nodeToMove !== head else { return }
        let previousNodeOfNodeToMove = nodeToMove.prev
        let nextNodeOfNodeToMove = nodeToMove.next

        previousNodeOfNodeToMove?.next = nextNodeOfNodeToMove
        nextNodeOfNodeToMove?.prev = previousNodeOfNodeToMove

        nodeToMove.next = head
        nodeToMove.prev = nil

        if nodeToMove === tail {
            tail = previousNodeOfNodeToMove
        }

        self.head = nodeToMove
    }

}

