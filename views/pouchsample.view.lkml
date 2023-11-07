view: pouchsample {
  sql_table_name: `Data.pouchsample` ;;

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
    sql: ${TABLE}.Cycle_No ;;
  }
  dimension: d_v_d_q_m_v_m_wh {
    type: number
    sql: ${TABLE}.dV_dQ_mV_mWh ;;
  }
  dimension: energy_m_wh {
    type: number
    sql: ${TABLE}.Energy_mWh ;;
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
    sql: ${TABLE}.Step_No ;;
  }
  dimension: step_status {
    type: string
    sql: ${TABLE}.Step_Status ;;
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
