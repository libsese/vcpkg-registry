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

| project     | package     | version |
|-------------|-------------|---------|
| sese-core   | sese        | 1.2.0   |
| sese-db     | x           | x       |
| sese-event  | sese-event  | 0.1.6   |
| sese-plugin | sese-plugin | 0.2.3   |
| SString     | sstring     | 0.1.6   |
| SimpleUuid  | simpleuuid  | 0.1.5   |