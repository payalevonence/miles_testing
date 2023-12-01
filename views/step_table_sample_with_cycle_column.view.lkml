view: step_table_sample_with_cycle_column {
  sql_table_name: `natrion-operational-data.Data.Step_Table_Sample_with_Cycle_Column` ;;

  dimension: capacity {
    type: number
    sql: ${TABLE}.Capacity ;;
  }
  dimension: cell_id {
    type: string
    sql: ${TABLE}.Cell_id ;;
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
