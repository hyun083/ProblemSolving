import Foundation

let N = readLine()!
let ans = readLine()!.split(separator: " ").filter{$0==N}.count
print(ans)