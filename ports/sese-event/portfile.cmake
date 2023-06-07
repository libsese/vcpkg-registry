set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/sese-event)

vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/libsese/sese-event/archive/refs/tags/0.1.1.zip"
        FILENAME "sese-event-0.1.1.zip"
        SHA512 14828353730463b554b8f223e96c6aff8d348873f8b725f2a240e3869e563faecb86dfd4f2d4b35627a2354bb4deeeef3c7c596aefe060a54c03363c1319e016
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