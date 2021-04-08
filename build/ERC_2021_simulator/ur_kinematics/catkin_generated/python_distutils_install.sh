#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/projects/arm/src/ERC_2021_simulator/ur_kinematics"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/projects/arm/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/projects/arm/install/lib/python2.7/dist-packages:/projects/arm/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/projects/arm/build" \
    "/usr/bin/python2" \
    "/projects/arm/src/ERC_2021_simulator/ur_kinematics/setup.py" \
     \
    build --build-base "/projects/arm/build/ERC_2021_simulator/ur_kinematics" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/projects/arm/install" --install-scripts="/projects/arm/install/bin"
