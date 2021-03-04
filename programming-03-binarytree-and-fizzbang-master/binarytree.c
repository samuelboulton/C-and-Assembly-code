#include <stdio.h>
#include <string.h>
#include <stdlib.h>


// creating the structure binary tree node.
typedef struct TNode     
{ 
    int ModNo;
    char *name;
    char *semester;
    char *year;
    
    
    
    // creating the structure of the left and right of the node.
    struct TNode* left;          
    struct TNode* right; 
} TNode; 
  

// creation of the node
struct TNode* newNode(char* data[]);         
   

// what goes inside the node and the things that happen
struct TNode* newNode(char* data[])            
{ 

    
    // reading the size of the the node. using the data file.
    struct TNode* node = (struct TNode*) malloc(sizeof(struct TNode));        
   
    // stating module number as data[0].
    node->ModNo = atoi(data[0]);             

    
    // name of the program is pushed into data[1] with the size of the name untill the comma ','.
    node->name = (char*) malloc(strlen(data[1])*sizeof(char));  
    // using strcpy to shift the data one after the other.
    strcpy(node->name,data[1]);                 

    // the semester is pushed into the data[2] and messure the size of the semester.
    node->semester = (char*) malloc(strlen(data[2])*sizeof(char));
    // using strcpy to shift the data one after the other.
    strcpy(node->semester,data[2]);

    
    // the year is pushed into the data[3] and messure the size of the year characters.
    node->year = (char*) malloc(strlen(data[3])*sizeof(char));
    // using strcpy to shift the data one after the other.
    strcpy(node->year,data[3]);

    
    
    // make sure that the end nodes are NULL left and right.
    node->left = NULL; 
    node->right = NULL; 
  
    return node; 
} 
 


// inserting node into the tree.
struct TNode* insert_node( TNode *root, char *data[])
{
    
    
    // making variable called newModno.
    int newModNo = atoi(data[0]);



    // if statement checking if the root node is empty.
    if(root == NULL){
        // if it is empy place a node inside.
       root = newNode(data);
    } 
    else 
    {
    // a check point is_left = 0.
	int is_left=0;
        
    // declaring TNode* pointer cursor is root.
	TNode* cursor = root;
        
    // declaring TNode* pointer prev is NULL.
	TNode* prev = NULL;
        
    // while the cursor is NULL.
	while (cursor!=NULL)
	{
	    prev=cursor;
        
        
        // comparing the modno to the root mod number.
	    if(newModNo<root->ModNo){
            // make the is_left counter 1.
	       is_left=1;
            // if newmodno is smaller than root go left.
		cursor=cursor->left;
	    }
        // otherwise push the cursor right.
	    else
	    {
            // make the is_left counter 0.
	       is_left=0;
		cursor=cursor->right;
	    }
	}
	     if(is_left)
             // if is_left move newNode into prev.
            prev->left = newNode(data);
        else
            // else move newNode into prev.
            prev->right = newNode(data);
    }
    
    return root;
}


 // Reads contents of a file.
TNode *readingFile( TNode *root){
    char *ch;
    int num;
    
    // reading the file command and eclaring it as fp.
    FILE *fp;
    
    // open the file names pg03data.txt.
    fp = fopen("pg03data.txt", "r");

    // if fp is empty exit with error.
    if(fp == NULL){
        printf("error");
        
        // exits program.
        exit(1);
    }

    // declaring char addresses.
    char *data[4];
    
    // declaring variables.
    int pos=0;
    int a;
    size_t len = 0;
    
    
    while(getline(&ch, &len, fp)!= -1)
    {
      char *pt;
      // using strtok command to seperate the data using the comma ','.
      pt = strtok (ch,",");
      pos=0;
      while (pt != NULL)
      {
          // getting the data size form the file.
        data[pos]=(char *) malloc(strlen(pt)*sizeof(char));
          
          // copy the data into the data[pos] (data posisioning).
	   strcpy(data[pos], pt);
        pt = strtok (NULL, ",");
        
        pos++;
      }
        
        // insert the data into the root node.
	root = insert_node(root, data);
      
    }
    // close the file.
    fclose(fp);
    return root;
}




// displaying the actual tree into the console.
void display_tree(TNode* nd)
{
    
    
    if (nd == NULL)
        return;
    // display module data.
    printf("%d",nd->ModNo);
    
    
    // seeing if the node left is NUll or not.
    if(nd->left != NULL)
        // if it isnt NULL print left.
        printf("(L:%d)",nd->left->ModNo);
    if(nd->right != NULL)
        // if it isnt NULL print right.
        printf("(R:%d)",nd->right->ModNo);
    // new line.
    printf("\n");

    
    printf("%s",nd->name);
    // seeing if the node left is NUll or not.
    if(nd->left != NULL)
        // if it isnt NULL print left.
        printf("(L:%s)",nd->left->name);
    // seeing if the node right is NUll or not.
    if(nd->right != NULL)
        // if it isnt NULL print right.
        printf("(R:%s)",nd->right->name);
    // new line.
    printf("\n");

    
    printf("%s",nd->semester);
    // seeing if the node left is NUll or not.
    if(nd->left != NULL)
        // if it isnt NULL print left.
        printf("(L:%s)",nd->left->semester);
    // seeing if the node right is NUll or not.
    if(nd->right != NULL)
        // if it isnt NULL print right.
        printf("(R:%s)",nd->right->semester);
    // new line.
    printf("\n");

    
    printf("%s",nd->year);
    // seeing if the node left is NUll or not.
    if(nd->left != NULL)
        // if it isnt NULL print left.
        printf("(L:%s)",nd->left->year);
    // seeing if the node right is NUll or not.
    if(nd->right != NULL)
        // if it isnt NULL print right.
        printf("(R:%s)",nd->right->year);
    // new line.
    printf("\n");

    // links to the root variable.
    display_tree(nd->left);
    display_tree(nd->right);
}




// calls all the methods.
int main() 
{ 
    TNode *root = NULL;

    // read the file.
    root=readingFile(root); 
    // display the tree.
    display_tree(root); 

    return 0;
} 
