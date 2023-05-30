set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/sese-plugin)

vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/libsese/sese-plugin/archive/refs/tags/0.2.1.zip"
        FILENAME "sese-plugin.0.2.1.zip"
        SHA512 72086e77262bdd12044e9b99f5f859e51695617f556ac71714d2ab75626346b151befa389773d5fd12bb75e841c73220485144edfb905a8e5832177fc499d975
        )

vcpkg_extract_source_archive_ex(
        OUT_SOURCE_PATH SOURCE_PATH
        ARCHIVE "${ARCHIVE}"
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/sese-plugin)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(COPY "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/sese-plugin")
file(RENAME "${CURRENT_PACKAGES_DIR}/share/sese-plugin/LICENSE" "${CURRENT_PACKAGES_DIR}/share/sese-plugin/copyright")


