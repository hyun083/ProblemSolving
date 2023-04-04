import Foundation

let N = Int(readLine()!)!

var KEYS = Set<String>()
var arr = Dictionary<String,[String]>()
var income = Dictionary<String,Int>()

for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{String($0)}
    let A = info[0]
    let B = info[1]
    KEYS.insert(A)
    KEYS.insert(B)
    
    if arr[A] == nil{
        arr[A] = [B]
    }else{
        arr[A]!.append(B)
    }
    
    if income[B] == nil{
        income[B] = 1
    }else{
        income[B]! += 1
    }
    
    if income[A] == nil{
        income[A] = 0
    }
}

var q = [String]()
var dq = [String]()
for item in income{
    if item.value == 0{
        q.append(item.key)
    }
}
q.sort(by: {$0 < $1})

var ans = [String]()
while !q.isEmpty{
    dq = q.reversed()
    q.removeAll()
    
    for _ in 0..<dq.count{
        let curr = dq.removeLast()
        ans.append(curr)
        
        if arr[curr] != nil{
            for next in arr[curr]!{
                income[next]! -= 1
                
                if income[next] == 0{
                    q.append(next)
                }
            }
        }
    }
    q.sort(by: {$0<$1})
}

if ans.count < KEYS.count{
    print(-1)
}else{
    print(ans.joined(separator: "\n"))
}