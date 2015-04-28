//
//  BinarySearchTree.swift
//  Node
//
//  Created by Ketul Patel on 4/26/15.
//  Copyright (c) 2015 Ketul Patel. All rights reserved.
//
import Foundation
struct BinarySearchTree<T: Comparable> {
    var root: BinarySearchTreeNode<T>? = nil
    
    mutating func insertNodeWithValue(val: T) {
        root = insertNodeFor(root, value: val)
    }
    func insertNodeFor(node: BinarySearchTreeNode<T>?, value: T) -> BinarySearchTreeNode<T> {
        if node == nil {
            return BinarySearchTreeNode(value: value, leftNode: nil, rightNode: nil)
        } else {
            if value < node!.value {
                node!.left = insertNodeFor(node!.left, value: value)
            } else {
                node!.right = insertNodeFor(node!.right, value: value)
            }
            return node!
        }
    }
    func inOrder(node: BinarySearchTreeNode<T>?) {
        if node == nil {
            return
        } else {
            inOrder(node!.left)
            println(node!.value)
            inOrder(node!.right)
        }
    }
    func preOrder(node: BinarySearchTreeNode<T>?) {
        if node == nil {
            return
        } else {
            println(node!.value)
            preOrder(node!.left)
            preOrder(node!.right)
        }
    }
    
    func postOrder(node: BinarySearchTreeNode<T>?) {
        if node == nil {
            return
        } else {
            postOrder(node!.left)
            postOrder(node!.right)
            println(node!.value)
        }
    }
}
