# **README-Assignment 3**

**Scientific Programming-Systems Biology** 
 
This objective of this assignment is to work with Nextflow in order to understand the importance of parallel computing in all the algorithms that allow this kind of approach. In this particular case, the goal is to print all the logP values obtained from a Sparql query to obtain all the posible molecules from wikidata. The amount of results in this query is about 158,785 molecules.  

## **Content of Repository**

* Buffer1.nf
* Buffer2.nf
* Buffer3.nf
* Buffer4.nf
* Authors.md
* Readme.md
* License
* SmilesQueryWikidata.R
* AllSmilesWikidata.tsv
* Small.tsv
 
## **Required Programs**

In order to run this file is important to have nextflow installed. For this reason a subsystem of linux, ubuntu was installed in order to host this program from a windows operative system.
 
This is the line of code required to install nextflow in the command window.
```{groovy}
curl -s https://get.nextflow.io | bash
```
##**Query**

The query to obtain all the molecules from wikidata was done in R in the file called SmilesQueryWikidata.R. The results obtained were stored in two files: AllSmilesWikidata.tsv which contains all the 158785 results and Small.tsv which contain only 10000 results in order to try the code with less molecules expending less time.

##**Nextflow files**

There are four Nextflow files in the repository called Buffer1.nf, Buffer2.nf, Buffer3.nf, Buffer4.nf. These file analyse all the molecules taking the file AllSmilesWikidata.tsv. However, if the user wants to analyse another file such as Small.tsv with only 10,000 molecules. Line 12 must be replaced with the name of the file as follows
```{groovy}
12.  .fromPath("./AllSmilesWikidata.tsv")
```
must be replaced by
```{groovy}
12.  .fromPath("./Small.tsv")
```
Or any other file that the user wants to use as long as its located in the same folder as the nextflow files.

All have exactly the same code differing only from the size of the buffer that is applied to the system. This difference can be observed in line 17 where the number is change for each one of the files as follows

```{groovy}
	17.  .buffer( size: 1, remainder: true)
	17.  .buffer( size: 2, remainder: true)
	17.  .buffer( size: 3, remainder: true)
	17.  .buffer( size: 4, remainder: true)
```
The biggest the number the less buffered the system will be and concequently the calculation will be faster.

##**Results**
After running the 4 files in the command windows using this code:
```{groovy}
	time ./ nextflow Buffer1.nf
	time ./ nextflow Buffer2.nf
	time ./ nextflow Buffer3.nf
	time ./ nextflow Buffer4.nf
```
The running time was observed and compared for each one of the files. The recorded times were:

|         | Real    | User    | Sys    |
|---------|---------|---------|--------|
| Buffer1 | 20'34'' | 36'20'' | 5'44'' |
| Buffer2 | 10'32'' | 20'16'' | 3'12'' |
| Buffer3 | 9'30''  | 17'21'' | 2'19'' |
| Buffer4 | 8'37''  | 15'57'' | 1'54'' |

##**Conclusions**
As expected the speed of processing the code was higher when the buffer was smaller. On the other hand when the buffer was increased the speed decreased accordingly. This approach is useful to see somehow the importance of paralel computing in big tasks analasying a relative big amount of data. However, this technic does not relate exactly with the use of one or more cores. Hence, even if the results would be qualitative similar, the times of simulation would be different.

## **License** 
The license used is [MIT](https://choosealicense.com/licenses/mit/) it has permissions for commercial use, distribution, modification, and private use. There are limitations regarding the liability and warranty. 
