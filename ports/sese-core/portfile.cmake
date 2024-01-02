set(SOURCE_PATH ${CURRENT_BUILDTRESS_DIR}/sese)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO libsese/sese-core
        REF 1.3.4
        SHA512 0ce513155ac6af5344e8e6a20ce8161597aa89bcd08b8d6098750c6abc6115ccbb5c1fd6f37a86d1549d8efc7cc15f8e4066f022ff074ff0b7100b61fe9d06f8
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES
        tests        SESE_BUILD_TEST
        async-logger USE_ASYNC_LOGGER
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