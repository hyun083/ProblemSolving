import Foundation

let N = Int(readLine()!)!

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
    print(pow(2,N)-1)
    move(plate: N, from: 1, by: 2, to: 3)
}else{
    print(pow(2, N)-1)
}