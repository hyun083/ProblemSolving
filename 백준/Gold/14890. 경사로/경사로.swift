import Foundation

let NL = readLine()!.split(separator: " ").map{Int($0)!}
var arr = [[Int]]()
let N = NL[0]
let L = NL[1]

for _ in 0..<N{
    let numbers = readLine()!.split(separator: " ").map{Int($0)!}
    arr.append(numbers)
}

var slope = [[(num:Int,cnt:Int)]]()
func info(of arr:[Int]) -> [(num:Int, cnt:Int)]{
    var result = [(num:Int, cnt:Int)]()
    var curr = arr[0]
    var cnt = 1
    
    for i in 1..<N{
        if curr == arr[i]{
            cnt += 1
        }else{
            result.append((curr,cnt))
            curr = arr[i]
            cnt = 1
        }
    }
    result.append((curr,cnt))
    return result
}

for i in 0..<N{
    var horizontal = [Int]()
    var vertical = [Int]()
    
    for k in 0..<N{
        vertical.append(arr[k][i])
        horizontal.append(arr[i][k])
    }
    
    slope.append(info(of: horizontal))
    slope.append(info(of: vertical))
}

var ans = 0
for slope in slope{
    var flag = true
    var sloped = Array(repeating: false, count: slope.count)
    
    for i in 0..<slope.count-1{
        if abs(slope[i].num - slope[i+1].num) == 1{
            if slope[i].num < slope[i+1].num{
                if sloped[i] && slope[i].cnt >= L*2 {
                    continue
                }else if !sloped[i] && slope[i].cnt >= L{
                    sloped[i] = true
                    continue
                }
            }else{
                if sloped[i+1] && slope[i+1].cnt >= L*2 {
                    continue
                }else if !sloped[i+1] && slope[i+1].cnt >= L{
                    sloped[i+1] = true
                    continue
                }
            }
        }
        
        flag = false
        break
    }
    if flag { ans += 1 }
}
print(ans)