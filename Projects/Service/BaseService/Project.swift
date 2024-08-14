import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeService(
    target: .Base,
    targets: [
        .service(target: .Base, product: .framework, dependencies: [
//            .shared(target: .GlobalThirdPartyLibrary),
            .shared(target: .DateUtil),
            .shared(target: .SwiftUtil),
            .SPM.Alamofire,
            .SPM.OpenGraph,
            .SPM.Needle
        ]),
        .serviceInterface(target: .Base, dependencies: []),
        .serviceTesting(target: .Base, dependencies: [
            .service(target: .Base)
        ]),
        .serviceTests(target: .Base, dependencies: [
            .serviceTesting(target: .Base)
        ])
    ]
)
