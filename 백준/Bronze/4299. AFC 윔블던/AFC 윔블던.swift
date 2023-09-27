import Foundation

let (sum,diff) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]

if sum < diff{
    print(-1)
}else{
    let a = (sum+diff)/2
    let b = (sum-diff)/2
    if a+b == sum && a-b==diff{
        print(a,b)
    }else{
        print(-1)
    }
}