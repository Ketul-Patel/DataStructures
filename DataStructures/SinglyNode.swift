//
//  SinglyNode.swift
//  Node
//
//  Created by Ketul Patel on 4/26/15.
//  Copyright (c) 2015 Ketul Patel. All rights reserved.
//

class SinglyNode<T>: Node<T> {
    var next: SinglyNode<T>?
    init(value: T, nextNode: SinglyNode<T>?) {
        self.next = nextNode
        super.init(value: value)
    }
}
