import Foundation

let X = Int(readLine()!)!
var sum = 64
var arr = [64]

while sum > X{
    let tmp = arr.removeLast()/2
    if sum - tmp >= X{
        sum -= tmp
        arr.append(tmp)
    }else{
        arr.append(tmp)
        arr.append(tmp)
    }
}

print(arr.count)