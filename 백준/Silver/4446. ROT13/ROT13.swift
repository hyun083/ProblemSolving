import Foundation

let largeVowel = "A I Y E O U".split(separator: " ").map{String($0)}
let largeConsonent = "B K X Z N H D C W G P V J Q T S R L M F".split(separator: " ").map{String($0)}
let smallVowel = "a i y e o u".split(separator: " ").map{String($0)}
let smallConsonent = "b k x z n h d c w g p v j q t s r l m f".split(separator: " ").map{String($0)}

while let input = readLine(){
    var str = input.map{String($0)}
    var ans = ""
    for s in str{
        if let idx = largeVowel.firstIndex(of: s){
            ans += largeVowel[(idx+3)%6]
        }else if let idx = largeConsonent.firstIndex(of: s){
            ans += largeConsonent[(idx+10)%20]
        }else if let idx = smallVowel.firstIndex(of: s){
            ans += smallVowel[(idx+3)%6]
        }else if let idx = smallConsonent.firstIndex(of: s){
            ans += smallConsonent[(idx+10)%20]
        }else{
            ans += s
            continue
        }
    }
    print(ans)
}