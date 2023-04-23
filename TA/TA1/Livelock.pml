bool lock = true;

proctype Process1() {
    do
    :: lock == true ->
        printf("Process 1 acquired the lock.\n");
        lock = false;
    :: else ->
        printf("Process 1 waiting for the lock...\n");
    od
}

proctype Process2() {
    do
    :: lock == true ->
        printf("Process 2 acquired the lock.\n");
        lock = false;
    :: else ->
        printf("Process 2 waiting for the lock...\n");
    od
}

init {
    run Process1();
    run Process2();
}
