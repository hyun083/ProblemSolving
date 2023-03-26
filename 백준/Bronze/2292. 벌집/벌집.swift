import Foundation

let N = Int(readLine()!)!
var start = 2
var cnt = 0

while(true){
    if(N == 1){print(1); break}
    if start <= N && N <= start+6*(cnt+1)-1 {
        print(cnt+2)
        break
    }else{
        start = start+6*(cnt+1)
        cnt += 1
    }
}