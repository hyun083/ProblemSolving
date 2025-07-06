import Foundation

let arr = readLine()!.map{String($0)}
var ans = 0

func check(arr:[Int]) -> Bool{
    var sum = 0
    for i in 0..<13{
        sum += arr[i] * (i%2==0 ? 1:3)
    }
    return sum%10==0
}

for i in 0..<10{
    let tmp = arr.map{$0=="*" ? i:Int($0)!}
    if check(arr: tmp){
        ans = i
    }else{
        continue
    }
}
print(ans)