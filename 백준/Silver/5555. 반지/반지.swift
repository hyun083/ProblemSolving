import Foundation

let target = readLine()!.map{String($0)}
let N = Int(readLine()!)!
var ans = 0
for _ in 0..<N{
    let arr = readLine()!.map{String($0)}
    var flag = false
    for i in 0..<10{
        if arr[i] == target[0]{
            var tmp = [String]()
            for i in i..<i+target.count{
                tmp.append(arr[i%10])
            }
            if tmp == target { flag = true}
        }
        if flag{
            ans += 1
            break
        }
    }
}
print(ans)