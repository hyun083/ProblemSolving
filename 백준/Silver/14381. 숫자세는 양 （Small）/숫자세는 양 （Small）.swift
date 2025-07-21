import Foundation

let T = Int(readLine()!)!

for t in 1...T{
    let offset = Int(readLine()!)!
    var N = offset
    var arr = Set<Int>()
    if N == 0{
        print("Case #\(t): INSOMNIA")
        continue
    }
    while arr.count < 10{
        let tmp = String(N).map{Int(String($0))!}
        for num in tmp{
            arr.insert(num)
        }
        if arr.count == 10{
            break
        }else{
            N += offset
        }
    }
    print("Case #\(t): \(N)")
}