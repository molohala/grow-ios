import ProjectDescription

private let nameAttribute = Template.Attribute.required("name")

private let template = Template(
    description: "A template for a new inteface module",
    attributes: [
        nameAttribute
    ],
    items: [
        .string(
            path: "Projects/Feature/\(nameAttribute)Feature/Interface/\(nameAttribute)Factory.swift",
            contents: "import Foundation"
        ),
        .file(
            path: "Projects/Feature/\(nameAttribute)Feature/Project.swift",
            templatePath: "Project.stencil"
        )
    ]
)
