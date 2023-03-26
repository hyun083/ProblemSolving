import Foundation

let n = Int(readLine()!)!
var arr = Array(repeating: [String](), count: n)
var ans = Int.min

for u in 0..<n{
    arr[u] = readLine()!.map{String($0)}
}

for k in 0..<n{
    for u in 0..<n{
        for v in 0..<n{
            if u==v{continue}
            if arr[u][v] == "Y"{continue}
            if (arr[u][k]=="Y" && arr[k][v]=="Y"){
                arr[u][v]="y"
            }
        }
    }
}
for u in 0..<n{
    var cnt = 0
    for v in 0..<n{
        if !(arr[u][v]=="N") {cnt+=1}
    }
    ans = max(ans, cnt)
}
print(ans)