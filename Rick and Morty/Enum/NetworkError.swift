//
//  NetworkError.swift
//  Rick&Monty
//
//  Created by James Ryu on 2021-12-08.
//

import Foundation

// All Status Code info derived from https://en.wikipedia.org/wiki/List_of_HTTP_status_codes
enum NetworkError: String, Error {
    case BadData = "Data received is not good."
    case Redirect = "This class of status code indicates the client must take additional action to complete the request. Many of these status codes are used in URL redirection."
    case Unknown = "Unknown Error"
    case UnknownServer = "Unknown Error Server"
    case URLInvalid = "It appears that the url provided is invalid. Please try again..."
    case InternetConnectivityBad = "Try connecting to internet"
    case BadRequest = "400 - The server cannot or will not process the request due to an apparent client eerror"
    case Unauthorized = "401 - Similar to 403 Forbidden, but specifically for use when authentication is required and has failed or has not yet been provided. The response must include a WWW-Authenticate header field containing a challenge applicable to the requested resource. See Basic access authentication and Digest access authentication.[31] 401 semantically means \"unauthorised\",[32] the user does not have valid authentication credentials for the target resource."
    case PaymentRequired = "402 - Reserved for future use. The original intention was that this code might be used as part of some form of digital cash or micropayment scheme, as proposed, for example, by GNU Taler, but that has not yet happened, and this code is not widely used. Google Developers API uses this status if a particular developer has exceeded the daily limit on requests. Sipgate uses this code if an account does not have sufficient funds to start a call. Shopify uses this code when the store has not paid their fees and is temporarily disabled. Stripe uses this code for failed payments where parameters were correct, for example blocked fraudulent payments."
    case Forbidden = "403 - The request contained valid data and was understood by the server, but the server is refusing action. This may be due to the user not having the necessary permissions for a resource or needing an account of some sort, or attempting a prohibited action (e.g. creating a duplicate record where only one is allowed). This code is also typically used if the request provided authentication by answering the WWW-Authenticate header field challenge, but the server did not accept that authentication. The request should not be repeated."
    case NotFound = "404 - The requested resource could not be found but may be available in the future. Subsequent requests by the client are permissible."
    case MethodNotAllowed = "405 - A request method is not supported for the requested resource; for example, a GET request on a form that requires data to be presented via POST, or a PUT request on a read-only resource."
    case NotAcceptable = "406 - The requested resource is capable of generating only content not acceptable according to the Accept headers sent in the request. See Content negotiation. "
    case ProxyAuthenticationRequired = "407 - The client must first authenticate itself with the proxy"
    case RequestTimeOut = "408 - The server timed out waiting for the request. According to HTTP specifications: \"The client did not produce a request within the time that the server was prepared to wait. The client MAY repeat the request without modifications at any later time\""
    case Conflict = "409 - Indicates that the request could not be processed because of conflict in the current state of the resource, such as an edit conflict between multiple simultaneous updates."
    case Gone = "410 - Indicates that the resource requested is no longer available and will not be available again. This should be used when a resource has been intentionally removed and the resource should be purged. Upon receiving a 410 status code, the client should not request the resource in the future. Clients such as search engines should remove the resource from their indices. Most use cases do not require clients and search engines to purge the resource, and a \"404 Not Found\" may be used instead."
    case LengthRequired = "411 - The request did not specify the length of its content, which is required by the requested resource."
    case PreconditionFailed = "412 - The server does not meet one of the preconditions that the requester put on the request header fields"
    case PayloadTooLarge = "413 - The request is larger than the server is willing or able to process. Previously called \"Request Entity Too Large\""
    case URITooLong = "414 - The URI provided was too long for the server to process. Often the result of too much data being encoded as a query-string of a GET request, in which case it should be converted to a POST request. Called \"Request-URI Too Long\" previously."
    case UnsupportedMediaType = "415 - The request entity has a media type which the server or resource does not support. For example, the client uploads an image as image/svg+xml, but the server requires that images use a different format."
    case RangeNotSatisfiable = "416 - The client has asked for a portion of the file (byte serving), but the server cannot supply that portion. For example, if the client asked for a part of the file that lies beyond the end of the file. Called \"Requested Range Not Satisfiable\" previously."
    case ExpectationFailed = "417 - The server cannot meet the requirements of the Expect request-header field."
    case ImATeaPot = "418 - This code was defined in 1998 as one of the traditional IETF April Fools' jokes, in RFC 2324, Hyper Text Coffee Pot Control Protocol, and is not expected to be implemented by actual HTTP servers. The RFC specifies this code should be returned by teapots requested to brew coffee. This HTTP status is used as an Easter egg in some websites, such as Google.com's I'm a teapot easter egg"
    case MisdirectedRequest = "421 - The request was directed at a server that is not able to produce a response (for example because of connection reuse)."
    case UnprocessableEntity = "422 - The request was well-formed but was unable to be followed due to semantic errors."
    case Locked = "423 - The resource that is being accessed is locked."
    case FailedDependency = "424 - The request failed because it depended on another request and that request failed (e.g., a PROPPATCH)."
    case TooEarly = "425 - Indicates that the server is unwilling to risk processing a request that might be replayed."
    case UpgradeRequired = "426 - The client should switch to a different protocol such as TLS/1.3, given in the Upgrade header field"
    case PreconditionRequired = "428 - The origin server requires the request to be conditional. Intended to prevent the 'lost update' problem, where a client GETs a resource's state, modifies it, and PUTs it back to the server, when meanwhile a third party has modified the state on the server, leading to a conflict"
    case TooManyRequest = "429 - The user has sent too many requests in a given amount of time. Intended for use with rate-limiting schemes"
    case RequestHeaderFieldsTooLarge = "431 - The server is unwilling to process the request because either an individual header field, or all the header fields collectively, are too large."
    case UnavailableForLegalReasons = "451 - A server operator has received a legal demand to deny access to a resource or to a set of resources that includes the requested resource. The code 451 was chosen as a reference to the novel Fahrenheit 451 (see the Acknowledgements in the RFC)."
    
    case InternalServerError = "500 - A generic error message, given when an unexpected condition was encountered and no more specific message is suitable."
    case NotImplemented = "501 - The server either does not recognize the request method, or it lacks the ability to fulfil the request. Usually this implies future availability (e.g., a new feature of a web-service API)"
    case BadGateWay = "502 - The server was acting as a gateway or proxy and received an invalid response from the upstream server."
    case ServiceUnavailable = "503 - The server cannot handle the request (because it is overloaded or down for maintenance). Generally, this is a temporary state."
    case GatewayTimeout = "504 - The server was acting as a gateway or proxy and did not receive a timely response from the upstream server."
    case HTTPVersionNotSupported = "505 - The server does not support the HTTP protocol version used in the request."
    case VariantAlsoNegotiates = "506 - Transparent content negotiation for the request results in a circular reference."
    case InsuffientStorage = "507 - The server is unable to store the representation needed to complete the request."
    case LoopDetected = "508 - The server detected an infinite loop while processing the request (sent instead of 208 Already Reported)."
    case NotExtended = "510 - Further extensions to the request are required for the server to fulfil it."
    case NetworkAuthenticationRequired = "511 - The client needs to authenticate to gain network access. Intended for use by intercepting proxies used to control access to the network (e.g., \"captive portals\" used to require agreement to Terms of Service before granting full Internet access via a Wi-Fi hotspot)."
}
