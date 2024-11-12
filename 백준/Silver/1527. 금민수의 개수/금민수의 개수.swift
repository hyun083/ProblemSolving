import Foundation

let AB = readLine()!.split(separator: " ").map{Int($0)!}
let A = AB[0]
let B = AB[1]
var ans = 0

func solution(curr:String){
    var num = Int(curr+"4")!
    if B<num{ return }
    
    if A<=num && num<=B{ ans += 1 }
    solution(curr: curr+"4")
    
    num = Int(curr+"7")!
    if A<=num && num<=B{ ans += 1 }
    solution(curr: curr+"7")
}

solution(curr: "")
print(ans)