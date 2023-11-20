import Foundation

func solution(_ s:String) -> Int {
    let dic:Dictionary<String,String> = ["zero":"0","one":"1","two":"2","three":"3","four":"4",
                                      "five":"5","six":"6","seven":"7","eight":"8","nine":"9"]
    let S = s.map{String($0)}
    var stk = ""
    var ans = ""
    
    for ch in S{
        if Int(ch) != nil{
            ans += ch
        }else{
            stk += ch
            if dic[stk] != nil{
                ans += dic[stk]!
                stk = ""
            }
        }
    }

    return Int(ans)!
}