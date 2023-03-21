set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/simpleuuid)

vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/libsese/SimpleUuid/archive/refs/tags/v0.1.4.zip"
        FILENAME "SimpleUuid-0.1.4.zip"
        SHA512 9f2272bbc7121051fa4477b36c3841b2ff3fbdd0e4be2fcb5a1ec153510667b9e516bb5197f8297da35c8a6a4c99b848732d6895cc36d02553596d6b54271423
        )

vcpkg_extract_source_archive_ex(
        OUT_SOURCE_PATH SOURCE_PATH
        ARCHIVE "${ARCHIVE}"
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/SimpleUuid)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(COPY "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/simpleuuid")
file(RENAME "${CURRENT_PACKAGES_DIR}/share/simpleuuid/LICENSE" "${CURRENT_PACKAGES_DIR}/share/simpleuuid/copyright")