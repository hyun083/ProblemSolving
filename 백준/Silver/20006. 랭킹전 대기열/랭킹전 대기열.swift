import Foundation

let (P,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0] ,$0[1])}[0]
var arr = [(nick:String,level:Int)]()

for _ in 0..<P{
    let info = readLine()!.split(separator: " ").map{String($0)}
    let l = Int(info[0])!
    let n = info[1]
    
    arr.append((n,l))
}

var ans = [[(nick:String, level:Int)]]()
for i in 0..<P{
    if ans.isEmpty{
        ans.append([arr[i]])
    }else{
        var flag = false
        for k in 0..<ans.count{
            if ans[k].count == M{ continue }
            if ans[k][0].level-10 <= arr[i].level && arr[i].level <= ans[k][0].level+10{
                ans[k].append(arr[i])
                flag = true
                break
            }
        }
        if !flag{
            ans.append([arr[i]])
        }
    }
}

for room in ans{
    print(room.count==M ? "Started!":"Waiting!")
    for player in room.sorted(by: {$0.nick < $1.nick}){
        print(player.level, player.nick)
    }
}