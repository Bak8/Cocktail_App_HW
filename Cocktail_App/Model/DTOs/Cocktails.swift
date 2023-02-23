import Foundation

struct Cocktail: Decodable{
    var drinks: [Drinks]?
}

struct Drinks: Decodable {
    var strDrink: String
    var strDrinkThumb: String?
    var strInstructions: String
}


//struct CocktailsGroup: Decodable {
//    var cocktails: [Cocktail]?
//}
//
//struct Cocktail: Codable {
//    let id: String
//    let name: String
//    let category: String
//    let instructions: String
//    let imageURL: String
//    let dateModified: String
//
//    enum CodingKeys: String, CodingKey {
//        case imageURL = "strDrinkThumb"
//    }
//}
