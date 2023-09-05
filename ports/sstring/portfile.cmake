set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/sstring)

vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/libsese/SString/archive/refs/tags/0.1.6.zip"
        FILENAME "SString-0.1.6.zip"
        SHA512 c7e28e45fb791169c2a5433e257da8eaefafe2bd10cd7185ba1ebfcfd6c8ddfe92485c06fcad112ad0d9a30caf6a369ae27b40a4adc3484476c31c1cd9f87c42
        )

vcpkg_extract_source_archive_ex(
        OUT_SOURCE_PATH SOURCE_PATH
        ARCHIVE "${ARCHIVE}"
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES
            tests SSTRING_BUILD_TEST
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/SString)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(COPY "${SOURCE_PATH}/license" DESTINATION "${CURRENT_PACKAGES_DIR}/share/sstring")
file(RENAME "${CURRENT_PACKAGES_DIR}/share/sstring/license" "${CURRENT_PACKAGES_DIR}/share/sstring/copyright")