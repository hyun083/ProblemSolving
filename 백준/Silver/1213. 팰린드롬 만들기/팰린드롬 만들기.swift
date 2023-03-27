import Foundation

let s = readLine()!.map{String($0)}
var ans = ""
var dic = [String:Int]()
for alpha in s{
    if dic[alpha] == nil{
        dic[alpha] = 1
    }else{
        dic[alpha]! += 1
    }
}
var flag = 0
var mid = ""
for alpha in dic.sorted(by: <){
    if flag > 1{
        break
    }
    if alpha.value%2>0{
        flag += 1
        mid = alpha.key
    }
    for _ in 0..<alpha.value/2{
        ans+=alpha.key
    }
}
if flag > 1{
    print("I'm Sorry Hansoo")
}else{
    let rev = String(ans.reversed())
    print(ans + mid + rev)
}