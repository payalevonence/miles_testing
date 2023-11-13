view: electrical_cycle_coin {
  sql_table_name: `natrion-operational-data.Data.electrical_cycle_coin` ;;

  dimension: capacity_c {
    type: number
    sql: ${TABLE}.CapacityC ;;
  }
  dimension: capacity_d {
    type: number
    sql: ${TABLE}.CapacityD ;;
  }
  dimension: ce {
    type: number
    sql: ${TABLE}.CE ;;
  }
  dimension: cell_id {
    type: string
    sql: ${TABLE}.Cell_id ;;
  }
  dimension: cycle {
    type: number
    sql: ${TABLE}.Cycle ;;
  }
  dimension: energy_c {
    type: number
    sql: ${TABLE}.Energy_C ;;
  }
  dimension: energy_d {
    type: number
    sql: ${TABLE}.Energy_D ;;
  }
  dimension: first_step {
    type: number
    sql: ${TABLE}.First_Step ;;
  }
  dimension: last_step {
    type: number
    sql: ${TABLE}.Last_Step ;;
  }
  dimension: median_charge_v {
    type: number
    sql: ${TABLE}.Median_Charge_V ;;
  }
  dimension: median_discharge_v {
    type: number
    sql: ${TABLE}.Median_Discharge_V ;;
  }
  dimension: num_steps {
    type: number
    sql: ${TABLE}.Num_Steps ;;
  }
  dimension: percent_ccc_capacity {
    type: number
    sql: ${TABLE}.Percent_CCC_Capacity ;;
  }
  measure: count {
    type: count
  }
}
