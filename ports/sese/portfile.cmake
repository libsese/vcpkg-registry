set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/sese)

vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/libsese/sese-core/archive/refs/tags/0.7.6.zip"
        FILENAME "sese-core-0.7.6.zip"
        SHA512 4804e9a20a24e9c5c69193e82c6bfe695f3e61fbc0807c05941a9bf3002be05fc7fd33942f4bc8e45f88c043c903add2f56637e5553b5be395e2011c4ded321b
        )

vcpkg_extract_source_archive_ex(
        OUT_SOURCE_PATH SOURCE_PATH
        ARCHIVE "${ARCHIVE}"
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES
        tests        SESE_BUILD_TEST
        async-logger USE_ASYNC_LOGGER
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/sese)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(COPY "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/sese")
file(RENAME "${CURRENT_PACKAGES_DIR}/share/sese/LICENSE" "${CURRENT_PACKAGES_DIR}/share/sese/copyright")