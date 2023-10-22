set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/sese)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO libsese/sese-core
        REF 1.3.1
        SHA512 dbba814e3d0e8d2cdd89b0c8fa7f51428473bc443bae139bc57d4e6a9289c60ea4ea733fdfd455fd576310aabca1bc810f5025c46e98a320576bec5054b78a48
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES
        tests        SESE_BUILD_TEST
        async-logger USE_ASYNC_LOGGER
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
        OPTIONS ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/sese-core)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(COPY "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/sese-core")
file(RENAME "${CURRENT_PACKAGES_DIR}/share/sese-core/LICENSE" "${CURRENT_PACKAGES_DIR}/share/sese-core/copyright")