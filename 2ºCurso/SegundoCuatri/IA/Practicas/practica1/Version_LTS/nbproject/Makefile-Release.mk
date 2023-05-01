#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Linux
CND_DLIB_EXT=so
CND_CONF=Release
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/Comportamientos_Jugador/aldeano.o \
	${OBJECTDIR}/Comportamientos_Jugador/jugador.o \
	${OBJECTDIR}/Comportamientos_Jugador/perro.o \
	${OBJECTDIR}/main.o \
	${OBJECTDIR}/src/comportamientos/comportamiento.o \
	${OBJECTDIR}/src/glui/algebra3.o \
	${OBJECTDIR}/src/glui/arcball.o \
	${OBJECTDIR}/src/glui/glui.o \
	${OBJECTDIR}/src/glui/glui_add_controls.o \
	${OBJECTDIR}/src/glui/glui_bitmap_img_data.o \
	${OBJECTDIR}/src/glui/glui_bitmaps.o \
	${OBJECTDIR}/src/glui/glui_button.o \
	${OBJECTDIR}/src/glui/glui_checkbox.o \
	${OBJECTDIR}/src/glui/glui_column.o \
	${OBJECTDIR}/src/glui/glui_commandline.o \
	${OBJECTDIR}/src/glui/glui_control.o \
	${OBJECTDIR}/src/glui/glui_edittext.o \
	${OBJECTDIR}/src/glui/glui_filebrowser.o \
	${OBJECTDIR}/src/glui/glui_list.o \
	${OBJECTDIR}/src/glui/glui_listbox.o \
	${OBJECTDIR}/src/glui/glui_mouse_iaction.o \
	${OBJECTDIR}/src/glui/glui_node.o \
	${OBJECTDIR}/src/glui/glui_panel.o \
	${OBJECTDIR}/src/glui/glui_radio.o \
	${OBJECTDIR}/src/glui/glui_rollout.o \
	${OBJECTDIR}/src/glui/glui_rotation.o \
	${OBJECTDIR}/src/glui/glui_scrollbar.o \
	${OBJECTDIR}/src/glui/glui_separator.o \
	${OBJECTDIR}/src/glui/glui_spinner.o \
	${OBJECTDIR}/src/glui/glui_statictext.o \
	${OBJECTDIR}/src/glui/glui_string.o \
	${OBJECTDIR}/src/glui/glui_textbox.o \
	${OBJECTDIR}/src/glui/glui_translation.o \
	${OBJECTDIR}/src/glui/glui_tree.o \
	${OBJECTDIR}/src/glui/glui_treepanel.o \
	${OBJECTDIR}/src/glui/glui_window.o \
	${OBJECTDIR}/src/glui/quaternion.o \
	${OBJECTDIR}/src/glui/viewmodel.o \
	${OBJECTDIR}/src/modelos/aldeano/aldeano.o \
	${OBJECTDIR}/src/modelos/aldeano/brazo.o \
	${OBJECTDIR}/src/modelos/aldeano/cabeza.o \
	${OBJECTDIR}/src/modelos/aldeano/cintura.o \
	${OBJECTDIR}/src/modelos/aldeano/pierna.o \
	${OBJECTDIR}/src/modelos/aldeano/torso.o \
	${OBJECTDIR}/src/modelos/arbol/arbol.o \
	${OBJECTDIR}/src/modelos/item/item.o \
	${OBJECTDIR}/src/modelos/jugador/jugador3d.o \
	${OBJECTDIR}/src/modelos/jugador/quesito.o \
	${OBJECTDIR}/src/modelos/perro/cabeza.o \
	${OBJECTDIR}/src/modelos/perro/lomo.o \
	${OBJECTDIR}/src/modelos/perro/perro.o \
	${OBJECTDIR}/src/modelos/retrato.o \
	${OBJECTDIR}/src/motorlib/entidad.o \
	${OBJECTDIR}/src/motorlib/mapa.o \
	${OBJECTDIR}/src/motorlib/monitor.o \
	${OBJECTDIR}/src/motorlib/motor_grafico.o \
	${OBJECTDIR}/src/motorlib/motor_juego.o \
	${OBJECTDIR}/src/motorlib/util.o \
	${OBJECTDIR}/src/obj3dlib/cono3d.o \
	${OBJECTDIR}/src/obj3dlib/cono3dwire.o \
	${OBJECTDIR}/src/obj3dlib/cubo3d.o \
	${OBJECTDIR}/src/obj3dlib/dodecaedro3d.o \
	${OBJECTDIR}/src/obj3dlib/esfera3d.o \
	${OBJECTDIR}/src/obj3dlib/file_ply_stl.o \
	${OBJECTDIR}/src/obj3dlib/icosaedro3d.o \
	${OBJECTDIR}/src/obj3dlib/jpeg_reader/jpg_imagen.o \
	${OBJECTDIR}/src/obj3dlib/jpeg_reader/jpg_memsrc.o \
	${OBJECTDIR}/src/obj3dlib/jpeg_reader/jpg_readwrite.o \
	${OBJECTDIR}/src/obj3dlib/luz.o \
	${OBJECTDIR}/src/obj3dlib/objeto3d.o \
	${OBJECTDIR}/src/obj3dlib/objrevolucion3d.o \
	${OBJECTDIR}/src/obj3dlib/octaedro3d.o \
	${OBJECTDIR}/src/obj3dlib/tetraedro3d.o \
	${OBJECTDIR}/src/obj3dlib/toro3d.o


# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/version_lts

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/version_lts: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.cc} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/version_lts ${OBJECTFILES} ${LDLIBSOPTIONS}

${OBJECTDIR}/Comportamientos_Jugador/aldeano.o: Comportamientos_Jugador/aldeano.cpp
	${MKDIR} -p ${OBJECTDIR}/Comportamientos_Jugador
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Comportamientos_Jugador/aldeano.o Comportamientos_Jugador/aldeano.cpp

${OBJECTDIR}/Comportamientos_Jugador/jugador.o: Comportamientos_Jugador/jugador.cpp
	${MKDIR} -p ${OBJECTDIR}/Comportamientos_Jugador
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Comportamientos_Jugador/jugador.o Comportamientos_Jugador/jugador.cpp

${OBJECTDIR}/Comportamientos_Jugador/perro.o: Comportamientos_Jugador/perro.cpp
	${MKDIR} -p ${OBJECTDIR}/Comportamientos_Jugador
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Comportamientos_Jugador/perro.o Comportamientos_Jugador/perro.cpp

${OBJECTDIR}/main.o: main.cpp
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/main.o main.cpp

${OBJECTDIR}/src/comportamientos/comportamiento.o: src/comportamientos/comportamiento.cpp
	${MKDIR} -p ${OBJECTDIR}/src/comportamientos
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/comportamientos/comportamiento.o src/comportamientos/comportamiento.cpp

${OBJECTDIR}/src/glui/algebra3.o: src/glui/algebra3.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/algebra3.o src/glui/algebra3.cpp

${OBJECTDIR}/src/glui/arcball.o: src/glui/arcball.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/arcball.o src/glui/arcball.cpp

${OBJECTDIR}/src/glui/glui.o: src/glui/glui.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui.o src/glui/glui.cpp

${OBJECTDIR}/src/glui/glui_add_controls.o: src/glui/glui_add_controls.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui_add_controls.o src/glui/glui_add_controls.cpp

${OBJECTDIR}/src/glui/glui_bitmap_img_data.o: src/glui/glui_bitmap_img_data.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui_bitmap_img_data.o src/glui/glui_bitmap_img_data.cpp

${OBJECTDIR}/src/glui/glui_bitmaps.o: src/glui/glui_bitmaps.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui_bitmaps.o src/glui/glui_bitmaps.cpp

${OBJECTDIR}/src/glui/glui_button.o: src/glui/glui_button.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui_button.o src/glui/glui_button.cpp

${OBJECTDIR}/src/glui/glui_checkbox.o: src/glui/glui_checkbox.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui_checkbox.o src/glui/glui_checkbox.cpp

${OBJECTDIR}/src/glui/glui_column.o: src/glui/glui_column.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui_column.o src/glui/glui_column.cpp

${OBJECTDIR}/src/glui/glui_commandline.o: src/glui/glui_commandline.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui_commandline.o src/glui/glui_commandline.cpp

${OBJECTDIR}/src/glui/glui_control.o: src/glui/glui_control.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui_control.o src/glui/glui_control.cpp

${OBJECTDIR}/src/glui/glui_edittext.o: src/glui/glui_edittext.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui_edittext.o src/glui/glui_edittext.cpp

${OBJECTDIR}/src/glui/glui_filebrowser.o: src/glui/glui_filebrowser.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui_filebrowser.o src/glui/glui_filebrowser.cpp

${OBJECTDIR}/src/glui/glui_list.o: src/glui/glui_list.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui_list.o src/glui/glui_list.cpp

${OBJECTDIR}/src/glui/glui_listbox.o: src/glui/glui_listbox.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui_listbox.o src/glui/glui_listbox.cpp

${OBJECTDIR}/src/glui/glui_mouse_iaction.o: src/glui/glui_mouse_iaction.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui_mouse_iaction.o src/glui/glui_mouse_iaction.cpp

${OBJECTDIR}/src/glui/glui_node.o: src/glui/glui_node.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui_node.o src/glui/glui_node.cpp

${OBJECTDIR}/src/glui/glui_panel.o: src/glui/glui_panel.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui_panel.o src/glui/glui_panel.cpp

${OBJECTDIR}/src/glui/glui_radio.o: src/glui/glui_radio.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui_radio.o src/glui/glui_radio.cpp

${OBJECTDIR}/src/glui/glui_rollout.o: src/glui/glui_rollout.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui_rollout.o src/glui/glui_rollout.cpp

${OBJECTDIR}/src/glui/glui_rotation.o: src/glui/glui_rotation.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui_rotation.o src/glui/glui_rotation.cpp

${OBJECTDIR}/src/glui/glui_scrollbar.o: src/glui/glui_scrollbar.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui_scrollbar.o src/glui/glui_scrollbar.cpp

${OBJECTDIR}/src/glui/glui_separator.o: src/glui/glui_separator.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui_separator.o src/glui/glui_separator.cpp

${OBJECTDIR}/src/glui/glui_spinner.o: src/glui/glui_spinner.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui_spinner.o src/glui/glui_spinner.cpp

${OBJECTDIR}/src/glui/glui_statictext.o: src/glui/glui_statictext.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui_statictext.o src/glui/glui_statictext.cpp

${OBJECTDIR}/src/glui/glui_string.o: src/glui/glui_string.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui_string.o src/glui/glui_string.cpp

${OBJECTDIR}/src/glui/glui_textbox.o: src/glui/glui_textbox.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui_textbox.o src/glui/glui_textbox.cpp

${OBJECTDIR}/src/glui/glui_translation.o: src/glui/glui_translation.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui_translation.o src/glui/glui_translation.cpp

${OBJECTDIR}/src/glui/glui_tree.o: src/glui/glui_tree.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui_tree.o src/glui/glui_tree.cpp

${OBJECTDIR}/src/glui/glui_treepanel.o: src/glui/glui_treepanel.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui_treepanel.o src/glui/glui_treepanel.cpp

${OBJECTDIR}/src/glui/glui_window.o: src/glui/glui_window.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/glui_window.o src/glui/glui_window.cpp

${OBJECTDIR}/src/glui/quaternion.o: src/glui/quaternion.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/quaternion.o src/glui/quaternion.cpp

${OBJECTDIR}/src/glui/viewmodel.o: src/glui/viewmodel.cpp
	${MKDIR} -p ${OBJECTDIR}/src/glui
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/glui/viewmodel.o src/glui/viewmodel.cpp

${OBJECTDIR}/src/modelos/aldeano/aldeano.o: src/modelos/aldeano/aldeano.cpp
	${MKDIR} -p ${OBJECTDIR}/src/modelos/aldeano
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/modelos/aldeano/aldeano.o src/modelos/aldeano/aldeano.cpp

${OBJECTDIR}/src/modelos/aldeano/brazo.o: src/modelos/aldeano/brazo.cpp
	${MKDIR} -p ${OBJECTDIR}/src/modelos/aldeano
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/modelos/aldeano/brazo.o src/modelos/aldeano/brazo.cpp

${OBJECTDIR}/src/modelos/aldeano/cabeza.o: src/modelos/aldeano/cabeza.cpp
	${MKDIR} -p ${OBJECTDIR}/src/modelos/aldeano
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/modelos/aldeano/cabeza.o src/modelos/aldeano/cabeza.cpp

${OBJECTDIR}/src/modelos/aldeano/cintura.o: src/modelos/aldeano/cintura.cpp
	${MKDIR} -p ${OBJECTDIR}/src/modelos/aldeano
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/modelos/aldeano/cintura.o src/modelos/aldeano/cintura.cpp

${OBJECTDIR}/src/modelos/aldeano/pierna.o: src/modelos/aldeano/pierna.cpp
	${MKDIR} -p ${OBJECTDIR}/src/modelos/aldeano
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/modelos/aldeano/pierna.o src/modelos/aldeano/pierna.cpp

${OBJECTDIR}/src/modelos/aldeano/torso.o: src/modelos/aldeano/torso.cpp
	${MKDIR} -p ${OBJECTDIR}/src/modelos/aldeano
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/modelos/aldeano/torso.o src/modelos/aldeano/torso.cpp

${OBJECTDIR}/src/modelos/arbol/arbol.o: src/modelos/arbol/arbol.cpp
	${MKDIR} -p ${OBJECTDIR}/src/modelos/arbol
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/modelos/arbol/arbol.o src/modelos/arbol/arbol.cpp

${OBJECTDIR}/src/modelos/item/item.o: src/modelos/item/item.cpp
	${MKDIR} -p ${OBJECTDIR}/src/modelos/item
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/modelos/item/item.o src/modelos/item/item.cpp

${OBJECTDIR}/src/modelos/jugador/jugador3d.o: src/modelos/jugador/jugador3d.cpp
	${MKDIR} -p ${OBJECTDIR}/src/modelos/jugador
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/modelos/jugador/jugador3d.o src/modelos/jugador/jugador3d.cpp

${OBJECTDIR}/src/modelos/jugador/quesito.o: src/modelos/jugador/quesito.cpp
	${MKDIR} -p ${OBJECTDIR}/src/modelos/jugador
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/modelos/jugador/quesito.o src/modelos/jugador/quesito.cpp

${OBJECTDIR}/src/modelos/perro/cabeza.o: src/modelos/perro/cabeza.cpp
	${MKDIR} -p ${OBJECTDIR}/src/modelos/perro
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/modelos/perro/cabeza.o src/modelos/perro/cabeza.cpp

${OBJECTDIR}/src/modelos/perro/lomo.o: src/modelos/perro/lomo.cpp
	${MKDIR} -p ${OBJECTDIR}/src/modelos/perro
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/modelos/perro/lomo.o src/modelos/perro/lomo.cpp

${OBJECTDIR}/src/modelos/perro/perro.o: src/modelos/perro/perro.cpp
	${MKDIR} -p ${OBJECTDIR}/src/modelos/perro
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/modelos/perro/perro.o src/modelos/perro/perro.cpp

${OBJECTDIR}/src/modelos/retrato.o: src/modelos/retrato.cpp
	${MKDIR} -p ${OBJECTDIR}/src/modelos
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/modelos/retrato.o src/modelos/retrato.cpp

${OBJECTDIR}/src/motorlib/entidad.o: src/motorlib/entidad.cpp
	${MKDIR} -p ${OBJECTDIR}/src/motorlib
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/motorlib/entidad.o src/motorlib/entidad.cpp

${OBJECTDIR}/src/motorlib/mapa.o: src/motorlib/mapa.cpp
	${MKDIR} -p ${OBJECTDIR}/src/motorlib
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/motorlib/mapa.o src/motorlib/mapa.cpp

${OBJECTDIR}/src/motorlib/monitor.o: src/motorlib/monitor.cpp
	${MKDIR} -p ${OBJECTDIR}/src/motorlib
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/motorlib/monitor.o src/motorlib/monitor.cpp

${OBJECTDIR}/src/motorlib/motor_grafico.o: src/motorlib/motor_grafico.cpp
	${MKDIR} -p ${OBJECTDIR}/src/motorlib
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/motorlib/motor_grafico.o src/motorlib/motor_grafico.cpp

${OBJECTDIR}/src/motorlib/motor_juego.o: src/motorlib/motor_juego.cpp
	${MKDIR} -p ${OBJECTDIR}/src/motorlib
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/motorlib/motor_juego.o src/motorlib/motor_juego.cpp

${OBJECTDIR}/src/motorlib/util.o: src/motorlib/util.cpp
	${MKDIR} -p ${OBJECTDIR}/src/motorlib
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/motorlib/util.o src/motorlib/util.cpp

${OBJECTDIR}/src/obj3dlib/cono3d.o: src/obj3dlib/cono3d.cc
	${MKDIR} -p ${OBJECTDIR}/src/obj3dlib
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/obj3dlib/cono3d.o src/obj3dlib/cono3d.cc

${OBJECTDIR}/src/obj3dlib/cono3dwire.o: src/obj3dlib/cono3dwire.cc
	${MKDIR} -p ${OBJECTDIR}/src/obj3dlib
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/obj3dlib/cono3dwire.o src/obj3dlib/cono3dwire.cc

${OBJECTDIR}/src/obj3dlib/cubo3d.o: src/obj3dlib/cubo3d.cc
	${MKDIR} -p ${OBJECTDIR}/src/obj3dlib
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/obj3dlib/cubo3d.o src/obj3dlib/cubo3d.cc

${OBJECTDIR}/src/obj3dlib/dodecaedro3d.o: src/obj3dlib/dodecaedro3d.cc
	${MKDIR} -p ${OBJECTDIR}/src/obj3dlib
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/obj3dlib/dodecaedro3d.o src/obj3dlib/dodecaedro3d.cc

${OBJECTDIR}/src/obj3dlib/esfera3d.o: src/obj3dlib/esfera3d.cc
	${MKDIR} -p ${OBJECTDIR}/src/obj3dlib
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/obj3dlib/esfera3d.o src/obj3dlib/esfera3d.cc

${OBJECTDIR}/src/obj3dlib/file_ply_stl.o: src/obj3dlib/file_ply_stl.cc
	${MKDIR} -p ${OBJECTDIR}/src/obj3dlib
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/obj3dlib/file_ply_stl.o src/obj3dlib/file_ply_stl.cc

${OBJECTDIR}/src/obj3dlib/icosaedro3d.o: src/obj3dlib/icosaedro3d.cc
	${MKDIR} -p ${OBJECTDIR}/src/obj3dlib
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/obj3dlib/icosaedro3d.o src/obj3dlib/icosaedro3d.cc

${OBJECTDIR}/src/obj3dlib/jpeg_reader/jpg_imagen.o: src/obj3dlib/jpeg_reader/jpg_imagen.cpp
	${MKDIR} -p ${OBJECTDIR}/src/obj3dlib/jpeg_reader
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/obj3dlib/jpeg_reader/jpg_imagen.o src/obj3dlib/jpeg_reader/jpg_imagen.cpp

${OBJECTDIR}/src/obj3dlib/jpeg_reader/jpg_memsrc.o: src/obj3dlib/jpeg_reader/jpg_memsrc.cpp
	${MKDIR} -p ${OBJECTDIR}/src/obj3dlib/jpeg_reader
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/obj3dlib/jpeg_reader/jpg_memsrc.o src/obj3dlib/jpeg_reader/jpg_memsrc.cpp

${OBJECTDIR}/src/obj3dlib/jpeg_reader/jpg_readwrite.o: src/obj3dlib/jpeg_reader/jpg_readwrite.cpp
	${MKDIR} -p ${OBJECTDIR}/src/obj3dlib/jpeg_reader
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/obj3dlib/jpeg_reader/jpg_readwrite.o src/obj3dlib/jpeg_reader/jpg_readwrite.cpp

${OBJECTDIR}/src/obj3dlib/luz.o: src/obj3dlib/luz.cpp
	${MKDIR} -p ${OBJECTDIR}/src/obj3dlib
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/obj3dlib/luz.o src/obj3dlib/luz.cpp

${OBJECTDIR}/src/obj3dlib/objeto3d.o: src/obj3dlib/objeto3d.cc
	${MKDIR} -p ${OBJECTDIR}/src/obj3dlib
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/obj3dlib/objeto3d.o src/obj3dlib/objeto3d.cc

${OBJECTDIR}/src/obj3dlib/objrevolucion3d.o: src/obj3dlib/objrevolucion3d.cc
	${MKDIR} -p ${OBJECTDIR}/src/obj3dlib
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/obj3dlib/objrevolucion3d.o src/obj3dlib/objrevolucion3d.cc

${OBJECTDIR}/src/obj3dlib/octaedro3d.o: src/obj3dlib/octaedro3d.cc
	${MKDIR} -p ${OBJECTDIR}/src/obj3dlib
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/obj3dlib/octaedro3d.o src/obj3dlib/octaedro3d.cc

${OBJECTDIR}/src/obj3dlib/tetraedro3d.o: src/obj3dlib/tetraedro3d.cc
	${MKDIR} -p ${OBJECTDIR}/src/obj3dlib
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/obj3dlib/tetraedro3d.o src/obj3dlib/tetraedro3d.cc

${OBJECTDIR}/src/obj3dlib/toro3d.o: src/obj3dlib/toro3d.cc
	${MKDIR} -p ${OBJECTDIR}/src/obj3dlib
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/obj3dlib/toro3d.o src/obj3dlib/toro3d.cc

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
