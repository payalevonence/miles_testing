
view: pdt_medianasr {
  derived_table: {
    sql: SELECT
                      Step_Table_Sample_with_Cycle_Column.MedianV  AS step_table_sample_median_v,
                      Step_Table_Sample_with_Cycle_Column.Capacity  AS step_table_sample_capacity,
                      electrode_mfg_coin.electrode_footprint as electrode_footprint,
                      Step_Table_Sample_with_Cycle_Column.Time  AS step_table_sample_time,
                      Step_Table_Sample_with_Cycle_Column.Mode  AS step_table_sample_mode,
                      Step_Table_Sample_with_Cycle_Column.Cell_id  AS step_table_sample_cell_id,
                      cell_test.test_date as test_date,
                      Step_Table_Sample_with_Cycle_Column.cycle as Step_Table_Sample_with_Cycle_Column_cycle,
                      Step_Table_Sample_with_Cycle_Column.Capacity / Step_Table_Sample_with_Cycle_Column.Time as step_current,
                      Step_Table_Sample_with_Cycle_Column.MedianV / (Step_Table_Sample_with_Cycle_Column.Capacity / Step_Table_Sample_with_Cycle_Column.Time) * electrode_mfg_coin.electrode_footprint as Median_ASR
                  FROM `Data.Step_Table_Sample_with_Cycle_Column`  AS Step_Table_Sample_with_Cycle_Column
                  INNER JOIN `natrion-operational-data.operational_data.cell_build`  AS cell_build ON Step_Table_Sample_with_Cycle_Column.cell_id = cell_build.cell_id
                  INNER JOIN `natrion-operational-data.operational_data.electrode_mfg_coin`  AS electrode_mfg_coin ON electrode_mfg_coin.electrode_id = cell_build.cathode_id
                  INNER JOIN `natrion-operational-data.operational_data.cell_test` AS cell_test ON cell_build.cell_id = cell_test.Cell_id

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
                      10
                  ORDER BY
                      5 DESC ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: cycle {
    type: number
    sql: ${step_table_sample_with_cycle_column_cycle} * 1 ;;
  }

  dimension: step_table_sample_median_v {
    type: number
    sql: ${TABLE}.step_table_sample_median_v ;;
  }

  dimension: step_table_sample_capacity {
    type: number
    sql: ${TABLE}.step_table_sample_capacity ;;
  }

  dimension: electrode_footprint {
    type: number
    sql: ${TABLE}.electrode_footprint ;;
  }

  dimension: step_table_sample_time {
    type: number
    sql: ${TABLE}.step_table_sample_time ;;
  }

  dimension: step_table_sample_mode {
    type: number
    sql: ${TABLE}.step_table_sample_mode ;;
  }

  dimension: step_table_sample_cell_id {
    type: string
    sql: ${TABLE}.step_table_sample_cell_id ;;
  }

  dimension_group: test_date {
    type: time
    datatype: datetime
    sql: ${TABLE}.test_date ;;
  }

  dimension: step_table_sample_with_cycle_column_cycle {
    type: number
    sql: ${TABLE}.Step_Table_Sample_with_Cycle_Column_cycle ;;
  }

  dimension: step_current {
    type: number
    sql: ${TABLE}.step_current ;;
  }

  dimension: median_asr {
    type: number
    sql: ${TABLE}.Median_ASR / 1000 ;;
  }

  dimension: median_asr1 {
    type: number
    primary_key: yes
    sql: ${TABLE}.Median_ASR / 1000 ;;
  }


  set: detail {
    fields: [
        step_table_sample_median_v,
  step_table_sample_capacity,
  electrode_footprint,
  step_table_sample_time,
  step_table_sample_mode,
  step_table_sample_cell_id,
  test_date_time,
  step_table_sample_with_cycle_column_cycle,
  step_current,
  median_asr
    ]
  }
}
