view: eis_pouch {
  sql_table_name: `natrion-operational-data.data_test.eis_pouch` ;;

  dimension: cell_id {
    type: string
    sql: ${TABLE}.cell_id ;;
  }
  dimension: frequency {
    type: number
    sql: ${TABLE}.Frequency ;;
  }
  dimension: soh {
    type: string
    sql: ${TABLE}.soh ;;
  }
  dimension: zim {
    type: number
    sql: ${TABLE}.Zim ;;
  }
  dimension: zre {
    type: number
    sql: ${TABLE}.Zre ;;
  }
  measure: count {
    type: count
  }
}
