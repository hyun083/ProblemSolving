import Foundation

let T = Int(readLine()!)!
var arr = Array(repeating: 0, count: 80001)
arr[3] = 3

for num in 4...80000{
    arr[num] = arr[num-1]
    if num%3==0 || num%7==0{ arr[num] += num }
}

for N in readLine()!.split(separator: " ").map({Int($0)!}){
    print(arr[N])
}