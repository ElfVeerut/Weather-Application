//
//  URLRequestExtension.swift
//  WeatherApp
//
//  Created by Elf Veerut on 2/4/22.
//

import Foundation

extension URLRequest {
	init(_ resource: Resource) {
		self.init(url: resource.url)
		self.httpMethod = resource.method
	}
}
