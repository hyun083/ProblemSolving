import Foundation

let N = Int(readLine()!)!
var arr = [Int]()
var tmp = [Int]()

func makeNumber(){
    while tmp[tmp.count-2]-tmp[tmp.count-1]>=0{
        let num = tmp[tmp.count-2]-tmp[tmp.count-1]
        tmp.append(num)
    }
    return
}

tmp.append(N)
for i in 1...N{
    tmp.append(i)
    makeNumber()
    if arr.count < tmp.count{
        arr = tmp
    }
    tmp = [N]
}

print(arr.count)
for num in arr{
    print(num,terminator:" ")
}