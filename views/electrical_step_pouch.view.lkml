view: electrical_step_pouch {
  sql_table_name: `natrion-operational-data.Data.electrical_step_pouch` ;;

  dimension: capacity {
    type: number
    sql: ${TABLE}.Capacity ;;
  }
  dimension: cell_id {
    type: string
    sql: ${TABLE}.Cell_id ;;
  }
  dimension: end_v {
    type: number
    sql: ${TABLE}.End_V ;;
  }
  dimension: energy {
    type: number
    sql: ${TABLE}.Energy ;;
  }
  dimension: median_v {
    type: number
    sql: ${TABLE}.Median_V ;;
  }
  dimension: mode {
    type: number
    sql: ${TABLE}.Mode ;;
  }
  dimension: start_v {
    type: number
    sql: ${TABLE}.Start_V ;;
  }
  dimension: step {
    type: number
    sql: ${TABLE}.Step ;;
  }
  dimension: time {
    type: number
    sql: ${TABLE}.Time ;;
  }
  measure: count {
    type: count
  }
}
