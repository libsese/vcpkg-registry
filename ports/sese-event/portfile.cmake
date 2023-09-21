set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/sese-event)

vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/libsese/sese-event/archive/refs/tags/0.1.7.zip"
        FILENAME "sese-event-0.1.7.zip"
        SHA512 7e89da98efbd9466d20b88324a156995b5ea8e5f03907476cb12857340e089dafef620a44806b9171accec352d1a55da550d983d7fc7d8ca27c5f295bbe6db95
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