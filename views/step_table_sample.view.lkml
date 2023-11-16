view: step_table_sample {
  sql_table_name: `Data.Step_Table_Sample` ;;

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

  dimension: delta_time_ {
    type: number
    sql: ${TABLE}.Time/3600 ;;
  }

  measure: step_count {
    type: count_distinct
    sql: ${step};;
  }


  measure: count {
    type: count
  }
}
