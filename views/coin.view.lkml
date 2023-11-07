view: coin {
  sql_table_name: `Data.coin` ;;

  dimension: capacity_m_ah {
    type: number
    sql: ${TABLE}.Capacity_mAh ;;
  }
  dimension: current_m_a {
    type: number
    sql: ${TABLE}.Current_mA ;;
  }
  dimension: cycle_no {
    type: number
    sql: ${TABLE}.CycleNo ;;
  }
  dimension: filename {
    type: string
    sql: ${TABLE}.Filename ;;
  }
  dimension: record {
    type: number
    sql: ${TABLE}.Record ;;
  }
  dimension: step_no {
    type: number
    sql: ${TABLE}.StepNo ;;
  }
  dimension: step_status {
    type: string
    sql: ${TABLE}.StepStatus ;;
  }
  dimension: test_time_sec {
    type: number
    sql: ${TABLE}.TestTime_Sec ;;
  }
  dimension: voltage_v {
    type: number
    sql: ${TABLE}.Voltage_V ;;
  }
  measure: count {
    type: count
    drill_fields: [filename]
  }
}
