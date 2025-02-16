import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}
var ans = [Int]()
var myMin = Int.max
var tmp = 0

for num in arr{
    myMin = min(myMin, num)
    tmp = max(tmp, num-myMin)
    ans.append(tmp)
}

for num in ans {
    print(num, terminator: " ")
}