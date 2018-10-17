# Datascience Summarization

**The Packages that was used for this project were**
* Plyr
* Dplyr

### Procedure
> * Intially the data sets corresponding to Xtrain, Xtest,ytrain,ytest was read using read.table function . 
> * The four dataset were subsequently merged using the rbind and cbind functions to make it a standalone dataset
> * Further on the variable names were read from features.txt and passed on the colnames parameter in read.table function to make    the variables descriptive
> * Using A regular expression i indexed the column where there is mention of std and mean and stored in the variable
> * I filtered out the column using the above variable along with activity columnn
> * I remapped the observation activity names to make it more descriptive using the plyr revalue function
> * Lastly Igrouped the datset and summarized to produce the final Dataset
