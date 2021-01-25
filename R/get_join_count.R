#' Count Join ID in a dataset
#'
#' @param data_x data
#' @param ID_x Join ID in dataset x
#' @return df with how many times an ID appears in a dataset
#' @export
#' @examples
#' ##get_join_count(df.x, df.x$ID)



# function that generates a join count for each ID

get_join_count <- function(data_x, ID_x) {

  data_x %>%
    dplyr::group_by({{ID_x}}) %>%
    dplyr::summarise(n = dplyr::n()) %>%
    dplyr::rename(join_count = n) -> join_c

  return(join_c)

}

