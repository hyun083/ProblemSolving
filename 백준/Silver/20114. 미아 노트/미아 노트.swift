import Foundation

let NHW = readLine()!.split(separator: " ").map{Int($0)!}
let N = NHW[0]
let H = NHW[1]
let W = NHW[2]

var arr = [[String]]()
var ans = [String]()
for _ in 0..<H{
    let info = readLine()!.map{String($0)}
    arr.append(info)
}

var curr = 0
while curr < N*W{
    var res = "?"
    for i in 0..<H{
        for k in curr..<curr+W{
            res = arr[i][k]=="?" ? res:arr[i][k]
        }
    }
    ans.append(res)
    curr += W
}
print(ans.joined())