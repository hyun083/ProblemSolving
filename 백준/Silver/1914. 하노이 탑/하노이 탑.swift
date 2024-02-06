import Foundation

let N = Int(readLine()!)!
var ans:[Decimal] = Array(repeating: 1, count: 101)
for i in 2..<101{
    ans[i] = pow(2, i)-Decimal(1)
}

func move(plate:Int,from:Int, by:Int, to:Int){
    if plate == 1{
        print(from,to)
    }else{
        move(plate: plate-1, from: from, by: to, to: by)
        print(from,to)
        move(plate: plate-1, from: by, by: from, to: to)
    }
}

if N <= 20{
    print(ans[N])
    move(plate: N, from: 1, by: 2, to: 3)
}else{
    print(ans[N])
}