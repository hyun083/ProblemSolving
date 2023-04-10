import Foundation

let S = readLine()!
let T = readLine()!
var temp = T
while S.count != temp.count{
    if temp.last! == "A"{
        temp.removeLast()
    }else{
        temp.removeLast()
        temp = String(temp.reversed())
    }
}
if temp == S{
    print(1)
}else{
    print(0)
}