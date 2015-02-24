/*
 * =====================================================================================
 *
 *       Filename:  linked_list.c
 *
 *    Description:
 *
 *        Version:  1.0
 *        Created:  2015-02-23 07:30:24 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (),
 *   Organization:
 *
 * =====================================================================================
 */
#include <stdio.h>
#include <stdlib.h>

struct node{
    int info;
    struct node *link;
} *start = NULL;

void insert_last(){

	int item;
	struct node *ptr;

	printf("\n\nEnter item: ");
	scanf("%d", &item);

	if(start == NULL){

		start = (struct node *)malloc(sizeof(struct node));
		start->info = item;
		start->link = NULL;

	}else{
		ptr = start;

        while (ptr->link != NULL){
		      ptr = ptr->link;
        }

		ptr->link = (struct node *)malloc(sizeof(struct node));
		ptr = ptr->link;
		ptr->info = item;
		ptr->link = NULL;
	}

	printf("\nItem inserted: %d\n", item);
}

void delete_first(){
    struct node *ptr;
    int item;

    if (start == NULL){

        printf("\n\nLinked list is empty.\n");
    }else{
        ptr = start;
        item = start->info;
        start = start->link;
        free(ptr);

        printf("\n\nItem deleted: %d", item);
    }
}

void display(){
    /* logic to display linked list goes here */
}

void main()
{
    int ch;

    do{
        printf("\n\n\n1. Insert Last\n2. Delete First\n3. Display\n4. Exit\n");
        printf("\nEnter your choice: ");
        scanf("%d", &ch);

        switch(ch){
            case 1:
                insert_last();
                break;

            case 2:
                delete_first();
                break;

            case 3:
                display();
                break;

            case 4:
                exit(0);

            default:
                printf("\n\nInvalid choice: Please try again.\n");
        }
    } while (1);
}


