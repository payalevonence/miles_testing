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
    value_format_name: decimal_0
    sql: ${TABLE}.PercentCCC_Capacity ;;
  }

  dimension: Voltage_Hysteresis1 {
    type: number
    label: "Voltage_Hysteresis(mV)"
    sql: abs(${electrical_cycle_pouch.median_discharge_v} - ${electrical_cycle_pouch.median_charge_v}) * 1000 ;;
  }


  measure: energy_d1 {
    type: average
    label: "Energy(mWh)"
    value_format_name: decimal_2
    sql: ${TABLE}.EnergyD ;;
  }

  measure: ce1 {
    type: average
    label: "CE (%)"
    value_format_name: decimal_0
    sql: ${TABLE}.CE ;;
  }

  measure: percent_ccc_capacity1 {
    type: number
    label: "% Constant Current Capacity"
    value_format_name: decimal_0
    sql: ${TABLE}.PercentCCC_Capacity ;;
  }



  measure: asrch_unfiltered {
    type: number
    label: "ASR_charge"
    sql: ${electrical_cycle_pouch.median_charge_v} + (${electrical_cycle_pouch.cycle_pouch} * 0) ;;
  }

  filter: asrch_filter {
    sql: electrical_step_pouch.mode = "118"
      }

      measure: asrch {
      type: number
      filters: [asrch_filter]
      sql: asrch_unfiltered ;;
  }

  measure: asrdis_unfiltered {
    type: number
    label: "ASR_discharge"
    sql: ${electrical_cycle_pouch.median_discharge_v} + (${electrical_cycle_pouch.cycle_pouch} * 0) ;;
  }

  filter: asrdis_filter {
    sql: electrical_step_pouch.mode = "117"
      }

      measure: asrch {
      type: number
      filters: [asrdis_filter]
      sql: asrdis_unfiltered ;;
  }


  measure: Voltage_Hysteresis {
    type: average
    label: "Voltage_Hysteresis(mV)"
    sql: abs(${electrical_cycle_pouch.median_discharge_v} - ${electrical_cycle_pouch.median_charge_v}) * 1000 ;;
  }





  measure: asrdis {
    type: number
    sql: ${electrical_cycle_pouch.median_discharge_v} + (${electrical_cycle_pouch.cycle_pouch} * 0) ;;
  }

  measure: cycle_pouch {
    type: number
    sql: ${cycle} * 1 ;;
  }
  measure: count {
    type: count
  }
}
