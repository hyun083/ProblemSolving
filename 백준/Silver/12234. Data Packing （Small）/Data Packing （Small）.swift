import Foundation

let T = Int(readLine()!)!
for t in 1...T{
    let NX = readLine()!.split(separator: " ").map{Int($0)!}
    let N = NX[0]
    let X = NX[1]
    var arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted()
    var left = 0
    var right = N-1
    var ans = 0
    
    while left<right{
        if arr[left] + arr[right] > X{
            ans += 1
            right -= 1
        }else{
            ans += 1
            left += 1
            right -= 1
        }
    }
    if left==right{ ans += 1}
    print("Case #\(t): \(ans)")
}