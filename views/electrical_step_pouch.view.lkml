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



  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${TABLE}.Cell_Id, ${TABLE}.Cycle) ;;
  }

  dimension: delta_time_ {
    type: number
    label: "delta Time(minutes)"
    value_format: "0.00"
    sql: ${TABLE}.Time/3600 * 60 ;;
  }

  dimension: derived_delta_time {
    type: number
    value_format: "0.00"
    sql: if(${TABLE}.delta_time_ = null, -1, ${TABLE}.delta_time_)
    ;;
  }

  measure: delta_time1_ {
    type: average
    label: "delta Time(minutes)1"
    value_format_name: decimal_0
    sql: ${TABLE}.Time/3600 * 60 ;;
  }

measure: average_delta_time  {
  type: number
  value_format: "0.00"
  label: "average_delta_time"
  #sql: ${TABLE}.Time/3600 * 60 ;;
  sql: AVG(CASE WHEN ${TABLE}.Time IS NOT NULL THEN ${TABLE}.Time/3600 * 60 END) ;;
}

  measure: cycle_pouch {
    type: number
    sql: ${cycle} * 1 ;;
  }

  measure: count {
    type: count
  }
}
