view: electrical_step_pouch {
  sql_table_name: `natrion-operational-data.data.electrical_step_pouch` ;;

  dimension: capacity {
    type: number
    sql: ${TABLE}.Capacity ;;
  }
  dimension: cell_id {
    type: string
    sql: ${TABLE}.Cell_Id ;;
  }
  dimension: cycle {
    type: number
    sql: ${TABLE}.Cycle ;;
  }
  dimension: end_v {
    type: number
    sql: ${TABLE}.EndV ;;
  }
  dimension: energy {
    type: number
    sql: ${TABLE}.Energy ;;
  }
  dimension: median_v {
    type: number
    sql: ${TABLE}.MedianV ;;
  }
  dimension: mode {
    type: number
    sql: ${TABLE}.Mode ;;
  }
  dimension: start_v {
    type: number
    sql: ${TABLE}.StartV ;;
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
