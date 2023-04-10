import Foundation

let L = Int(readLine()!)!
let inputs = readLine()!
var arr = Array<Int>()
var sum = 0
let r = 31.0
let M = 1234567891

for i in inputs{
    arr.append(Int(i.asciiValue! - 96))
}

for idx in arr.indices{
    sum += arr[idx] * Int(pow(r,Double(idx)))
}
print(sum % M)