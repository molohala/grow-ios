//
//  Interface.swift
//  ProjectDescriptionHelpers
//
//  Created by dgsw8th71 on 4/7/24.
//

import ProjectDescription

private let nameAttribute = Template.Attribute.required("name")

private let template = Template(
    description: "A template for a new interface module",
    attributes: [
        nameAttribute
    ],
    items: [
        .file(
            path: "Projects/Feature/\(nameAttribute)Feature/Interface/\(nameAttribute)Buildable.swift",
            templatePath: "Buildable.stencil"
        )
    ]
)
