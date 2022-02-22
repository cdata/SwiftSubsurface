//
//  subsurface.h
//  Subsurface
//
//  Created by Chris Joel on 12/20/21.
//

#ifndef subsurface_h
#define subsurface_h

#include <stdint.h>

struct IOSViewFFI;

struct IOSNative {
    void *view;
    void *metal_layer;
    void (*dispatch)(int32_t arg);
};

struct IOSViewFFI *create_subsurface(struct IOSNative object);

void enter_subsurface_frame(struct IOSViewFFI *handler);
void update_subsurface_layout(struct IOSViewFFI *handler);
void set_subsurface_density(struct IOSViewFFI *handler, float density);
void set_subsurface_corner_radius(struct IOSViewFFI *handler, float corner_radius);
void set_subsurface_speed(struct IOSViewFFI *handler, float speed);

#endif /* subsurface_h */

