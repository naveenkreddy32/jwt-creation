%dw 2.0
import dwl::Common
import fail from dw::Runtime

var algMapping = {
    "Sha256withRSA": "RS256",
    "Sha384withRSA": "RS384",
    "Sha512withRSA": "RS512"
}

fun alg(algorithm: String) : String | Null =
    algMapping[algorithm] default fail('Invalid algorithm provided for signing')
    
/** JWT with header, payload, and signature by specific algorithm. valid algorithms dictated by RSA */
fun generateJWTHeaderNBody(payload: Object, algorithm: String) : String = do {
    var jwt = Common::JWT(
    { alg: alg(algorithm), typ: 'JWT' }, payload)
    ---
    "$(jwt)"
}