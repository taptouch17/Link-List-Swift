//
//  Link List.swift
//  Link List
//
//  Created by Jelani on 16/05/2017.
//  Copyright © 2017 Tap. TOUCH. All rights reserved.
//

import Foundation



public class Node<T> {
    var value: T
    var next: Node<T>?
    
    weak var previous: Node<T>?
    init(value: T) {
        self.value = value
    }
    
   
    
    
}

public class LinkedList<T> {
    fileprivate var head: Node<Any>?
    private var tail: Node<Any>?
    
    
    private var isEmpty: Bool {
        return head == nil
    }
    
    
    private var first: Node<Any>? {
        return head
    }
    
    private var last: Node<Any>? {
        return tail
    }
    
    
    
    public func append(value: Any){
    let newNode = Node(value: value)
        
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        }
        
        else {
            head = newNode
        }
        tail = newNode
    }
    
    public func nodeAt(index: Int) -> Node<Any>? {
        if index >= 0 {
            var node = head
            var i = index
            
            while node != nil {
                if i == 0 {return node }
                i -= 1
                node = node!.next
            }
        }
        return nil
    }
    
    public func removeAll(){
        head = nil
        tail = nil
    }
    
    public func remove(node: Node<Any>) -> String{
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev
        
        if next == nil {
            tail = prev
        }
        
        node.previous = nil
        node.next = nil
        
        return node.value as! String
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String
    {
        var text = "["
        var node = head
        
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil {
                text += ","
            }
        }
        return text + "]"
    }
}
