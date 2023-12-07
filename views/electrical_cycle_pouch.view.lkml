view: electrical_cycle_pouch {
  sql_table_name: `natrion-operational-data.data.electrical_cycle_pouch` ;;

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

  #dimension: polarization {
  #  type: number
  #  sql: ${TABLE} ;;
  #}

  dimension: num_steps {
    type: number
    sql: ${TABLE}.NumSteps ;;
  }
  dimension: percent_ccc_capacity {
    type: number
    label: "% Constant Current Capacity"
    value_format_name: decimal_4
    sql: ${TABLE}.PercentCCC_Capacity ;;
  }

  measure: cycle_pouch {
    type: number
    sql: ${cycle} * 1 ;;
  }
  measure: count {
    type: count
  }
}
