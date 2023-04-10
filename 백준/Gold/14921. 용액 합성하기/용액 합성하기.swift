import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var left = 0
var right = n-1
var result = 200000001
while left < right{
    let sum = arr[left]+arr[right]
    if sum == 0{
        result = 0
        break
    }
    if sum<0{
        left += 1
    }
    if sum>0{
        right -= 1
    }
    result = abs(result)<abs(sum) ? result:sum
}
print(result)