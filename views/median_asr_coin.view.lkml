
view: median_asr_coin {
  derived_table: {
    sql: SELECT
                electrode_mfg_coin.electrode_footprint AS electrode_footprint,
                electrical_step_coin.Cell_id AS cell_id,
                electrical_step_coin.MedianV AS median_v,
                electrical_step_coin.Mode AS mode,
                electrical_step_coin.Capacity AS capacity,
                electrical_step_coin.Time AS time,
                electrical_step_coin.Cycle,
                electrical_step_coin.StartV,
                MedianV - StartV as chargeV,
                electrical_step_coin.Capacity / electrical_step_coin.Time AS stepcurrent,
                CASE
                    WHEN electrical_step_coin.Mode = 118 THEN
                        (((MedianV - StartV) / (electrical_step_coin.Capacity / electrical_step_coin.Time)) * (electrode_mfg_coin.electrode_footprint)) / 1000
                    ELSE
                        NULL
                END AS charged,
                CASE
                    WHEN electrical_step_coin.Mode = 117 THEN
                        (((StartV - MedianV) / (electrical_step_coin.Capacity / electrical_step_coin.Time)) * (electrode_mfg_coin.electrode_footprint)) / 1000
                    ELSE
                        NULL
                END AS discharged
            FROM `natrion-operational-data.data.electrical_step_coin` AS electrical_step_coin
            LEFT JOIN `natrion-operational-data.operational_data.cell_build` AS cell_build ON cell_build.cell_id = electrical_step_coin.Cell_id
            LEFT JOIN `natrion-operational-data.operational_data.electrode_mfg_coin` AS electrode_mfg_coin ON cell_build.cathode_id = electrode_mfg_coin.electrode_id

                where (electrical_step_coin.Capacity not in(0.0)) and (electrical_step_coin.Time not in(0.0)) and (electrical_step_coin.Mode = 117 or electrical_step_coin.Mode = 118)
                order by electrical_step_coin.Capacity, electrical_step_coin.Time  ;;
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

  dimension: electrode_footprint {
    type: number
    sql: ${TABLE}.electrode_footprint ;;
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

  dimension: charge_v {
    type: number
    sql: ${TABLE}.chargeV ;;
  }

  dimension: stepcurrent {
    type: number
    sql: ${TABLE}.stepcurrent ;;
  }

  dimension: charged1 {
    type: number
    sql: ${TABLE}.charged ;;
  }

  dimension: discharged1 {
    type: number
    sql: ${TABLE}.discharged ;;
  }

  set: detail {
    fields: [
        electrode_footprint,
  cell_id,
  median_v,
  mode,
  capacity,
  time,
  cycle,
  start_v,
  charge_v,
  stepcurrent,
  charged,
  discharged
    ]
  }
}
