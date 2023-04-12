set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/sstring)

vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/libsese/SString/archive/refs/tags/v0.1.5.zip"
        FILENAME "SString-0.1.5.zip"
        SHA512 c4b9ae6c44aaadc79b887556a54838e29e7039ca8c0770ec3e6add10220e79a8c6c54e175399133a8d8b2e953152cc8a9c125a375911770078089c1680eb54fe
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