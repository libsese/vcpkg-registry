set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/sese)

vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/libsese/sese-core/archive/refs/tags/0.6.3.zip"
        FILENAME "sese-core-0.6.3.zip"
        SHA512 b13266fbac649220518cd2f13428326bbe5b2b8c41104ed2fb7c9be1690f0944f4ba7910b6a5da4f5a7be849347bfb5445d4b2a904b907751a0fddee993777ea
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