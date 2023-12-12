view: electrical_cycle_coin {
  sql_table_name: `natrion-operational-data.data.electrical_cycle_coin` ;;

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
    label: "CE (%)"
    value_format_name: decimal_2
    sql: ${TABLE}.CE ;;
  }
  dimension: cell_id {
    type: string
    sql: ${TABLE}.Cell_Id ;;
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
    label: "Energy(mWh)"
    value_format_name: decimal_2
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

  measure: energy_d1 {
    type: number
    label: "Energy(mWh)"
    value_format_name: decimal_2
    sql: ${TABLE}.EnergyD ;;
  }

  measure: ce1 {
    type: number
    label: "CE (%)"
    value_format_name: decimal_0
    sql: ${TABLE}.CE ;;
  }

  measure: count {
    type: count
  }
}
