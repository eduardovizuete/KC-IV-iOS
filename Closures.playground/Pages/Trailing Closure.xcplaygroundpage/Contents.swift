import Foundation

typealias SimpleClosure = () -> ()

func downloadImage(imageName: String, n: Int, completion: SimpleClosure ) {
    // cosas
    
    completion()
}

downloadImage(imageName: "Carmen de Mairena", n: 10, completion: {
    print("Finalizado con éxito")
})


downloadImage(imageName: "Carmen de Mairena", n: 10) {
    print("Finalizado con éxito")
}

func readJsonFromServer(url: String, success: SimpleClosure, error: SimpleClosure) {
    let somethingWentWrong = true
    
    if (somethingWentWrong) {
        error()
    } else {
        success()
    }
}

readJsonFromServer(url: "http://", success: { 
   // closure success
}) { 
    // trailing closure: error
}

readJsonFromServer(url: "http://",
success: {
    // closure success
}, error: {
    // trailing closure: error
})





