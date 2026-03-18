import Foundation

let Q = Int(readLine()!)!
for _ in 0..<Q{
    let cnt = Int(readLine()!)!+1
    var HH = 6
    var MM = 6
    let tmp = cnt%50 == 0 ? (cnt/50)-1:cnt/50
    
    MM += tmp*12
    HH += MM/60
    MM %= 60
    if HH>=24 && MM>0{
        print(-1)
    }else{
        HH = HH==24 ? 0:HH
        print(String(format: "%02d:%02d", HH,MM))
    }
}