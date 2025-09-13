import Foundation

let T = Int(readLine()!)!

func mulitply(_ a: Int, _ b: Int) -> Int {
    var num1 = String(a).map{Int(String($0))!}
    var num2 = String(b).map{Int(String($0))!}
    var res = [String]()
    
    if num1.count < num2.count{
        for _ in 0..<num2.count-num1.count{
            num1.insert(1, at: 0)
        }
    }else if num1.count > num2.count{
        for _ in 0..<num1.count-num2.count{
            num2.insert(1, at: 0)
        }
    }
    for i in 0..<max(num1.count,num2.count){
        let tmp = num1[i] * num2[i]
        res.append(String(tmp))
    }
    return Int(res.joined())!
}

for _ in 0..<T{
    let arr = readLine()!.split(separator: " ").map{Int($0)!}
    let num1 = arr[0]
    let num2 = arr[1]
    let res = mulitply(num1, num2)
    print(res==num1*num2 ? "1":"0")
}