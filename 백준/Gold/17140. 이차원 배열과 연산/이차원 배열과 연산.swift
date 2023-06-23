import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
var arr = Array(repeating: Array(repeating: 0, count: 3), count: 3)

let R = info[0]-1
let C = info[1]-1
let K = info[2]

for i in 0..<3{
    let num = readLine()!.split(separator: " ").map{Int($0)!}
    for k in 0..<3{
        arr[i][k] = num[k]
    }
}

var ans = 0

while ans<100{
    if arr.count>R && arr[0].count>C{
        if arr[R][C] == K{ break }
    }
    ans += 1
    
    let r = arr.count
    let c = arr[0].count

    if r >= c{
        var tmp = Array(repeating: [Int](), count: r)
        var length = 0
        
        for i in 0..<r{
            var dic = Dictionary<Int,Int>()
            
            for k in 0..<c{
                let num = arr[i][k]
                
                if num == 0{ continue }
                if dic[num] == nil{
                    dic[num] = 1
                }else{
                    dic[num]! += 1
                }
            }
            for num in dic.sorted(by: {$0.value==$1.value ? $0.key<$1.key : $0.value<$1.value}){
                tmp[i].append(num.key)
                tmp[i].append(num.value)
            }
            length = max(length, tmp[i].count)
        }
        
        var res = Array(repeating: Array(repeating: 0, count: min(100, length)), count: r)
        
        for i in 0..<r{
            for k in 0..<min(100, tmp[i].count){
                let num = tmp[i][k]
                res[i][k] = num
            }
        }
        arr = res
    }else{
        var tmp = Array(repeating: [Int](), count: c)
        var length = 0
        
        for i in 0..<c{
            var dic = Dictionary<Int,Int>()
            
            for k in 0..<r{
                let num = arr[k][i]
                
                if num == 0{ continue }
                if dic[num] == nil{
                    dic[num] = 1
                }else{
                    dic[num]! += 1
                }
            }
            for num in dic.sorted(by: {$0.value==$1.value ? $0.key<$1.key : $0.value<$1.value}){
                tmp[i].append(num.key)
                tmp[i].append(num.value)
            }
            length = max(length, tmp[i].count)
        }
        
        var res = Array(repeating: Array(repeating: 0, count: c), count: min(100, length))
        
        for i in 0..<c{
            for k in 0..<min(100, tmp[i].count){
                let num = tmp[i][k]
                res[k][i] = num
            }
        }
        arr = res
    }
}
if arr.count>R && arr[0].count>C{
    print(arr[R][C]==K ? ans:-1)
}else{
    print(-1)
}