set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/simpleuuid)

vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/libsese/SimpleUuid/archive/refs/tags/0.1.5.zip"
        FILENAME "SimpleUuid-0.1.5.zip"
        SHA512 a90fc823e3f850d90553248a5c8dd6e96398e5a62593b11a94d76c51a86a570d064876acba872c7a59829a1aa6e41135f52b8fd3fd80e5e30fc7dcfd8c2d721b
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