import Foundation

func solution(_ expression:String) -> Int64 {
    var arr = [String]()
    var tmp = ""
    var oper = [["+","-","*"],["+","*","-"],
              ["-","+","*"],["-","*","+"],
              ["*","-","+"],["*","+","-"]]
    var ans:Int64 = 0
    
    func calculate(a:String, oper:String ,b:String) -> String{
        let A = Int(a)!
        let B = Int(b)!
        if oper=="*"{
            return String(A*B)
        }else if oper=="+"{
            return String(A+B)
        }else{
            return String(A-B)
        }
    }
    
    for str in expression.map{String($0)}{
        if str=="+" || str=="-" || str=="*"{
            arr.append(tmp)
            arr.append(str)
            tmp = ""
        }else{
            tmp += str
        }
    }
    arr.append(tmp)
    
    for op in oper{
        var prev = arr
        var stk = [String]()

        for i in 0..<3{
            for num in prev{
                if stk.isEmpty{
                    stk.append(num)
                }else if stk.last!==op[i]{
                    let _ = stk.removeLast()
                    let u = stk.removeLast()
                    let v = num
                    stk.append(calculate(a:u, oper:op[i], b:v))
                }else{
                    stk.append(num)
                }
            }
            prev = stk
            stk = [String]()
        }
        ans = max(ans, abs(Int64(prev[0])!))
    }
    
    return ans
}