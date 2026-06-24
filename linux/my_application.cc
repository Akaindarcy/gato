#include "my_application.h"
#include <flutter_linux/flutter_linux.h>
#ifdef GDK_WINDOWING_X11
#include <gdk/gdkx.h>
#endif
#include <glib.h>
#include <flutter/dart_project.h>
#include <flutter/flutter_view_controller.h>

struct _MyApplication {
  GtkApplication parent_instance;
  FlDartProject* dart_project;
  FlView* view;
  GtkWindow* window;
};

G_DEFINE_TYPE(MyApplication, my_application, GTK_TYPE_APPLICATION)

static void my_application_activate(GApplication* application) {
  MyApplication* self = MY_APPLICATION(application);
  gtk_window_present(GTK_WINDOW(self->window));
}

static void my_application_startup(GApplication* application) {
  G_APPLICATION_CLASS(my_application_parent_class)->startup(application);
}

static void my_application_shutdown(GApplication* application) {
  G_APPLICATION_CLASS(my_application_parent_class)->shutdown(application);
}

MyApplication* my_application_new(FlDartProject* dart_project) {
  return MY_APPLICATION(g_object_new(my_application_get_type(), "application-id", "com.example.gato", "flags", G_APPLICATION_NON_UNIQUE, nullptr));
}
