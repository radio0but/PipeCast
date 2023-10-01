#include <QApplication>
#include "mainwindow.h"
#include <iostream>
#include <cstdlib>
#include <cstring>
#include <sstream>
#include <fstream>

int main(int argc, char *argv[]) {
    QApplication app(argc, argv);
  
    MainWindow mainWindow;
    mainWindow.show();

    return app.exec();
}
