var changes = 1000-Int(readLine()!)!
let coins = [500,100,50,10,5,1]
var cnt = 0
for coin in coins{
    cnt += changes/coin
    changes %= coin
}
print(cnt)