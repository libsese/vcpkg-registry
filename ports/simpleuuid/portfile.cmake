set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/simpleuuid)

vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/libsese/SimpleUuid/archive/refs/tags/0.1.5.zip"
        FILENAME "SimpleUuid-0.1.5.zip"
        SHA512 919d4d388776a50d442819f68a4bae2c6b6cc8d0c9ff32e0dcd597394a936642dee9e3283ec2d855241a6e2212bbc99e5906f225eeacbf75d096aabf4a4987fc
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