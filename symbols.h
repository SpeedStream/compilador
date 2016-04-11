/*TABLA DE SÍMBOLOS*/
int dataOffset = 0;
int dataLoc(){
	dataOffset++;
	printf("dataOffset: %i\n", dataOffset);
}

struct symTable{
	char *nombre;
	int offset;
	struct symTable *next;
};

typedef struct symTable symTable;

symTable *id;

symTable *symbolName = (symTable *)0;

symTable * putSymbol (char *symbolName){
	symTable *ptr;
	printf("Anadiendo simbolo nuevo: %s\n", symbolName);
	ptr = (symTable *) malloc (sizeof(symTable));
	ptr->nombre = (char *) malloc (strlen(symbolName)+1);
	strcpy (ptr->nombre, symbolName);
	ptr->offset = dataLoc();
	ptr->next = (struct symTable *)symbolName;
	symbolName = ptr;
	printf("ptr: %i\n", ptr);
	return ptr;
}

symTable * getSymbol (char *symbolName){
	symTable *ptr;
	//printf("Buscando simbolo: %s\n", symbolName);
	for (ptr = symbolName; ptr != (symTable *) 0; ptr =  (symTable *)ptr->next){
		printf("-----------Buscando\n");
		//if(strcmp(ptr->nombre, symbolName) == 0){	-> Arroja error. No detecta nada en ptr->nombre
		if (strcmp (ptr,symbolName) == 0){
			printf("Simbolo encontrado: %s\n", symbolName);
			return ptr;
		}
		printf("-----------Saliendo\n");
	}
	return 0;
}