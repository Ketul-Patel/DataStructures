//
//  Node.swift
//  Node
//
//  Created by Ketul Patel on 4/26/15.
//  Copyright (c) 2015 Ketul Patel. All rights reserved.
//
class Node<T> {
    var value: T?
    init(value: T?) {
        self.value = value
        println("Initialized Node with value \(self.value!)")
    }
    deinit {
        println("Deinitialized Node with value \(self.value!)")
    }
}
