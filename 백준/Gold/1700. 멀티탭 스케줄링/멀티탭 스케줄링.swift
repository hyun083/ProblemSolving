import Foundation

let (N,K) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = readLine()!.split(separator: " ").map{Int($0)!-1}
var order = Array(repeating: [Int](), count: K)
var outlet = Set<Int>()
var ans = 0

for i in (0..<K).reversed(){
    let num = arr[i]
    order[num].append(i)
}

for num in arr{
    if outlet.contains(num){
        order[num].removeLast()
        continue
    }else if outlet.count < N{
        outlet.insert(num)
        order[num].removeLast()
    }else{
        var target = -1
        var idx = -1
        
        for k in outlet{
            if order[k].isEmpty{
                idx = k
                break
            }
            
            if order[k].last! > target{
                target = order[k].last!
                idx = k
            }
        }
        
        outlet.remove(idx)
        outlet.insert(num)
        order[num].removeLast()
        ans += 1
    }
}
print(ans)