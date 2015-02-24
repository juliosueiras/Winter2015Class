/*
 * =====================================================================================
 *
 *       Filename:  circular_linked_list.c
 *
 *    Description:
 *
 *        Version:  1.0
 *        Created:  2015-02-23 07:24:33 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (),
 *   Organization:
 *
 * =====================================================================================
 */
#include <stdio.h>

void circular_insert_first()
{
	int item;
	struct node *ptr, *temp;

	printf("\n\nEnter item: ");
	scanf("%d", &item);

	if(start == NULL)
	{
		start = (struct node *)malloc(sizeof(struct node));
		start->info = item;
		start->link = start;
	}
	else
	{
		ptr = start; temp = start;
		start = (struct node *)malloc(sizeof(struct node));
		start->info = item;
		start->link = ptr;
		do			/* Move temp to the last node */
		{
			temp = temp->link;
		} while (temp->link != ptr);
		temp->link = start;
	}
	printf("\nItem inserted: %d\n", item);
}

void circular_display()
{
	struct node *ptr;
	int i=1;

	if (start == NULL)
		printf("\nLinklist is empty.\n");
	else
	{
		ptr = start;
		printf("\nSr. No.\t\tAddress\t\tInfo\t\tLink\n");

		do
		{
			printf("\n%d.\t\t%d\t\t%d\t\t%d\n", i, ptr, ptr->info, ptr->link);
			ptr = ptr->link;
			i++;
		} while(ptr != start);
	}
}
