import Foundation

var map = Array(repeating: [Int](), count: 7)
var degree = Array(repeating: 0, count: 7)
map[0] = [3,6]
map[1] = [0]
map[2] = [3,4]

degree[0] = 1
degree[3] = 2
degree[4] = 1
degree[6] = 1

while true{
    let x = Int(readLine()!)!-1
    let y = Int(readLine()!)!-1
    if x<0 && y<0{ break }
    map[x].append(y)
    degree[y] += 1
}

var ans = [Int]()
var q = [Int]()
var idx = 0

for i in 0..<7{
    if degree[i]==0{
        q.append(i)
    }
}
q.sort(by: >)

while !q.isEmpty{
    let cur = q.removeLast()
    ans.append(cur+1)
    for next in map[cur].sorted(by: <){
        degree[next] -= 1
        if degree[next]==0{
            q.append(next)
        }
    }
    q.sort(by: >)
}

if ans.count==7{
    for ans in ans{
        print(ans, terminator: " ")
    }
}else{
    print("Cannot complete these tasks. Going to bed.")
}