#include <stdint.h>
#include "clogan_core.h"

void initLogan(const char *cache_dirs, const char *path_dirs, int max_file, const char *encrypt_key16,
               const char *encrypt_iv16){
    clogan_init(cache_dirs, path_dirs, max_file, encrypt_key16, encrypt_iv16);
}

void openFile(const char *pathname) {
    clogan_open(pathname);
}

void writeLog(int flag, char *log, long long local_time, char *thread_name, long long thread_id,
              int is_main){
    clogan_write(flag, log, local_time, thread_name, thread_id, is_main);
}

void flush(){
    clogan_flush();
}

void isDebug(int debug){
    clogan_debug(debug);
}