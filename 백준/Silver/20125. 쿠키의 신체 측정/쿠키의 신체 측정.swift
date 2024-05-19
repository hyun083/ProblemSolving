import Foundation

let N = Int(readLine()!)!
var map = [[String]]()

for _ in 0..<N{
    let info = readLine()!.map{String($0)}
    map.append(info)
}
var hx = -1
var hy = -1
var ans = [Int]()

for i in 0..<N{
    if hx>=0 || hy>=0 { break }
    for k in 0..<N{
        if map[i][k]=="*"{
            hx = i+1
            hy = k
            break
        }
    }
}

for k in 0..<N{
    if map[hx][k] == "*"{
        ans.append(hy-k)
        break
    }
}

for k in (hy..<N).reversed(){
    if map[hx][k]=="*"{
        ans.append(k-hy)
        break
    }
}
var tmp = -1
for i in hx..<N{
    if map[i][hy] == "_"{
        ans.append(i-hx-1)
        tmp = i
        break
    }
}

var leg = 0
for i in tmp..<N{
    if map[i][hy-1]=="*"{
        leg += 1
    }
}
ans.append(leg)

leg = 0
for i in tmp..<N{
    if map[i][hy+1]=="*"{
        leg += 1
    }
}
ans.append(leg)

print(hx+1, hy+1)
for value in ans{
    print(value,terminator: " ")
}