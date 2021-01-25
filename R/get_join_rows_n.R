#' count of rows with join
#'
#' @param data_x data x that the join will be based on
#' @param ID_x Join ID in dataset x
#' @param ID_y Join ID in dataset y
#' @return dataframe of n rows that have a join match in x
#' @export
#' @examples
#' ##get_join_rows_n(df.x, df.x$ID, df.y$ID)



# function that summarises how many rows of the total rows of x will have a join match based on entered IDs of x and y
get_join_rows_n <- function(data_x, ID_x, ID_y) {
  suppressWarnings(
  data_x %>%
    dplyr::mutate(join_index = ifelse(ID_x %in% ID_y,
                               1,
                               0)) -> data_x
  )

  suppressWarnings(
  data_x %>%
    dplyr::group_by(.data$join_index) %>%
    dplyr::count() -> n_sum
)
  return(n_sum)

}
