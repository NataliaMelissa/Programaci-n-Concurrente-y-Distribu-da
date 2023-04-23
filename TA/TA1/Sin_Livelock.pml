bool lock = false;

proctype Process1() {
    do
    :: true ->
        printf("Process 1 waiting...\n");
        atomic { lock = true; }
        printf("Process 1 acquired the lock.\n");
        atomic { lock = false; }
    od
}

proctype Process2() {
    do
    :: true ->
        printf("Process 2 waiting...\n");
        atomic { lock = true; }
        printf("Process 2 acquired the lock.\n");
        atomic { lock = false; }
    od
}

init {
    run Process1();
    run Process2();
}
