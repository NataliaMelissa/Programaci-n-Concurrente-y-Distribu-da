mtype = { P1, P2, P3 };

bool lock = false;
mtype turn = P1;

proctype Process1() {
    do
    :: turn == P1 ->
        printf("Process 1 waiting...\n");
        atomic { lock = true; turn = P2; }
        printf("Process 1 acquired the lock.\n");
        /* Hacer algo útil aquí */
        atomic { lock = false; }
    :: turn != P1 ->
        skip
    od
}

proctype Process2() {
    do
    :: turn == P2 ->
        printf("Process 2 waiting...\n");
        atomic { lock = true; turn = P3; }
        printf("Process 2 acquired the lock.\n");
        /* Hacer algo útil aquí */
        atomic { lock = false; }
    :: turn != P2 ->
        skip
    od
}

proctype Process3() {
    do
    :: turn == P3 ->
        printf("Process 3 waiting...\n");
        atomic { lock = true; turn = P1; }
        printf("Process 3 acquired the lock.\n");
        /* Hacer algo útil aquí */
        atomic { lock = false; }
    :: turn != P3 ->
        skip
    od
}

init {
    run Process1();
    run Process2();
    run Process3();
}
