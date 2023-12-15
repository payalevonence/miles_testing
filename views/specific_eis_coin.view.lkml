
view: specific_eis_coin {
  derived_table: {
    sql: SELECT
                eis_coin.Zim  AS eis_pouch_zim,
                eis_coin.Zre  AS eis_pouch_zre,
                eis_coin.cell_id  AS eis_pouch_cell_id,
                eis_coin.Frequency  AS eis_pouch_frequency,
            electrode_mfg_coin.electrode_footprint  AS area_coin,
            electrode_mfg_coin.electrode_footprint * eis_coin.Zim as specific_zim,
            electrode_mfg_coin.electrode_footprint * eis_coin.Zre as specific_zre
            FROM `natrion-operational-data.data.eis_coin`  AS eis_coin
            INNER JOIN `natrion-operational-data.operational_data.cell_build`  AS cell_build ON eis_coin.cell_id = cell_build.cell_id
            INNER JOIN `natrion-operational-data.operational_data.electrode_mfg_coin`  AS electrode_mfg_coin ON cell_build.cathode_id = electrode_mfg_coin.electrode_id
            GROUP BY
                1,
                2,
                3,
                4,
                5,
                6,
                7
            ORDER BY
                1 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }


  measure: specific_zim1 {
    type: average
    sql: abs(${TABLE}.specific_zim * 1) ;;
  }

  measure: specific_zre1 {
    type: average
    sql: ${TABLE}.specific_zre ;;
  }

  dimension: eis_pouch_zim {
    type: number
    sql: ${TABLE}.eis_pouch_zim ;;
  }

  dimension: eis_pouch_zre {
    type: number
    sql: ${TABLE}.eis_pouch_zre ;;
  }

  dimension: eis_pouch_cell_id {
    type: string
    sql: ${TABLE}.eis_pouch_cell_id ;;
  }

  dimension: eis_pouch_frequency {
    type: number
    sql: ${TABLE}.eis_pouch_frequency ;;
  }

  dimension: area_coin {
    type: number
    sql: ${TABLE}.area_coin ;;
  }

  dimension: specific_zim {
    type: number
    sql: ${TABLE}.specific_zim ;;
  }

  dimension: specific_zre {
    type: number
    sql: ${TABLE}.specific_zre ;;
  }

  set: detail {
    fields: [
        eis_pouch_zim,
  eis_pouch_zre,
  eis_pouch_cell_id,
  eis_pouch_frequency,
  area_coin,
  specific_zim,
  specific_zre
    ]
  }
}
