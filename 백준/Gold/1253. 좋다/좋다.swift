import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)
var cnt = 0
for i in 0..<n{
    var start = 0
    var end = arr.count-1
    let target = arr[i]
    while start<end{
        let sum = arr[start]+arr[end]
        if sum == target{
            if start != i && end != i{
                cnt += 1
                break
            }else if start == i{
                start += 1
            }else if end == i{
                end -= 1
            }
        }
        if sum < target{
            start += 1
        }
        if sum > target{
            end -= 1
        }
    }
}
print(cnt)