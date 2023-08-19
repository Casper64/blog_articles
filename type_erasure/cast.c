#include <stdio.h>

typedef struct User {
    int age;
} User;

int user_idx = 96;

void create_row(int idx) {
    // V would need to generate if statements for every type 
    // in the program and V itself
    if (idx == user_idx) {
        printf("Creating instance of User\n");        
        User obj;
        // What now???
    } else {
        printf("Unkown type!\n");
    }
}

int main() {
    create_row(user_idx);
}