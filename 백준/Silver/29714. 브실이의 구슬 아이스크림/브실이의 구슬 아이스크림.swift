import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
var dic = Dictionary<Int, Int>()
var cnt = N

for num in arr{
    if dic[num] == nil{
        dic[num] = 1
    }else{
        dic[num]! += 1
    }
}

let M = Int(readLine()!)!
for _ in 0..<M{
    var A:[Int] = readLine()!.split(separator: " ").map{Int($0)!}.reversed()
    var B:[Int] = readLine()!.split(separator: " ").map{Int($0)!}.reversed()
    
    A.removeLast()
    B.removeLast()
    var flag = true
    
    for i in 0..<A.count{
        let num = A[i]
        if dic[num] == nil || dic[num]==0{
            flag = false
            for k in 0..<i{
                let num = A[k]
                dic[num]! += 1
                cnt += 1
            }
            break
        }else{
            dic[num]! -= 1
            cnt -= 1
        }
    }
    
    if flag{
        for i in 0..<B.count{
            let num = B[i]
            cnt += 1
            if dic[num] == nil{
                dic[num] = 1
            }else{
                dic[num]! += 1
            }
        }
    }
}
print(cnt)
var output = [String]()
if cnt>0{
    for (key, value) in dic{
        for _ in 0..<value{
            output.append(String(key))
        }
    }
    print(output.joined(separator: " "))
}