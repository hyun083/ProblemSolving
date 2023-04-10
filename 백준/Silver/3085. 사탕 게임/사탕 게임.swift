import Foundation

let n = Int(readLine()!)!
var map = Array(repeating: [String](), count: n)

for i in 0..<n{
    map[i] = readLine()!.map{String($0)}
}

func check(map: [[String]]) -> Int{
    var result = 0
    for i in 0..<n{
        var temp = 1
        for k in 0..<n-1{
            if map[i][k] == map[i][k+1]{
                temp += 1
            }else{
                result = max(result, temp)
                temp = 1
            }
        }
        result = max(result, temp)
        temp = 1
    }
    for i in 0..<n{
        var temp = 1
        for k in 0..<n-1{
            if map[k][i] == map[k+1][i]{
                temp += 1
            }else{
                result = max(result, temp)
                temp = 1
            }
        }
        result = max(result, temp)
        temp = 1
    }
    return result
}

if check(map: map) == n{
    print(n)
}else{
    var ans = 0
    var newMap = map
    for i in 0..<n{
        for k in 0..<n-1{
            if newMap[i][k] != newMap[i][k+1]{
                let temp = newMap[i][k]
                newMap[i][k] = newMap[i][k+1]
                newMap[i][k+1] = temp
                ans = max(ans, check(map: newMap))
                newMap = map
            }
        }
    }
    for i in 0..<n{
        for k in 0..<n-1{
            if newMap[k][i] != newMap[k+1][i]{
                let temp = newMap[k][i]
                newMap[k][i] = newMap[k+1][i]
                newMap[k+1][i] = temp
                ans = max(ans, check(map: newMap))
                newMap = map
            }
        }
    }
    print(ans)
}