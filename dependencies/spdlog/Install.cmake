include(GNUInstallDirs)

install(TARGETS Dolanan
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})

if(NOT LINK_DEPS_STATIC)
    set_target_properties(Dolanan PROPERTIES INSTALL_RPATH $ORIGIN/../${CMAKE_INSTALL_LIBDIR})

    set_target_properties(spdlog PROPERTIES INSTALL_RPATH $ORIGIN)

    install(TARGETS
            spdlog
            PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
            RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
            LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
            NAMELINK_SKIP)
endif()

include(CPack)