import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeService(
    target: .BaseService,
    targets: [
        .makeService(target: .BaseService, dependencies: [
            .shared(target: .GlobalThirdPartyLibrary),
            .SPM.Alamofire
        ])
    ]
)
