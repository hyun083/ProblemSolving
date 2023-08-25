import Foundation

func readInt() -> [Int]{
    readLine()!.split(separator: " ").map{Int($0)!}
}

for _ in 0..<3{
    let time = readInt()
    let office = time[0]*3600 + time[1]*60 + time[2]
    let home = time[3]*3600 + time[4]*60 + time[5]
    
    var ans = home - office
    let h = ans/3600; ans %= 3600
    let m = ans/60; ans %= 60
    let s = ans
    print(h,m,s)
}