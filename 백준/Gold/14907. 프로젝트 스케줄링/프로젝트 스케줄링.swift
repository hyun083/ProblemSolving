import Foundation

var able = Array(repeating: false, count: 26)
var arr = Array(repeating: [Int](), count: 26)
var cost = Array(repeating: 0, count: 26)
var income = Array(repeating: 0, count: 26)
var ans = Array(repeating: 0, count: 26)

while let line = readLine(){
    let info = line.split(separator: " ").map{String($0)}
    let num = Int(info[0].first!.asciiValue!)-65
    let time = Int(info[1])!
    var next = [Int]()
    if info.count == 3{
        next = info[2].map{Int($0.asciiValue!)-65}
    }
    
    able[num] = true
    cost[num] = time
    for next in next{
        arr[num].append(next)
        income[next] += 1
    }
}

var q = [(num:Int,time:Int)]()

for i in 0..<26{
    if income[i]==0 && able[i]{
        ans[i] = cost[i]
        q.append((i,ans[i]))
    }
}

var idx = 0
while idx < q.count{
    let currNum = q[idx].num
    let currCost = q[idx].time
    
    for next in arr[currNum]{
        ans[next] = max(ans[next], currCost+cost[next])
        income[next] -= 1
        if income[next] == 0{
            q.append((next,ans[next]))
        }
    }
    idx += 1
}
print(ans.max()!)