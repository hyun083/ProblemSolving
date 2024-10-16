import Foundation

let NX = readLine()!.split(separator: " ").map{Int($0)!}
let N = NX[0]
let X = NX[1]
var arr = [(A:Int, B:Int)]()
var ans = 0

for _ in 0..<N{
    let AB = readLine()!.split(separator: " ").map{Int($0)!}
    let A = AB[0]
    let B = AB[1]
    
    arr.append((A,B))
}
if N*5000 <= X{
    for i in 0..<N{
        let taste = max(arr[i].A,arr[i].B)
        ans += taste
    }
}else if N*1000 == X{
    for i in 0..<N{
        let taste = arr[i].B
        ans += taste
    }
}else{
    var cash = X
    arr.sort(by: {$0.A-$0.B==$1.A-$1.B ? $0.A>$1.A : $0.A-$0.B>$1.A-$1.B})
    for i in 0..<N{
        let food = arr[i]
        if food.B >= food.A{
            ans += food.B
            cash -= 1000
        }else{
            if (cash-5000)/1000 >= N-(i+1){
                ans += food.A
                cash -= 5000
            }else{
                ans += food.B
                cash -= 1000
            }
        }
    }
}
print(ans)