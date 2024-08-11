import Foundation

let C = Double(readLine()!)!
let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}

var c = Int(C/(0.99))>2 ? 2:Int(C/(0.99))
var left = 0
var right = 0
var day = 0
var tmp = 0

while left<N{
    var curr = 0
    if right==N || tmp>c{
        curr = arr[left]
        tmp -= curr==0 ? 1:0
        left += 1
    }else{
        curr = arr[right]
        tmp += curr==0 ? 1:0
        right += 1
    }
    
    if tmp<=c{
        day = max(day,right-left)
    }
}
print(day)
print(arr.max()!)