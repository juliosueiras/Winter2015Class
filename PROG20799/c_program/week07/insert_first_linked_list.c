/*
 * =====================================================================================
 *
 *       Filename:  insert_first_linked_list.c
 *
 *    Description:
 *
 *        Version:  1.0
 *        Created:  2015-02-18 07:20:40 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (),
 *   Organization:
 *
 * =====================================================================================
 */
#include <stdlib.h>
#include <stdio.h>
#include <stdlib.h>

struct node{
    int info;
    struct node *link;
} *start = NULL;

void insert_first(){
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
		start = (struct node *)malloc(sizeof(struct node));
		start->info = item;
		start->link = ptr;
	}
	printf("\nItem inserted: %d\n", item);
}

void display(){
	struct node *ptr = start;
	int i=1;

	if (ptr == NULL){
		printf("\nLinklist is empty.\n");
    }else{
        printf("\nSr. No.\t\tAddress\t\tInfo\t\tLink\n");
        while(ptr != NULL){
            printf("\n%d.\t\t%d\t\t%d\t\t%d\n", i, ptr, ptr->info, ptr->link);
            ptr = ptr->link;
            i++;
        }
    }
}

void main(){
    int ch;
    do{
        printf("\n\n\n1. Insert First\n2. Display\n3. Exit\n");
        printf("\nEnter your choice: ");
        scanf("%d", &ch);

        switch(ch){
            case 1:
                insert_first();
                break;
            case 2:
                display();
                break;
            case 3:
                exit(0);
            default:
                printf("\n\nInvalid choice. Please try again.\n");
        }
    } while (1);
}
