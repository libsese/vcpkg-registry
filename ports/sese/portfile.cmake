set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/sese)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO libsese/sese
        REF 2.1.0
        SHA512 c4e2d40d8d2001bb384db7bb5ed30474e47e3c6601821369157058b3580f1ee23297505d307a9050c56a20c525619fa011c497d854c63da53537277b34a4ae94
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES
        tests        SESE_BUILD_TEST
        mysql        SESE_DB_USE_MARIADB
        sqlite3      SESE_DB_USE_SQLITE
        psql         SESE_DB_USE_POSTGRES
        async-logger SESE_USE_ASYNC_LOGGER
        archive      SESE_USE_ARCHIVE
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
        OPTIONS ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/sese-core)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(COPY "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/sese-core")
file(RENAME "${CURRENT_PACKAGES_DIR}/share/sese-core/LICENSE" "${CURRENT_PACKAGES_DIR}/share/sese-core/copyright")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")