import Foundation

let RC = readLine()!.split(separator: " ").map{Int($0)!}
let R = RC[0]
let C = RC[1]
var map = [String]()
var record = Dictionary<Int, Int>()
var ans = Array(repeating: -1, count: 10)

for _ in 0..<R{
    let arr:[String] = readLine()!.map{String($0)}.reversed()
    var cnt = 0
    for i in 1..<C{
        if arr[i]=="."{
            cnt += 1
        }else if arr[i] != "S"{
            let index = Int(arr[i])!
            record[index] = cnt
            break
        }else{
            continue
        }
    }
}

let info = record.sorted(by: {$0.value<$1.value})

ans[info[0].key] = 1
for i in 1..<info.count{
    if info[i].value == info[i-1].value{
        ans[info[i].key] = ans[info[i-1].key]
    }else{
        ans[info[i].key] = ans[info[i-1].key]+1
    }
}

ans.removeFirst()
for ans in ans{
    print(ans)
}