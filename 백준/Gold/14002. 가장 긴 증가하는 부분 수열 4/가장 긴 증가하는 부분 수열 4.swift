import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp = Array(repeating: 1, count: n)
var ans = Array(repeating: [String](), count: n)

for last in 0..<n{
    ans[last] = ["\(arr[last])"]
    for number in 0..<last{
        if arr[number] < arr[last]{
            if dp[last] < dp[number]+1{
                dp[last] = dp[number]+1
                ans[last] = ans[number] + ["\(arr[last])"]
            }
        }
    }
}
let idx = dp.firstIndex(of: dp.max()!)!
print(dp[idx])
print(ans[idx].joined(separator: " "))