//
//  main.swift
//  2108_swift
//
//  Created by Hyun on 2021/11/25.
//

import Foundation

let N = Int(readLine()!)!
var numbers = [Int]()
var sum = 0
var arr = Array(repeating: 0, count: 8001)

for _ in 1...N{
    let number = Int(readLine()!)!
    arr[number+4000] += 1
    sum += number
    numbers.append(number)
}

var cntArr = [[Int]]()
for idx in arr.indices{
    if arr[idx] != 0{
        cntArr.append([idx-4000,arr[idx]])
    }
}
cntArr.sort(by: {$0[1] > $1[1]})

print(Int(round(Double(sum)/Double(N))))
print(numbers.sorted(by: <)[N/2])

if(cntArr.count > 1){
    if(cntArr[0][1] == cntArr[1][1]){
        let max = cntArr[0][1]
        var lastArr = Array<Int>()
        for cnt in cntArr{
            if cnt[1] == max{
                lastArr.append(cnt[0])
            }
        }
        lastArr.sort(by: <)
        print(lastArr[1])
    }else{
        print(cntArr[0][0])
    }
}else{
    print(cntArr[0][0])
}

print(numbers.max()! - numbers.min()!)
