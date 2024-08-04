import Foundation

let NC = readLine()!.split(separator: " ").map{Int($0)!}
let N = NC[0]
let C = NC[1]

var arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)
var left = 0
var right = N-1
var ans = arr.contains(C) ? 1:0

while left<right{
    let value = arr[left]+arr[right]
    
    if value == C{
        ans = 1
        break
    }else if value < C{
        for mid in left+1..<right{
            if value+arr[mid] == C{
                ans = 1
                break
            }
        }
        left += 1
    }else{
        right -= 1
    }
}
print(ans)