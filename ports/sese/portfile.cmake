set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/sese)

vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/libsese/sese.core/archive/refs/tags/0.5.3a.zip"
        FILENAME "sese-core-0.5.3a.zip"
        SHA512 215468bbcb1aea5308a0e5fcfc9d0210ee49b7e9e79407f0477c7d23cb043eff71126b28eee40d775bbd94b2d29c04bf7048b04a7ddd3eb94ca3c23a63eb49aa
        )

vcpkg_extract_source_archive_ex(
        OUT_SOURCE_PATH SOURCE_PATH
        ARCHIVE "${ARCHIVE}"
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/sese)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(COPY "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/sese")
file(RENAME "${CURRENT_PACKAGES_DIR}/share/sese/LICENSE" "${CURRENT_PACKAGES_DIR}/share/sese/copyright")