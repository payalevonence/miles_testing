
view: testing_median_asr {
  derived_table: {
    sql: SELECT
                pre_build_pouch.number_of_layers AS pre_build_pouch_number_of_layers,
                electrode_mfg_pouch.electrode_footprint AS electrode_mfg_pouch_electrode_footprint,
                electrode_mfg_pouch.electrode_footprint * pre_build_pouch.number_of_layers AS area_pouch,
                #pre_build_pouch.cell_id AS pre_build_pouch_cell_id,
                electrical_step_pouch.Cell_id AS cell_id,
                electrical_step_pouch.MedianV AS median_v,
                electrical_step_pouch.Mode AS mode,
                electrical_step_pouch.Capacity AS capacity,
                electrical_step_pouch.Time AS time,
                electrical_step_pouch.Cycle,
                electrical_step_pouch.StartV,
                electrical_step_pouch.Capacity / electrical_step_pouch.Time AS stepcurrent,
                CASE
                    WHEN electrical_step_pouch.Mode = 118 THEN
                        (((MedianV - StartV) / (electrical_step_pouch.Capacity / electrical_step_pouch.Time)) * (electrode_mfg_pouch.electrode_footprint * pre_build_pouch.number_of_layers)) / 1000
                    ELSE
                        NULL
                END AS charged,
                CASE
                    WHEN electrical_step_pouch.Mode = 117 THEN
                        (((StartV - MedianV) / (electrical_step_pouch.Capacity / electrical_step_pouch.Time)) * (electrode_mfg_pouch.electrode_footprint * pre_build_pouch.number_of_layers)) / 1000
                    ELSE
                        NULL
                END AS discharged
            FROM
                 `natrion-operational-data.data.electrical_step_pouch` AS electrical_step_pouch
            INNER JOIN
                `natrion-operational-data.operational_data.pre_build_pouch` AS pre_build_pouch ON pre_build_pouch.cell_id = electrical_step_pouch.Cell_id
            INNER JOIN
                `natrion-operational-data.operational_data.electrode_mfg_pouch` AS electrode_mfg_pouch ON pre_build_pouch.cathode_id = electrode_mfg_pouch.electrode_id;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: charged {
    type: average
    sql: ${TABLE}.charged ;;
  }

  measure: discharged {
    type: average
    sql: ${TABLE}.discharged ;;
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

  dimension: cycle {
    type: number
    sql: ${TABLE}.Cycle ;;
  }

  dimension: start_v {
    type: number
    sql: ${TABLE}.StartV ;;
  }

  dimension: stepcurrent {
    type: number
    sql: ${TABLE}.stepcurrent ;;
  }

  dimension: charged_dimension {
    type: number
    sql: ${TABLE}.charged ;;
  }

  dimension: discharged_dimension {
    type: number
    sql: ${TABLE}.discharged ;;
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
      start_v,
      stepcurrent,
      charged,
      discharged
    ]
  }
}
