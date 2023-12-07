view: electrolyte_mfg {
  sql_table_name: `natrion-operational-data.operational_data.electrolyte_mfg` ;;

  dimension: additive1_id {
    type: string
    sql: ${TABLE}.additive1_id ;;
  }
  dimension: additive2_id {
    type: string
    sql: ${TABLE}.additive2_id ;;
  }
  dimension: additive3_id {
    type: string
    sql: ${TABLE}.additive3_id ;;
  }
  dimension: additive4_id {
    type: string
    sql: ${TABLE}.additive4_id ;;
  }
  dimension: additive5_id {
    type: number
    sql: ${TABLE}.additive5_id ;;
  }
  dimension: batch_size {
    type: string
    sql: ${TABLE}.batch_size ;;
  }
  dimension: cosolvent_id {
    type: string
    sql: ${TABLE}.cosolvent_id ;;
  }
  dimension: cots {
    type: yesno
    sql: ${TABLE}.cots ;;
  }
  dimension: cots_electrolyte_id_ {
    type: string
    sql: ${TABLE}.`cots_electrolyte_id ` ;;
  }
  dimension: date_mixed {
    type: string
    sql: ${TABLE}.date_mixed ;;
  }
  dimension: date_opened {
    type: string
    sql: ${TABLE}.date_opened ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: diluent_id {
    type: string
    sql: ${TABLE}.diluent_id ;;
  }
  dimension: electolyte_id {
    type: string
    sql: ${TABLE}.electolyte_id ;;
  }
  dimension: recipe_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.recipe_id ;;
  }
  dimension: salts_id {
    type: string
    sql: ${TABLE}.salts_id ;;
  }
  dimension: solvent_id {
    type: string
    sql: ${TABLE}.solvent_id ;;
  }
  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [recipes.recipe_id, users.firstname, users.user_id, users.middlename, users.lastname]
  }
}
