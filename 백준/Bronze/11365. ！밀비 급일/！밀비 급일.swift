import Foundation

while let input = readLine(){
    if input == "END"{ break }
    print(String(input.reversed()))
}