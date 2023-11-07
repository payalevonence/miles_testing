view: cycle_table_sample {
  sql_table_name: `Data.Cycle_Table_Sample` ;;

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
    sql: ${TABLE}.EnergyC ;;
  }
  dimension: energy_d {
    type: number
    sql: ${TABLE}.EnergyD ;;
  }
  dimension: first_step {
    type: number
    sql: ${TABLE}.FirstStep ;;
  }
  dimension: last_step {
    type: number
    sql: ${TABLE}.LastStep ;;
  }
  dimension: median_charge_v {
    type: number
    sql: ${TABLE}.MedianChargeV ;;
  }
  dimension: median_discharge_v {
    type: number
    sql: ${TABLE}.MedianDischargeV ;;
  }
  dimension: num_steps {
    type: number
    sql: ${TABLE}.NumSteps ;;
  }
  dimension: percent_ccc_capacity {
    type: number
    sql: ${TABLE}.PercentCCC_Capacity ;;
  }
  measure: count {
    type: count
  }
}
