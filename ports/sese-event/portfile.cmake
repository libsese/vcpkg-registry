set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/sese-event)

vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/libsese/sese-event/archive/refs/tags/0.1.5.zip"
        FILENAME "sese-event-0.1.5.zip"
        SHA512 cd7923739310618d70bab676aeff0b4458f4f5add317fd1ab5fba85506163939637ec0890598ac95e9c33ec35a7ede7e62d176f2646e9e5717aaa714c31a5e3d
        )

vcpkg_extract_source_archive_ex(
        OUT_SOURCE_PATH SOURCE_PATH
        ARCHIVE "${ARCHIVE}"
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES
            tests SESE_EVENT_BUILD_TEST
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/sese-event)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(COPY "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/sese-event")
file(RENAME "${CURRENT_PACKAGES_DIR}/share/sese-event/LICENSE" "${CURRENT_PACKAGES_DIR}/share/sese-event/copyright")