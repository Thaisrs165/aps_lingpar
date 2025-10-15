#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define MAXV 256
typedef struct { char name[64]; int value; } Var;
Var vars[MAXV]; int var_count=0;

int get_var_index(const char *name){
    for(int i=0;i<var_count;i++) if(strcmp(vars[i].name,name)==0) return i;
    return -1;
}
int ensure_var(const char *name, int init){
    int i = get_var_index(name);
    if(i>=0) return i;
    strcpy(vars[var_count].name, name);
    vars[var_count].value = init;
    return var_count++;
}
int get_val(const char *token){
    if(isdigit(token[0]) || (token[0]=='-' && isdigit(token[1]))) return atoi(token);
    int idx = get_var_index(token);
    if(idx<0){ fprintf(stderr,"Variavel nao definida: %s\n", token); return 0; }
    return vars[idx].value;
}

int battery = 100;
int sujo = 1;
int bloqueado = 0;

int main(int argc, char **argv){
    if(argc<2){ fprintf(stderr,"Uso: %s arquivo.asm\n", argv[0]); return 1; }
    FILE *f = fopen(argv[1],"r");
    if(!f){ perror("fopen"); return 1; }

    char *lines[1000]; int nlines=0;
    char buf[512];
    while(fgets(buf,sizeof(buf),f)){
        lines[nlines++] = strdup(buf);
    }
    fclose(f);

    for(int pc=0; pc<nlines; ++pc){
        char *line = lines[pc];
        while(*line==' '||*line=='\t') line++;
        if(line[0]==0 || line[0]=='\n') continue;
        if(strncmp(line,"WALK",4)==0){ printf("[VM] ANDAR\n"); battery-=1; continue; }
        if(strncmp(line,"TURN",4)==0){ printf("[VM] VIRAR\n"); battery-=1; continue; }
        if(strncmp(line,"CLEAN",5)==0){ printf("[VM] LIMPAR\n"); sujo=0; battery-=2; continue; }
        if(strncmp(line,"PRINT",5)==0){ printf("%s", line+6); continue; }
    }
    printf("\n[VM] Fim da execução. Bateria=%d Sujo=%d Bloqueado=%d\n", battery, sujo, bloqueado);
    return 0;
}

