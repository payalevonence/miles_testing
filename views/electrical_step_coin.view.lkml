view: electrical_step_coin {
  sql_table_name: `natrion-operational-data.data.electrical_step_coin` ;;

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

  dimension: delta_time_ {
    type: number
    label: "delta Time(minutes)"
    value_format_name: decimal_2
    sql: ${TABLE}.Time/3600 * 60 ;;
  }

  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${TABLE}.Cell_Id, ${TABLE}.Cycle) ;;
  }

  measure: delta_time1_ {
    type: average
    label: "delta Time(minutes)"
    value_format_name: decimal_2
    sql: ${TABLE}.Time/3600 * 60 ;;
  }

  measure: cycle_pouch {
    type: number
    sql: ${cycle} * 1 ;;
  }

  measure: count {
    type: count
  }
}
