import Foundation

let x = Int(readLine()!)!
var ans = ["U","O","S"]
let idx = (x%3)==0 ? 3:x%3
print(ans[idx-1])