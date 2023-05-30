set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/sese-event)

vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/libsese/sese-event/archive/refs/tags/0.1.0.zip"
        FILENAME "sese-event-0.1.0.zip"
        SHA512 2b0826a100c42e38b279578193440ad7ff30f217889945e5ba97c282cd84e7a9cac40a98246c9e174ffb19cb4f5d8a1c851bc872eeda1a81e70b81cd8d947442
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