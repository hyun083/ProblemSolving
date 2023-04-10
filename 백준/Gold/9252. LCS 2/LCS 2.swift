import Foundation

let a = readLine()!.map{String($0)}
let b = readLine()!.map{String($0)}

var map = Array(repeating: Array(repeating: 0, count: a.count+1), count: b.count+1)
for i in 1...b.count{
    for k in 1...a.count{
        if b[i-1] == a[k-1]{
            map[i][k] = map[i-1][k-1]+1
        }else{
            map[i][k] = max(map[i][k-1], map[i-1][k])
        }
    }
}
var ans = ""
var k = a.count
for i in stride(from: b.count, through: 0, by: -1){
    if map[i][k] == 0{
        break
    }
    for p in stride(from: k, through: 0, by: -1){
        if map[i][p] == map[i-1][p]{ break }
        if map[i][p] != map[i][p-1] {
            ans.append(a[p-1])
            k = p - 1
            break
        }
    }
}
print(map[b.count][a.count])
if map[b.count][a.count] != 0{
    print(String(ans.reversed()))
}