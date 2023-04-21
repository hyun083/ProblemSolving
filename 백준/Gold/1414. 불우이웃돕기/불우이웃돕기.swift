import Foundation

let N = Int(readLine()!)!

var lines = [(u:Int, v:Int, c:Int)]()
var arr = Array(repeating: -1, count: N)
var MST = 0
var total = 0

func root(of a:Int) -> Int{
    if arr[a] < 0{
        return a
    }
    arr[a] = root(of: arr[a])
    return arr[a]
}

func union(a:Int, b:Int, cost:Int){
    let rootA = root(of: a)
    let rootB = root(of: b)
    
    if rootA==rootB || cost==0{
        return
    }
    
    arr[rootB] = rootA
    MST += cost
}

for i in 0..<N{
    let info = readLine()!.map{ cost -> Int in
        if Character(String(cost)).isLowercase{
            return Int(Character(String(cost)).asciiValue!)-96
        }else if Character(String(cost)).isUppercase{
            return Int(Character(String(cost)).asciiValue!)-38
        }else{
            return 0
        }
    }
    
    for k in 0..<N{
        total += info[k]
        if i == k{
            continue
        }
        lines.append((i,k,info[k]))
    }
}
lines.sort(by: { $0.c < $1.c })

for i in 0..<lines.count{
    let u = lines[i].u
    let v = lines[i].v
    let cost = lines[i].c
    
    union(a: u, b: v, cost: cost)
}

var cnt = 0
for i in 0..<N{
    if arr[i] == -1{
        cnt += 1
    }
}

print(cnt==1 ? total-MST:-1)