QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    backend/auteur.cpp \
    backend/livre.cpp \
    main.cpp \
    mainwindow.cpp

HEADERS += \
    backend/BDR_SQLite3.h \
    backend/WeakSQLCommandGenerator.h \
    backend/auteur.h \
    backend/livre.h \
    mainwindow.h

FORMS += \
    mainwindow.ui
LIBS += -lsqlite3

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    modele/db_v0.0.1.sql \
    modele/dut_puc2442_proj.db
