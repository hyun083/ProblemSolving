import Foundation

let N = Int(readLine()!)!
var M = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)
var W = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)

var left = 0
var right = N-1
var ans = 0

while left<N && 0<=right{
    let m = M[left]
    let w = W[right]
    if m<0 && 0<w{
        if abs(m)>w{
            ans += 1
            left += 1
            right -= 1
        }else{
            right -= 1
        }
    }else if 0<m && w<0{
        if m < abs(w){
            ans += 1
            left += 1
            right -= 1
        }else{
            right -= 1
        }
    }else if m<0 && w<0{
        left += 1
    }else if 0<m && 0<w{
        right -= 1
    }
}
print(ans)