set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/sese-event)

vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/libsese/sese-event/archive/refs/tags/0.1.6.zip"
        FILENAME "sese-event-0.1.6.zip"
        SHA512 3135dabb779eb5d5b4a75ba2cd372fc7160b331804fc2fd4ae0ab903e48703b8a8f24852ef7b933c0c02c29dda263c8a3ffcd2ac8dcf7eb5e0778d0be14a390a
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