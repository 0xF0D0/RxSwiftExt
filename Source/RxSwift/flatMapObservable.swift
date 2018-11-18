//
//  flatMapObservable.swift
//  RxSwiftExt
//
//  Created by 0xF0D0 on 2018. 11. 18..
//  Copyright © 2018년 RxSwiftCommunity. All rights reserved.
//

import RxSwift

extension PrimitiveSequenceType {
    /**
     FlatMap values from primitive sequences.
     - parameter selector: A transform function to apply to each element.
     - returns: flatMapped sequence as Observable<R> type.

     This operator is abbreviation for
     ````
     primitiveSequence.asObservable().flatMap
     ````
     */

    func flatMapObservable<R>(_ selector: @escaping (ElementType) throws -> Observable<R>) -> Observable<R> {
        return primitiveSequence.asObservable().flatMap(selector)
    }
}
