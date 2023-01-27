//
//  main.swift
//  1394_swift
//
//  Created by Hyun on 2023/01/26.
//

import Foundation

func getCombination<T>(elements:[T], select: Int, repetition: Bool) -> [[T]] {
    func getCombination<T>(elements: ArraySlice<T>, select: Int, repetition: Bool,  partialResult: inout [T], totalResult: inout [[T]]) {
        guard select > 0 else {
            totalResult.append(partialResult)
            return
        }

        guard let firstElement = elements.first else { return }

        let remains = repetition ? elements : elements.dropFirst()

        partialResult.append(firstElement)
        getCombination(elements: remains, select: select-1, repetition: repetition, partialResult: &partialResult, totalResult: &totalResult)
        partialResult.removeLast()

        getCombination(elements: elements.dropFirst(), select: select, repetition: repetition, partialResult: &partialResult, totalResult: &totalResult)
    }

    var result: [[T]] = []
    var partialResult: [T] = []

    getCombination(elements: elements[...], select: select, repetition: repetition, partialResult: &partialResult, totalResult: &result)

    return result
}

let line = readLine()!.map{String($0)}
var output = getCombination(elements: line, select: 1, repetition: true)
print(output.count)
output = getCombination(elements: line, select: 2, repetition: true)
print(output[10])
