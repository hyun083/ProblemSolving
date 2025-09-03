import Foundation

let T = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}

func getDivisor(from num:Int) -> [Int]{
    let sqrtNum = Int(sqrt(Double(num)))
    var res = Set<Int>()
    for i in 1...sqrtNum{
        if num % i == 0{
            res.insert(i)
            res.insert(num/i)
        }
    }
    return Array(res)
}

for num in arr{
    let divisors = getDivisor(from: num)
    let sum = divisors.filter({$0 != num}).reduce(0, +)
    
    if sum == num{
        print("Perfect")
    }else if sum < num{
        print("Deficient")
    }else{
        print("Abundant")
    }
}