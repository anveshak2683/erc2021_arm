execute_process(COMMAND "/projects/arm/build/ERC_2021_simulator/ur_kinematics/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/projects/arm/build/ERC_2021_simulator/ur_kinematics/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
