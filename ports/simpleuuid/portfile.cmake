set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/simpleuuid)

vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/libsese/SimpleUuid/archive/refs/tags/v0.1.4b.zip"
        FILENAME "SimpleUuid-0.1.4b.zip"
        SHA512 dd7e3345a3e745ce2113da2cb99d578045cc9a9fae56f3bb9c07840840a2f9fc63c0267d746b50401c10f86e97f6e5793fa06b99cc3cc32f047a4d4a5802c041
        )

vcpkg_extract_source_archive_ex(
        OUT_SOURCE_PATH SOURCE_PATH
        ARCHIVE "${ARCHIVE}"
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES
            tests UUID_BUILD_TEST
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/SimpleUuid)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(COPY "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/simpleuuid")
file(RENAME "${CURRENT_PACKAGES_DIR}/share/simpleuuid/LICENSE" "${CURRENT_PACKAGES_DIR}/share/simpleuuid/copyright")