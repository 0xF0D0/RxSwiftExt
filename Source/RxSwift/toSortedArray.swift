//
//  toSortedArray.swift
//  RxSwiftExt
//
//  Created by Joan Disho on 17/02/18.
//  Copyright © 2018 RxSwift Community. All rights reserved.
//

import Foundation
import RxSwift

public extension ObservableType {
    /**
     Converts an Observable into another Observable that emits the whole sequence as a single array, sorts it using the provided closure and then terminates.

     - parameter by: A comparator closure to sort emitted elements.
     - returns: An observable sequence containing all the sorted emitted elements as an array.
    */
    func toSortedArray(by: @escaping (E, E) -> Bool) -> Observable<[E]> {
        return toArray().map { $0.sorted(by: by) }
    }
}

public extension ObservableType where E: Comparable {
    /**
     Converts an Observable into another Observable that emits the whole sequence as a single array, sorts it using the provided closure and then terminates.

     - parameter ascending: Should the emitted items be ascendign or descending.
     - returns: An observable sequence containing all the sorted emitted elements as an array.
    */
    func toSortedArray(ascending: Bool = true) -> Observable<[E]> {
        return toSortedArray(by: { ascending ? $0 < $1 : $0 > $1 })
    }
}