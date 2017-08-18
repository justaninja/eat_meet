//
//  NetworkClient.swift
//  EatMeet
//
//  Created by Konstantin Khokhlov on 17.08.17.
//  Copyright © 2017 Konstantin Khokhlov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkClient {

    // MARK: - Nested
    private struct Keys {
        static let baseURL = "base_url"
        static let api = "api_key"
    }

    private struct URLKeys {
        static let categories = "categories"
        static let city = "city_id"
    }

    // MARK: - Properties
    private let baseURL: URL
    private let apiKey: String

    /// A closure to call when the request is successed.
    typealias Success = (JSON) -> Void
    /// A closure to call when the request is failed.
    typealias Failure = ([String: Any]) -> Void

    /// Returns the shared NetworkClient object.
    static let shared: NetworkClient = {
        guard let path = Bundle.main.path(
            forResource: "ServerSettings",
            ofType: "plist") else {
                fatalError("There should be a settings file")
        }

        guard let dictionary = NSDictionary(contentsOfFile: path) else {
            fatalError("There should be a settings dictionary")
        }

        guard let urlString = dictionary[Keys.baseURL] as? String,
        let url = URL(string: urlString) else {
            fatalError("There should be a base URL")
        }

        guard let key = dictionary[Keys.api] as? String else {
            fatalError("There should be an API key")
        }

        return NetworkClient(url: url, key: key)
    }()

    // MARK: - Inits
    private init(url: URL, key: String) {
        baseURL = url
        apiKey = key
    }

    /// Creates a request to the site.
    ///
    /// - Parameters:
    ///   - url: An URL.
    ///   - success: A closure to call when the request is successed.
    ///   - failure: A closure to call when the request is failed.
    private func request(url: URL, success: @escaping Success, failure: @escaping Failure) {
        let headers: HTTPHeaders = [
            "Accept": "application/json",
             "user-key": apiKey
        ]

        Alamofire.request(url, headers: headers).responseJSON { response in

            switch response.result {
            case .success(let value):
                guard let dictionary = value as? [String: Any] else {
                    fatalError("There should be a dictionary")
                }
                if let statusCode = response.response?.statusCode,
                    200 <= statusCode && statusCode < 300 {
                    let json = JSON(value)
                    success(json)
                } else {
                    failure(dictionary)
                }
            case .failure(let error):
                failure(["message": error.localizedDescription])
            }
        }
    }

    /// Gets groups data.
    ///
    /// - Parameters:
    ///   - type: A group type enum.
    ///   - cityID: A Zomato City ID. (Prague = 84)
    ///   - success: A closure to call when the request is successed.
    ///   - failure: A closure to call when the request is failed.
    func getGroup(for type: GroupType, in cityID: Int = 84, success: @escaping Success, failure: @escaping Failure) {
        let relativeURL = baseURL.appendingPathComponent(type.rawValue)
        guard var urlComponents = URLComponents(url: relativeURL, resolvingAgainstBaseURL: true) else {
            fatalError("There should be URL coomponents")
        }
        urlComponents.query = ""
        let queryItem = URLQueryItem(name: URLKeys.city, value: cityID.description)
        urlComponents.queryItems?.append(queryItem)

        guard let url = urlComponents.url else {
            fatalError("There should be an URL")
        }

        request(url: url, success: { json in
            success(json)
        }) { messages in
            failure(messages)
        }
    }
}
