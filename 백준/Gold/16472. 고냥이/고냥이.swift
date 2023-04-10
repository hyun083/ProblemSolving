import Foundation


let n = Int(readLine()!)!
let arr = readLine()!.map{String($0)}

var head = 0
var tail = 0
var ans = 0

var dic = Dictionary<String,Int>()

while tail<arr.count{
    let str = arr[tail]
    if dic.count >= n{
        if dic[str] == nil{
            if dic[arr[head]]! == 1{
                dic.removeValue(forKey: arr[head])
            }else{
                dic[arr[head]]! -= 1
            }
            head += 1
        }else{
            dic[str]! += 1
            tail += 1
        }
    }else{
        if dic[str] == nil{
            dic[str] = 1
        }else{
            dic[str]! += 1
        }
        tail += 1
    }
    if dic.count <= n{
        ans = max(ans, tail - head)
    }
}
print(ans)