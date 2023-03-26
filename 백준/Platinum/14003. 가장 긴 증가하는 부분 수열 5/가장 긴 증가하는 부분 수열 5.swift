import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}
var LIS = [Int]()
var idx = Array(repeating: 0, count: N)

for i in 0..<N{
    if LIS.isEmpty{
        LIS.append(arr[i])
        idx[i] = 0
    }else if LIS.last! < arr[i]{
        LIS.append(arr[i])
        idx[i] = LIS.count-1
    }else{
        var start = 0
        var end = LIS.count-1
        while start < end{
            let mid = (start+end)/2
            if LIS[mid] >= arr[i]{
                end = mid
            }else{
                start = mid+1
            }
        }
        LIS[start] = arr[i]
        idx[i] = start
    }
}

var target = LIS.count-1
var ans = [String]()
for i in (0..<N).reversed(){
    if idx[i] == target{
        ans.append("\(arr[i])")
        target-=1
    }
}
print(LIS.count)
print(ans.reversed().joined(separator: " "))