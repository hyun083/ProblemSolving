import Foundation

while(true){
    var input = Int(readLine()!)!
    if(input == 0) {break}
    let rev = String(String(input).reversed().map{$0})
    if(String(input) == rev){
        print("yes")
    }else{
        print("no")
    }
}