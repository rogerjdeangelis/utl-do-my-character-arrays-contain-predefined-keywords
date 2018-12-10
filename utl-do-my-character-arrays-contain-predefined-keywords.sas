Do my character arrays contain predefined keywords                                                               
                                                                                                                 
Problem                                                                                                          
    A  Does aray v1-v4 contain either 'e' or 'f'                                                                 
    B  Does aray x1-x4 contain either '7' or '2'                                                                 
                                                                                                                 
   Three solutions                                                                                               
                                                                                                                 
       1. Whichc                                                                                                 
          Reeza                                                                                                  
          https://communities.sas.com/t5/user/viewprofilepage/user-id/13879                                      
                                                                                                                 
       2. Prx (perl regular expressions)                                                                         
       3. Addr *peek,poke and addr)                                                                              
                                                                                                                 
github                                                                                                           
https://tinyurl.com/ybyudz4e                                                                                     
https://github.com/rogerjdeangelis/utl-do-my-character-arrays-contain-predefined-keywords                        
                                                                                                                 
                                                                                                                 
SAS Forum                                                                                                        
https://tinyurl.com/yanw78pz                                                                                     
https://communities.sas.com/t5/SAS-Programming/Do-Loops-Conditionally-Assigning-a-Variable/m-p/519555            
                                                                                                                 
                                                                                                                 
                                                                                                                 
WORK.SAMPLE total obs=7                         |  RULES                                                         
                                                |  -----                                                         
  V1    V2    V3    V4    X1    X2    X3    X4  |                                                                
                                                |                                                                
  a     b     c     d     9     8     7     6   |  Condition A = 0 'e' or 'f' not in v1-v4                       
                                                   Confition B = 1 '7' is in x1-x4                               
  b     c     d     e     8     7     6     5   |                                                                
  c     d     e     f     7     6     5     4   |                                                                
  d     e     f     g     6     5     4     3   |                                                                
  e     f     g     h     5     4     3     2   |                                                                
  f     g     h     i     4     3     2     1   |                                                                
  g     h     i     j     3     2     1     0   |                                                                
                                                                                                                 
EXAMPLE OUTPUT                                                                                                   
--------------                                                                                                   
                                                                                                                 
WORK.WANT total obs=7                                                                                            
                                                                                                                 
Obs   CONDA    CONDB                                                                                             
                                                                                                                 
 1      0        1                                                                                               
 2      1        1                                                                                               
 3      1        1                                                                                               
 4      1        0                                                                                               
 5      1        1                                                                                               
 6      1        1                                                                                               
 7      0        1                                                                                               
                                                                                                                 
                                                                                                                 
PROCESS                                                                                                          
=======                                                                                                          
                                                                                                                 
1. Whichc                                                                                                        
                                                                                                                 
   data want;                                                                                                    
   set have;                                                                                                     
                                                                                                                 
   conda = whichc('e', of v1-v4) | whichc('f', of v1-v4);                                                        
   condb = whichc('7', of x1-x4) | whichc('2', of x1-x4);                                                        
                                                                                                                 
   run;                                                                                                          
                                                                                                                 
                                                                                                                 
2. Prx                                                                                                           
                                                                                                                 
   data want;                                                                                                    
                                                                                                                 
    set have;                                                                                                    
                                                                                                                 
      conda = prxmatch('/e|f/',cat(of v:)) > 0;                                                                  
      condb = prxmatch('/7|2/',cat(of v:)) > 0;                                                                  
                                                                                                                 
   run;quit;                                                                                                     
                                                                                                                 
2. Addr                                                                                                          
                                                                                                                 
   data want;                                                                                                    
                                                                                                                 
    set have;                                                                                                    
                                                                                                                 
      conda = prxmatch('/e|f/',peekclong(addrlong(v1),4))>0;                                                     
      condb = prxmatch('/7|2/',peekclong(addrlong(x1),4))>0;                                                     
                                                                                                                 
   run;quit;                                                                                                     
                                                                                                                 
*                _               _       _                                                                       
 _ __ ___   __ _| | _____     __| | __ _| |_ __ _                                                                
| '_ ` _ \ / _` | |/ / _ \   / _` |/ _` | __/ _` |                                                               
| | | | | | (_| |   <  __/  | (_| | (_| | || (_| |                                                               
|_| |_| |_|\__,_|_|\_\___|   \__,_|\__,_|\__\__,_|                                                               
                                                                                                                 
;                                                                                                                
                                                                                                                 
data have;                                                                                                       
input (v1 v2 v3 v4 x1 x2 x3 x4) (: $1. );                                                                        
datalines;                                                                                                       
a b c d 9 8 7 6                                                                                                  
b c d e 8 7 6 5                                                                                                  
c d e f 7 6 5 4                                                                                                  
d e f g 6 5 4 3                                                                                                  
e f g h 5 4 3 2                                                                                                  
f g h i 4 3 2 1                                                                                                  
g h i j 3 2 1 0                                                                                                  
;                                                                                                                
run;                                                                                                             
                                                                                                                 
                                                                                                                 
