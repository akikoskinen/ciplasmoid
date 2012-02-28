cmake_minimum_required(VERSION 2.8)

project(ciplasmoid)
 
find_package(KDE4 REQUIRED)
 
include(KDE4Defaults)
 
install(DIRECTORY ciplasmoid/ DESTINATION ${DATA_INSTALL_DIR}/plasma/plasmoids/ciplasmoid)
 
install(FILES ciplasmoid/metadata.desktop DESTINATION ${SERVICES_INSTALL_DIR} RENAME plasma-applet-ciplasmoid.desktop)
