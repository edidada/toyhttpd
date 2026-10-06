cmake_minimum_required(VERSION 3.10)
project(toyhttpd C)

set(CMAKE_C_STANDARD 99)

find_package(Threads REQUIRED)

# Shared httpd library
add_library(httpd_obj OBJECT httpd.c)

# Server targets
set(SERVERS
    single_process_server
    multiprocess_server
    select_server
    poll_server
    epoll_multiprocess_server
)

foreach(server ${SERVERS})
    add_executable(${server} ${server}.c $<TARGET_OBJECTS:httpd_obj>)
    target_link_libraries(${server} PRIVATE Threads::Threads)
endforeach()
