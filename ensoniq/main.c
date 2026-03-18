//
//  main.c
//  ensoniq
//
//  Created by Antoine Vignau on 18/03/2026.
//

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

//
// Constantes : file sizes
//

const unsigned int sSNDP = 1024;
const unsigned int sSNDD = 65536;   // 1024*64;
const unsigned int sDIR = 512;
const unsigned int sSHORTSEQ = 2048;    // 512*4;
const unsigned int sLONGSEQ = 8192; // 512*16;

//
// Constantes : sector list
//

const unsigned int FIN = -1;
const unsigned int lSOUNDDIR = 197;
const unsigned int lSHORTDIR = 203;
const unsigned int lLONGDIR = 209;

const unsigned int lSND1LHP = 12;
const unsigned int lSND1LHD = 13;
const unsigned int lSND1UHP = 90;
const unsigned int lSND1UHD = 91;
const unsigned int lSND2LHP = 168;
const unsigned int lSND2LHD = 169;
const unsigned int lSND2UHP = 246;
const unsigned int lSND2UHD = 247;
const unsigned int lSND3LHP = 324;
const unsigned int lSND3UHP = 402;
const unsigned int lSND3LHD = 325;
const unsigned int lSND3UHD = 403;

const unsigned int lSHORTSEQ1 = 125;
const unsigned int lSHORTSEQ2 = 215;
const unsigned int lSHORTSEQ3 = 335;
const unsigned int lSHORTSEQ4 = 149;
const unsigned int lSHORTSEQ5 = 173;
const unsigned int lSHORTSEQ6 = 239;
const unsigned int lSHORTSEQ7 = 263;
const unsigned int lSHORTSEQ8 = 359;

const unsigned int lLONGSEQ1 = 77;
const unsigned int lLONGSEQ2 = 215;
const unsigned int lLONGSEQ3 = 335;

//
// Tableaux et Structures
//

unsigned int oDIR[] =
{
    0, FIN
};

unsigned int oSNDP[] =
{
    0, FIN
};

unsigned int oSNDD[] =
{
    0, 1, 1, 1,
    2, 1, 1, 1, 1,
    2, 1, 1, 1, 1,
    2, 1, 1, 1, 1,
    2, 1, 1, 1, 1,
    2, 1, 1, 1, 1,
    2, 1, 1, 1, 1,
    2, 1, 1, 1, 1,
    2, 1, 1, 1, 1,
    2, 1, 1, 1, 1,
    2, 1, 1, 1, 1,
    2, 1, 1, 1, 1,
    2, 1, 1, 1, 1,
    FIN
};

unsigned int oSHORTSEQ[] =
{
    0, 6, 6, 6, FIN
};

unsigned int oLONGSEQ[] =
{
    0, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, FIN
};

unsigned int sizeSEC[] = {
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512,
    1024, 1024, 1024, 1024, 1024, 512
};

unsigned long offsetREC[] = {
  0, 1024, 2048, 3072, 4096, 5120,
  5632, 6656, 7680, 8704, 9728, 10752,
  11264, 12288, 13312, 14336, 15360, 16384,
  16896, 17920, 18944, 19968, 20992, 22016,
  22528, 23552, 24576, 25600, 26624, 27648,
  28160, 29184, 30208, 31232, 32256, 33280,
  33792, 34816, 35840, 36864, 37888, 38912,
  39424, 40448, 41472, 42496, 43520, 44544,
  45056, 46080, 47104, 48128, 49152, 50176,
  50688, 51712, 52736, 53760, 54784, 55808,
  56320, 57344, 58368, 59392, 60416, 61440,
  61952, 62976, 64000, 65024, 66048, 67072,
  67584, 68608, 69632, 70656, 71680, 72704,
  73216, 74240, 75264, 76288, 77312, 78336,
  78848, 79872, 80896, 81920, 82944, 83968,
  84480, 85504, 86528, 87552, 88576, 89600,
  90112, 91136, 92160, 93184, 94208, 95232,
  95744, 96768, 97792, 98816, 99840, 100864,
  101376, 102400, 103424, 104448, 105472, 106496,
  107008, 108032, 109056, 110080, 111104, 112128,
  112640, 113664, 114688, 115712, 116736, 117760,
  118272, 119296, 120320, 121344, 122368, 123392,
  123904, 124928, 125952, 126976, 128000, 129024,
  129536, 130560, 131584, 132608, 133632, 134656,
  135168, 136192, 137216, 138240, 139264, 140288,
  140800, 141824, 142848, 143872, 144896, 145920,
  146432, 147456, 148480, 149504, 150528, 151552,
  152064, 153088, 154112, 155136, 156160, 157184,
  157696, 158720, 159744, 160768, 161792, 162816,
  163328, 164352, 165376, 166400, 167424, 168448,
  168960, 169984, 171008, 172032, 173056, 174080,
  174592, 175616, 176640, 177664, 178688, 179712,
  180224, 181248, 182272, 183296, 184320, 185344,
  185856, 186880, 187904, 188928, 189952, 190976,
  191488, 192512, 193536, 194560, 195584, 196608,
  197120, 198144, 199168, 200192, 201216, 202240,
  202752, 203776, 204800, 205824, 206848, 207872,
  208384, 209408, 210432, 211456, 212480, 213504,
  214016, 215040, 216064, 217088, 218112, 219136,
  219648, 220672, 221696, 222720, 223744, 224768,
  225280, 226304, 227328, 228352, 229376, 230400,
  230912, 231936, 232960, 233984, 235008, 236032,
  236544, 237568, 238592, 239616, 240640, 241664,
  242176, 243200, 244224, 245248, 246272, 247296,
  247808, 248832, 249856, 250880, 251904, 252928,
  253440, 254464, 255488, 256512, 257536, 258560,
  259072, 260096, 261120, 262144, 263168, 264192,
  264704, 265728, 266752, 267776, 268800, 269824,
  270336, 271360, 272384, 273408, 274432, 275456,
  275968, 276992, 278016, 279040, 280064, 281088,
  281600, 282624, 283648, 284672, 285696, 286720,
  287232, 288256, 289280, 290304, 291328, 292352,
  292864, 293888, 294912, 295936, 296960, 297984,
  298496, 299520, 300544, 301568, 302592, 303616,
  304128, 305152, 306176, 307200, 308224, 309248,
  309760, 310784, 311808, 312832, 313856, 314880,
  315392, 316416, 317440, 318464, 319488, 320512,
  321024, 322048, 323072, 324096, 325120, 326144,
  326656, 327680, 328704, 329728, 330752, 331776,
  332288, 333312, 334336, 335360, 336384, 337408,
  337920, 338944, 339968, 340992, 342016, 343040,
  343552, 344576, 345600, 346624, 347648, 348672,
  349184, 350208, 351232, 352256, 353280, 354304,
  354816, 355840, 356864, 357888, 358912, 359936,
  360448, 361472, 362496, 363520, 364544, 365568,
  366080, 367104, 368128, 369152, 370176, 371200,
  371712, 372736, 373760, 374784, 375808, 376832,
  377344, 378368, 379392, 380416, 381440, 382464,
  382976, 384000, 385024, 386048, 387072, 388096,
  388608, 389632, 390656, 391680, 392704, 393728,
  394240, 395264, 396288, 397312, 398336, 399360,
  399872, 400896, 401920, 402944, 403968, 404992,
  405504, 406528, 407552, 408576, 409600, 410624,
  411136, 412160, 413184, 414208, 415232, 416256,
  416768, 417792, 418816, 419840, 420864, 421888,
  422400, 423424, 424448, 425472, 426496, 427520,
  428032, 429056, 430080, 431104, 432128, 433152,
  433664, 434688, 435712, 436736, 437760, 438784,
  439296, 440320, 441344, 442368, 443392, 444416,
  444928, 445952, 446976, 448000, 449024, 450048,
  450560
};

struct sFileList {
    unsigned int first_sector;
    unsigned int *sector_list;
    char *file_name;
    unsigned int file_size;
};

//
// Constantes : filenames
//

char pSOUNDDIR[] = "SOUNDDIR";
char pSHORTDIR[] = "SHORTSEQDIR";
char pLONGDIR[] = "LONGSEQDIR";
char pSND1LHP[] = "SND1LHP";
char pSND1LHD[] = "SND1LHD";
char pSND1UHP[] = "SND1UHP";
char pSND1UHD[] = "SND1UHD";
char pSND2LHP[] = "SND2LHP";
char pSND2LHD[] = "SND2LHD";
char pSND2UHP[] = "SND2UHP";
char pSND2UHD[] = "SND2UHD";
char pSND3LHP[] = "SND3LHP";
char pSND3LHD[] = "SND3LHD";
char pSND3UHP[] = "SND3UHP";
char pSND3UHD[] = "SND3UHD";
char pSHORTSEQ1[] = "SHORTSEQ1";
char pSHORTSEQ2[] = "SHORTSEQ2";
char pSHORTSEQ3[] = "SHORTSEQ3";
char pSHORTSEQ4[] = "SHORTSEQ4";
char pSHORTSEQ5[] = "SHORTSEQ5";
char pSHORTSEQ6[] = "SHORTSEQ6";
char pSHORTSEQ7[] = "SHORTSEQ7";
char pSHORTSEQ8[] = "SHORTSEQ8";
char pLONGSEQ1[] = "LONGSEQ1";
char pLONGSEQ2[] = "LONGSEQ2";
char pLONGSEQ3[] = "LONGSEQ3";

struct sFileList FileList[] =
{
    lSOUNDDIR, oDIR, pSOUNDDIR, sDIR,
    lSHORTDIR, oDIR, pSHORTDIR, sDIR,
    lLONGDIR, oDIR, pLONGDIR, sDIR,
    lSND1LHP, oSNDP, pSND1LHP, sSNDP,
    lSND1LHD, oSNDD, pSND1LHD, sSNDD,
    lSND1UHP, oSNDP, pSND1UHP, sSNDP,
    lSND1UHD, oSNDD, pSND1UHD, sSNDD,
    lSND2LHP, oSNDP, pSND2LHP, sSNDP,
    lSND2LHD, oSNDD, pSND2LHD, sSNDD,
    lSND2UHP, oSNDP, pSND2UHP, sSNDP,
    lSND2UHD, oSNDD, pSND2UHD, sSNDD,
    lSND3LHP, oSNDP, pSND3LHP, sSNDP,
    lSND3LHD, oSNDD, pSND3LHD, sSNDD,
    lSND3UHP, oSNDP, pSND3UHP, sSNDP,
    lSND3UHD, oSNDD, pSND3UHD, sSNDD,
    lSHORTSEQ1, oSHORTSEQ, pSHORTSEQ1, sSHORTSEQ,
    lSHORTSEQ2, oSHORTSEQ, pSHORTSEQ2, sSHORTSEQ,
    lSHORTSEQ3, oSHORTSEQ, pSHORTSEQ3, sSHORTSEQ,
    lSHORTSEQ4, oSHORTSEQ, pSHORTSEQ4, sSHORTSEQ,
    lSHORTSEQ5, oSHORTSEQ, pSHORTSEQ5, sSHORTSEQ,
    lSHORTSEQ6, oSHORTSEQ, pSHORTSEQ6, sSHORTSEQ,
    lSHORTSEQ7, oSHORTSEQ, pSHORTSEQ7, sSHORTSEQ,
    lSHORTSEQ8, oSHORTSEQ, pSHORTSEQ8, sSHORTSEQ,
    lLONGSEQ1, oLONGSEQ, pLONGSEQ1, sLONGSEQ,
    lLONGSEQ2, oLONGSEQ, pLONGSEQ2, sLONGSEQ,
    lLONGSEQ3, oLONGSEQ, pLONGSEQ3, sLONGSEQ,
    FIN
};

//
// Code
//

void ensoniq(const char* source_image, const char* destination_folder) {
    //
    // Read source file in memory
    //

    printf("\n-> source_image: %s", source_image);
    printf("\n-> destination_folder: %s", destination_folder);
    
    FILE *fp;
    fp = fopen(source_image, "rb");
    if(fp == NULL) {
        printf("\nsource_image does not exist");
        return;
    }

    unsigned long source_size;
    fseek(fp, 0, SEEK_END);
    source_size = ftell(fp);
    rewind(fp);
    
    char *source_pointer = malloc(source_size);
    size_t nread = fread(source_pointer, 1, source_size, fp);
    fclose(fp);

    //
    // Loop within the structure and create files
    //
    
    unsigned int the_sector;
    unsigned int size_sector;
    size_t file_size;

    int i = 0;
    while (FileList[i].first_sector != FIN) {
        printf("\n-- FileList[%d]", i);
        printf("\nfirst_sector: %d", FileList[i].first_sector); // OK
        printf("\nsector_list: %p", FileList[i].sector_list);
        printf("\nfile_name: %s", FileList[i].file_name);
        printf("\nfile_size: %d", FileList[i].file_size); // OK
            
        the_sector = FileList[i].first_sector;
        file_size = FileList[i].file_size;

        //
        // Get one file information
        //
        
        char *ptr_from;
        ptr_from = source_pointer;
        char *destination_pointer = malloc(file_size);
        char *ptr_to;
        ptr_to = destination_pointer;
        
        //
        // Copy one file data
        //

        int j = 0;
        while (FileList[i].sector_list[j] != FIN) {
            the_sector += FileList[i].sector_list[j];
            size_sector = sizeSEC[the_sector];
            ptr_from = source_pointer + offsetREC[the_sector];
            memcpy(ptr_to, ptr_from, size_sector);
            printf("\n---- FileList[%d].sector_list[%d]", i, j);
            printf("\n ptr_from: %p", ptr_from);
            printf("\n ptr_to: %p", ptr_to);
            printf("\n size_sector: %d", size_sector);

            ptr_from += size_sector;
            ptr_to += size_sector;
            j++;
        }

        //
        // Output file onto disk (need work)
        //
        
        char destination_path[512];
        strcpy(destination_path, destination_folder);
        strcat(destination_path, FileList[i].file_name);
        printf("\n-> destination_path: %s", destination_path);

        fp = fopen(destination_path, "wb");
        if(fp == NULL) {
            printf("\ncannot create destination file %s\n", FileList[i].file_name);
            return;
        }
        size_t nread = fwrite(destination_pointer, file_size, 1, fp);
        fclose(fp);
        free(destination_pointer);
        i++;
    }
}

//
// Main
//

int main(int argc, const char * argv[]) {
    if (argc != 3)
        printf("\nensoniq path_to_source_image destination_folder\n");
    else {
        ensoniq(argv[1], argv[2]);
        printf("\nEnd of process.\n");
    }
    return EXIT_SUCCESS;
}
