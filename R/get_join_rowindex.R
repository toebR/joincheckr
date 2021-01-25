#' col indicating join partner in y
#'
#' @param data_x data x that the join will be based on
#' @param ID_x Join ID in dataset x
#' @param ID_y Join ID in dataset y
#' @return df x with new column join_index (0 = FALSE)
#' @export
#' @examples
#' ##get_join_rowindex(df.x, df.x$ID, df.y$ID)


# create new column that indicates if this row finds at least one match in ID of y
get_join_rowindex <- function(data_x, ID_x, ID_y) {

  data_x %>%
    dplyr::mutate(join_index = ifelse(ID_x %in% ID_y,
                               1,
                               0)) -> data_x
  return(data_x)
}
