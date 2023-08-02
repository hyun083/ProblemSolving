import Foundation

let arr = readLine()!.split(separator: " ").map{Int($0)!}
let ans = (arr[0]*arr[1]) - arr[2]
print(ans<0 ? 0:ans)