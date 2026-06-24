#pragma once

#include <gtk/gtk.h>
#include <glib-object.h>

G_BEGIN_DECLS

G_DECLARE_FINAL_TYPE(MyApplication, my_application, MY, APPLICATION, GtkApplication)
MyApplication* my_application_new(FlDartProject* project);

G_END_DECLS
