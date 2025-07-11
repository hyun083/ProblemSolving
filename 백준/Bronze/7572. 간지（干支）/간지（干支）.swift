import Foundation

let pre = ["6","7","8","9","0","1","2","3","4","5"]
let post = ["I","J","K","L","A","B","C","D","E","F","G","H"]
var arr = [String]()
var preIdx = 0
var postIdx = 0

for _ in 0..<60{
    arr.append(post[postIdx]+pre[preIdx])
    preIdx = preIdx+1 == 10 ? 0 : preIdx+1
    postIdx = postIdx+1 == 12 ? 0 : postIdx+1
}

let num = Int(readLine()!)!
print(arr[num%60])