import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.map{Int(String($0))!}
var odd = 0
var even = 0
for num in arr{
    even += num%2==0 ? 1:0
    odd += num%2==0 ? 0:1
}
print(even==odd ? -1:even>odd ? 0:1)