import Foundation

var (N,M,R) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
var map = [[String]]()

for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{String($0)}
    map.append(info)
}

func one(){
    for i in 0..<N/2{
        map.swapAt(i, N-i-1)
    }
}

func two(){
    for i in 0..<N{
        for k in 0..<M/2{
            map[i].swapAt(k, M-k-1)
        }
    }
}

func three(){
    var newMap = Array(repeating: Array(repeating: "", count: N), count: M)
    for i in 0..<M{
        for k in 0..<N{
            newMap[i][N-k-1] = map[k][i]
        }
    }
    map = newMap
    swap(&N, &M)
}

func four(){
    var newMap = Array(repeating: Array(repeating: "", count: N), count: M)
    for i in 0..<M{
        for k in 0..<N{
            newMap[M-i-1][k] = map[k][i]
        }
    }
    map = newMap
    swap(&N, &M)
}

func five(){
    var temp = Array(repeating: Array(repeating: "", count: M/2), count: N/2)
    for i in 0..<N/2{
        for k in 0..<M/2{
            temp[i][k] = map[i][k]
        }
    }
    
    //1 <- 4
    for i in 0..<N/2{
        for k in 0..<M/2{
            map[i][k] = map[i+(N/2)][k]
        }
    }
    
    //4 <- 3
    for i in N/2..<N{
        for k in 0..<M/2{
            map[i][k] = map[i][k+(M/2)]
        }
    }
    
    //3 <- 2
    for i in N/2..<N{
        for k in M/2..<M{
            map[i][k] = map[i-(N/2)][k]
        }
    }
    
    //2 <- 1
    for i in 0..<N/2{
        for k in M/2..<M{
            map[i][k] = temp[i][k-(M/2)]
        }
    }
}

func six(){
    var temp = Array(repeating: Array(repeating: "", count: M/2), count: N/2)
    for i in N/2..<N{
        for k in 0..<M/2{
            temp[i-(N/2)][k] = map[i][k]
        }
    }
    
    //1 -> 4
    for i in 0..<N/2{
        for k in 0..<M/2{
            map[i+(N/2)][k] = map[i][k]
        }
    }
    
    //2 -> 1
    for i in 0..<N/2{
        for k in M/2..<M{
            map[i][k-(M/2)] = map[i][k]
        }
    }
    
    //3 -> 2
    for i in N/2..<N{
        for k in M/2..<M{
            map[i-(N/2)][k] = map[i][k]
        }
    }
    
    //4 -> 3
    for i in 0..<N/2{
        for k in 0..<M/2{
            map[i+(N/2)][k+(M/2)] = temp[i][k]
        }
    }
}

var cmd = readLine()!.split(separator: " ").map{Int($0)!}
for cmd in cmd{
    switch cmd{
    case 1:
        one()
    case 2:
        two()
    case 3:
        three()
    case 4:
        four()
    case 5:
        five()
    case 6:
        six()
    default:
        continue
    }
}

for m in map{
    print(m.joined(separator: " "))
}