import Foundation

let N = Int(readLine()!)!
var ans = Array(repeating: Set<Int>(), count: N)
var map = [[Int]]()

for i in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    map.append(info)
}

for grade in 0..<5{
    for i in 0..<N-1{
        for k in i+1..<N{
            if map[i][grade] == map[k][grade]{
                ans[i].insert(k)
                ans[k].insert(i)
            }
        }
    }
}

let target = ans.map{$0.count}.max()!
for i in 0..<N{
    if ans[i].count == target{
        print(i+1)
        break
    }
}