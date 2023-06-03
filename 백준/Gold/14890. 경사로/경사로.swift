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
for numbers in arr{
    var tmp = [(num:Int, cnt:Int)]()
    var curr = numbers[0]
    var cnt = 1
    
    for i in 1..<N{
        if curr == numbers[i]{
            cnt += 1
        }else{
            tmp.append((curr,cnt))
            curr = numbers[i]
            cnt = 1
        }
    }
    tmp.append((curr,cnt))
    
    slope.append(tmp)
}

for i in 0..<N{
    var numbers = [Int]()
    for k in 0..<N{
        numbers.append(arr[k][i])
    }
    
    var tmp = [(num:Int, cnt:Int)]()
    var curr = numbers[0]
    var cnt = 1
    
    for i in 1..<N{
        if curr == numbers[i]{
            cnt += 1
        }else{
            tmp.append((curr,cnt))
            curr = numbers[i]
            cnt = 1
        }
    }
    tmp.append((curr,cnt))
    slope.append(tmp)
}

var ans = 0
for slope in slope{
    var flag = true
    var sloped = Array(repeating: false, count: slope.count)
    
    for i in 0..<slope.count-1{
        if abs(slope[i].num - slope[i+1].num) > 1{
            flag = false
            break
        }else{
            if slope[i].num < slope[i+1].num{
                if sloped[i]{
                    if slope[i].cnt < L*2{
                        flag = false
                        break
                    }
                }else{
                    if slope[i].cnt < L{
                        flag = false
                        break
                    }
                    sloped[i] = true
                }
            }else if slope[i].num > slope[i+1].num{
                if sloped[i+1]{
                    if slope[i+1].cnt < L*2{
                        flag = false
                        break
                    }
                }else{
                    if slope[i+1].cnt < L{
                        flag = false
                        break
                    }
                    sloped[i+1] = true
                }
            }
        }
    }
    if flag {
        ans += 1
    }
}
print(ans)