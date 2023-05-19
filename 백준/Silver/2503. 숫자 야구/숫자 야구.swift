import Foundation

var visited = Array(repeating: false, count: 10)
var arr = [[Int]]()

func combination(from:[Int], idx:Int){
    var tmp = from
    if from.count==3{
        arr.append(tmp)
        return
    }
    
    if idx>9{ return }
    for num in idx...9{
        if !visited[num]{
            visited[num] = true
            tmp.append(num)
            
            combination(from: tmp, idx: idx)
            tmp.removeLast()
            visited[num] = false
        }
    }
}
combination(from: [], idx: 1)

func result(from tmp:[Int], to target:[Int], with res:[Int]) -> Bool{
    var tmpRes = [0,0]
    
    for i in 0..<3{
        for k in 0..<3{
            if tmp[i] == target[k]{
                if i==k {
                    tmpRes[0] += 1
                }else{
                    tmpRes[1] += 1
                }
            }
        }
    }
    
    return tmpRes == res
}

let N = Int(readLine()!)!
var ans = 0
var tmps = [([Int],[Int])]()

for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{String($0)}
    let num = info[0].map{Int(String($0))!}
    let res = [Int(info[1])!,Int(info[2])!]
    tmps.append((num,res))
}

for target in arr{
    var flag = true
    for tmp in tmps{
        flag = flag && result(from: target, to: tmp.0, with: tmp.1)
    }
    ans += flag ? 1:0
}
print(ans)