//
//  BinarySearchTreeNode.swift
//  Node
//
//  Created by Ketul Patel on 4/26/15.
//  Copyright (c) 2015 Ketul Patel. All rights reserved.
//

class BinarySearchTreeNode<T>: Node<T> {
    var left: BinarySearchTreeNode<T>?
    var right: BinarySearchTreeNode<T>?
    init(value: T, leftNode: BinarySearchTreeNode<T>?, rightNode: BinarySearchTreeNode<T>?) {
        self.left = leftNode
        self.right = rightNode
        super.init(value: value)
    }
}