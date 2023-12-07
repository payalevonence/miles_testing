
view: final_median_asr {
  derived_table: {
    sql: SELECT
          pre_build_pouch.number_of_layers  AS pre_build_pouch_number_of_layers,
          electrode_mfg_pouch.electrode_footprint  AS electrode_mfg_pouch_electrode_footprint,
          electrode_mfg_pouch.electrode_footprint * pre_build_pouch.number_of_layers AS area_pouch,
          pre_build_pouch.cell_id  AS pre_build_pouch_cell_id,
          electrical_step_pouch.Cell_id AS cell_id,
          electrical_step_pouch.MedianV AS median_v,
          electrical_step_pouch.Mode AS mode,
          electrical_step_pouch.Capacity AS capacity,
          electrical_step_pouch.Time AS time,
          electrical_step_pouch.Cycle,
          electrical_step_pouch.StartV,
          electrical_step_pouch.Capacity / electrical_step_pouch.Time as stepcurrent
      FROM `natrion-operational-data.operation_data.pre_build_pouch`  AS pre_build_pouch
      INNER JOIN `natrion-operational-data.operation_data.electrode_mfg_pouch`  AS electrode_mfg_pouch ON pre_build_pouch.cathode_id = electrode_mfg_pouch.electrode_id
      INNER JOIN `natrion-operational-data.data.electrical_step_pouch` AS electrical_step_pouch ON
      pre_build_pouch.cell_id = electrical_step_pouch.Cell_id
      GROUP BY
          1,
          2,
          3,
          4,
          5,
          6,
          7,
          8,
          9,
          10,
          11,
          12
      ORDER BY
          1 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: cycle_pouch {
    type: number
    sql: ${cycle} * 1 ;;
  }

  dimension: pre_build_pouch_number_of_layers {
    type: number
    sql: ${TABLE}.pre_build_pouch_number_of_layers ;;
  }

  dimension: electrode_mfg_pouch_electrode_footprint {
    type: number
    sql: ${TABLE}.electrode_mfg_pouch_electrode_footprint ;;
  }


  dimension: area_pouch {
    type: number
    sql: ${TABLE}.area_pouch ;;
  }

  dimension: pre_build_pouch_cell_id {
    type: string
    sql: ${TABLE}.pre_build_pouch_cell_id ;;
  }

  dimension: start_v {
    type: number
    sql: ${TABLE}.StartV ;;
  }

  dimension: cell_id {
    type: string
    sql: ${TABLE}.cell_id ;;
  }

  dimension: median_v {
    type: number
    sql: ${TABLE}.median_v ;;
  }

  dimension: mode {
    type: number
    sql: ${TABLE}.mode ;;
  }

  dimension: capacity {
    type: number
    sql: ${TABLE}.capacity ;;
  }

  dimension: time {
    type: number
    sql: ${TABLE}.time ;;
  }

  dimension: median_asr {
    type: number
    sql: ((${final_median_asr.median_v} / ${final_median_asr.stepcurrent}) * ${final_median_asr.area_pouch}) / 1000 ;;
  }

  dimension: median_asr_charged {
    type: number
    sql: (((${final_median_asr.median_v} - ${start_v}) / ${final_median_asr.stepcurrent}) * ${final_median_asr.area_pouch}) / 1000 ;;
  }

  dimension: median_asr_discharged {
    type: number
    sql: (((${start_v} - ${final_median_asr.median_v}) / ${final_median_asr.stepcurrent}) * ${final_median_asr.area_pouch}) / 1000 ;;
  }

  dimension: cycle {
    type: number
    sql: ${TABLE}.Cycle ;;
  }

  dimension: stepcurrent {
    type: number
    sql: ${TABLE}.stepcurrent ;;
  }

  set: detail {
    fields: [
        pre_build_pouch_number_of_layers,
  electrode_mfg_pouch_electrode_footprint,
  area_pouch,
  pre_build_pouch_cell_id,
  cell_id,
  median_v,
  mode,
  capacity,
  time,
  cycle,
  stepcurrent
    ]
  }
}
