import Foundation

let n = Int(readLine()!)!

var tempStars = [String]()
var stars = ["  *  "," * * ","*****"]
var blank = "   "

func printStars(size:Int){
    if size == n{
        for star in stars {
            print(blank + star + blank)
        }
        for star in stars {
            print(star + " " + star)
        }
        return
    }
    
    tempStars = stars
    stars = []
    for tempStar in tempStars {
        stars.append(blank + tempStar + blank)
    }
    for tempStar in tempStars {
        stars.append(tempStar + " " + tempStar)
    }
    blank += blank
    printStars(size: 2*size)
}

if n==3{
    for s in stars{
        print(s)
    }
}else{
    printStars(size: 6)
}
