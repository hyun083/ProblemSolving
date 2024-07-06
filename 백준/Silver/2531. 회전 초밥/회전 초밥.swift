import Foundation

let (N,D,K,C) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2], $0[3])}[0]
var arr = [Int]()
for _ in 0..<N{
    let num = Int(readLine()!)!
    arr.append(num)
}

var ans = 0
var dish = Dictionary<Int,Int>()
var tail = 0
var head = K
dish[C] = 1
for i in 0..<K{
    if dish[arr[i]] == nil{
        dish[arr[i]] = 1
    }else{
        dish[arr[i]]! += 1
    }
}

ans = max(ans,dish.keys.count)
while tail<N{
    dish[arr[tail]]! -= 1
    if dish[arr[head]] == nil{
        dish[arr[head]] = 1
    }else{
        dish[arr[head]]! += 1
    }
    if dish[arr[tail]]! == 0{
        dish.removeValue(forKey: arr[tail])
    }
    
    ans = max(ans,dish.keys.count)
    tail += 1
    head += 1
    head = head==N ? 0:head
}
print(ans)