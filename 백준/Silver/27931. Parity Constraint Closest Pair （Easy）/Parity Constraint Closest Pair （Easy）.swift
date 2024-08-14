import Foundation

let MAX = 2000000001
let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)
var left = 0
var right = 1
var ans = [MAX,MAX]

while right<N{
    let num = arr[right]-arr[left]
    if num%2==0{
        ans[0] = min(ans[0], num)
    }else{
        ans[1] = min(ans[1], num)
    }
    left += 1
    right += 1
}
left = 0
right = 2
while right<N{
    let num = arr[right]-arr[left]
    if num%2==0{
        ans[0] = min(ans[0], num)
    }else{
        ans[1] = min(ans[1], num)
    }
    left += 1
    right += 1
}
print(ans[0]==MAX ? -1:ans[0], ans[1]==MAX ? -1:ans[1])