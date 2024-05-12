# vcpkg-registry

## Usage

Please edit the **vcpkg.json** and **vcpkg-configuration.json** on your project root path.

### vcpkg.json

```json
{
    "name": "xxx",
    "version-string": "1.0.0",
    "dependencies": [
        "the-package-what-you-need"
    ]
}
```

### vcpkg-configuration.json

```json
{
    "default-registry": {
        "kind": "git",
        "repository": "https://github.com/microsoft/vcpkg.git",
        "baseline": "the-repository-base-line-what-you-need"
    },
    "registries": [
        {
            "kind": "git",
            "repository": "https://github.com/libsese/vcpkg-registry.git",
            "baseline": "the-repository-base-line-what-you-need",
            "packages": [
                "sese-package-name"
            ]
        }
    ]
}
```

## Packages

| project     | package     | version    |
|-------------|-------------|------------|
| sese        | sese        | 2.1.0      |
| sese-db     | sese-db     | deprecated |
| sese-event  | sese-event  | deprecated |
| sese-plugin | sese-plugin | deprecated |
| SString     | sstring     | deprecated |
| SimpleUuid  | simpleuuid  | deprecated |