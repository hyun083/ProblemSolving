import Foundation

var ans = 0
while let line = readLine(){
    let money = Int(line)!
    if money < 0{ break }
    ans += money
}
print(ans)