import Kitura
import SwiftyJSON
import CloudFoundryEnv

let router = Router()
let appEnv = try CloudFoundryEnv.getAppEnv()

router.all("/info", middleware: BodyParser())

let info = [
            "Karnataka": ("Kannada", "Bengaluru"), 
            "Tamil Nadu": ("Tamil", "Chennai"), 
            "Gujarat": ("Gujarati", "Gandhinagar"), 
            "Kerala": ("Malayalam", "Trivendrum")
           ]

router.post("/info") { request, response, _ in
    if case .json(let jsonBody) = request.body! {
        let state = jsonBody["state"].string!
        let responseJson = JSON(["state": state, "language": info[state]!.0, "capital": info[state]!.1])
        try response.status(.OK).send(json: responseJson).end()
    }
}

Kitura.addHTTPServer(onPort: appEnv.port, with: router)
Kitura.run()
    
    
