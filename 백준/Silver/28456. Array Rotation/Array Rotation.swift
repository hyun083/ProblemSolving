import Foundation

let N = Int(readLine()!)!
var map = [[String]]()

func formation(){
    var res = Array(repeating: Array(repeating: "", count: N), count: N)
    for i in 0..<N{
        for k in 0..<N{
            res[k][N-i-1] = map[i][k]
        }
    }
    map = res
}

for _ in 0..<N{
    let arr = readLine()!.split(separator: " ").map{String($0)}
    map.append(arr)
}
let Q = Int(readLine()!)!
for _ in 0..<Q{
    let cmd = readLine()!.split(separator: " ").map{Int($0)!}
    let num = cmd[0]
    if num == 1{
        let row = cmd[1]-1
        var tmp = [map[row].removeLast()]
        tmp += map[row]
        map[row] = tmp
    }else{
       formation()
    }
}
for ans in map{
    print(ans.joined(separator: " "))
}