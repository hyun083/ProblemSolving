import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}
var ans = [arr[0]]

for i in 0..<N{
    if ans.last! == arr[i]{
        continue
    }else if ans.last! < arr[i]{
        ans.append(arr[i])
    }else{
        var start = 0
        var end = ans.count-1
        while start<end{
            let mid = (start+end)/2
            if arr[i] <= ans[mid]{
                end = mid
            }else{
                start = mid+1
            }
        }
        ans[start] = arr[i]
    }
}
print(ans.count)