#' cols that would be joined and their origin
#'
#' @param data_x data x
#' @param data_y data y (will be joined on x)
#' @return df with all columns of a join and their origin
#' @export
#' @examples
#' ## get_join_cols(df.x, df.y)

# function that shows which (names)columns would be joined upon entering the datasets x and y
get_join_cols <- function(data_x, data_y) {

  cols_x <- data.frame(colnames(data_x)) %>%
    dplyr::mutate(origin = "data_x") %>%
    dplyr::rename(cols = .data$colnames.data_x.)

  cols_y <- data.frame(colnames(data_y)) %>%
    dplyr::mutate(origin = "data_y") %>%
    dplyr::rename(cols = .data$colnames.data_y.)

  cols <- rbind(cols_x, cols_y)

  return(cols)

}
