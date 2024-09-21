import Foundation

while let line = readLine(){
    let tmp = line.split(separator: " ")
    var card = [Int]()
    for i in 0..<4{
        for num in tmp[i]{
            card.append(Int(String(num))!)
        }
    }
    if card.reduce(0, +) == 0 { break }
    var sum = 0
    
    for i in 0..<16{
        if i%2 == 0{
            sum += card[i]*2>9 ? card[i]*2-9 : card[i]*2
        }else{
            sum += card[i]
        }
    }
    print(sum%10==0 ? "Yes":"No")
}