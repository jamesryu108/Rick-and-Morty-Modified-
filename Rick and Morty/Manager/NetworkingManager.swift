//
//  NetworkingManager.swift
//  Rick&Monty
//
//  Created by James Ryu on 2021-12-08.
//

import Foundation
import UIKit

class NetworkingManager {
    
    // Using Singleton pattern to make this globally accessible
    static let shared = NetworkingManager()
    
    // URLSession singleton
    let session = URLSession.shared
    /// NSCache object to store UIImage file, so that same image don't have to be fetched multiple times
    let cache = NSCache<NSString, UIImage>()

    /// Base url that you end point to
    let baseURLEpisode = "https://rickandmortyapi.com/api/episode"
    let baseURLCharacter = "https://rickandmortyapi.com/api/character/"

    private init() {}
    
    /// Download images from the provided url string
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard let self = self,
                error == nil,
                let response = response as? HTTPURLResponse, response.statusCode == 200,
                let data = data,
                let image = UIImage(data: data) else {
                    completed(nil)
                    return
                }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
    
    /// Get character informations
    func getAllCharacters(ids: [Int], completed: @escaping (Result<[CharacterResults]?, NetworkError>) -> Void){

        // Check and see if the app is connected to network.
        guard Reachability.isConnectedToNetwork() else {
            completed(.failure(.InternetConnectivityBad))
            return
        }
        // Using map to create an endpoint needed for fetching multiple characters. e.g [1,2,3]
        let str = ids.map{"\($0)"}.joined(separator: ",")
        /// baseURL + endpoint
        let fullURL: String = baseURLCharacter + str
                
        guard let url = URL(string: fullURL) else {

            completed(.failure(.URLInvalid))
            
            return
        }
        
        let task = session.dataTask(with: url) { [self] data, urlResponse, errorMessage in
            
            guard errorMessage == nil else {
                completed(.failure(.Unknown))
                return
            }

            guard let res = urlResponse as? HTTPURLResponse, (res.statusCode >= 200 && res.statusCode < 210) else {
                             
                let statusCode = (urlResponse as! HTTPURLResponse).statusCode
                
                completed(.failure(checkForStatusCode(statusCode: statusCode)))
                
                return
            }

            guard let data = data else {
                
                completed(.failure(.BadData))
                return
            }
            do {
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let characterData = try decoder.decode([CharacterResults].self, from: data)
                
                completed(.success(characterData))
                
            } catch {
                completed(.failure(.BadData))
            }
        }
        task.resume()
    }
    
    /// This function matches status code so that it can return appropriate NetworkError value.
    func checkForStatusCode(statusCode: Int) -> NetworkError {

        var statusName: NetworkError?
        
        switch statusCode {
        case 300..<309: statusName = .Redirect
        case 400: statusName = .BadRequest
        case 401: statusName = .Unauthorized
        case 402: statusName = .PaymentRequired
        case 403: statusName = .Forbidden
        case 404: statusName = .NotFound
        case 405: statusName = .MethodNotAllowed
        case 406: statusName = .NotAcceptable
        case 407: statusName = .ProxyAuthenticationRequired
        case 408: statusName = .RequestTimeOut
        case 409: statusName = .Conflict
        case 410: statusName = .Gone
        case 411: statusName = .LengthRequired
        case 412: statusName = .PreconditionFailed
        case 413: statusName = .PayloadTooLarge
        case 414: statusName = .URITooLong
        case 415: statusName = .UnsupportedMediaType
        case 416: statusName = .RangeNotSatisfiable
        case 417: statusName = .ExpectationFailed
        case 418: statusName = .ImATeaPot
        case 421: statusName = .MisdirectedRequest
        case 422: statusName = .UnprocessableEntity
        case 423: statusName = .Locked
        case 424: statusName = .FailedDependency
        case 425: statusName = .TooEarly
        case 426: statusName = .UpgradeRequired
        case 428: statusName = .PreconditionRequired
        case 429: statusName = .TooManyRequest
        case 431: statusName = .RequestHeaderFieldsTooLarge
        case 451: statusName = .UnavailableForLegalReasons
        case 500: statusName = .InternalServerError
        case 501: statusName = .NotImplemented
        case 502: statusName = .BadGateWay
        case 503: statusName = .ServiceUnavailable
        case 504: statusName = .GatewayTimeout
        case 505: statusName = .HTTPVersionNotSupported
        case 506: statusName = .VariantAlsoNegotiates
        case 507: statusName = .InsuffientStorage
        case 508: statusName = .LoopDetected
        case 510: statusName = .NotExtended
        case 511: statusName = .NetworkAuthenticationRequired
        default: statusName = .UnknownServer
        }
        return statusName!
    }

    /// Fetch episode informations
    func getAllEpisodes(pageCount: Int, completed: @escaping (Result<Episode?, NetworkError>) -> Void) {
                
        // Check and see if the app is connected to network.
        guard Reachability.isConnectedToNetwork() else {
            completed(.failure(.InternetConnectivityBad))
            return
        }
        
        /// baseURL + endpoint
        let fullURL: String = baseURLEpisode + "?page=\(pageCount)"
        
        guard let url = URL(string: fullURL) else {
            completed(.failure(.URLInvalid))
            return
        }
        
        let task = session.dataTask(with: url) { [self] data, urlResponse, errorMessage in
            
            guard errorMessage == nil else {
                completed(.failure(.Unknown))
                return
            }

            guard let res = urlResponse as? HTTPURLResponse, (res.statusCode >= 200 && res.statusCode < 210) else {
                             
                let statusCode = (urlResponse as! HTTPURLResponse).statusCode
                
                completed(.failure(checkForStatusCode(statusCode: statusCode)))
                
                return
            }
            
            guard let data = data else {
                
                completed(.failure(.BadData))
                return
            }
            do {
                
                let decoder = JSONDecoder()
                
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let episodeData = try decoder.decode(Episode.self, from: data)
                
                completed(.success(episodeData))
                
            } catch {
                completed(.failure(.BadData))
            }
        }
        task.resume()
    }
}

