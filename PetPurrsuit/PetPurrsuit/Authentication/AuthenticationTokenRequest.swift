//
//  AuthenticationTokenRequest.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/7/24.
//

enum AuthenticationTokenRequest: NetworkRequestProtocol {

    case authentication

    var endpointPath: String {
        "/v2/oauth2/token"
    }

    var requestParams: [String : Any] {
        [
            "grant_type": PetFinderAPIConstants.grantType,
            "client_id" : PetFinderAPIConstants.clientID,
            "client": PetFinderAPIConstants.clientSecret

        ]
    }

    var requestType: NetworkRequestType {
        .POST
    }

    var authorizationTokenRequired: Bool {
        false
    }

}
