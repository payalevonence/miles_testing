view: protocols {
  sql_table_name: `natrion-operational-data.operational_data.protocols` ;;
  drill_fields: [protocol_id]

  dimension: protocol_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.protocol_id ;;
  }
  dimension: cycling_id {
    type: string
    sql: ${TABLE}.cycling_id ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: formation_id {
    type: string
    sql: ${TABLE}.formation_id ;;
  }
  dimension: rate_capability_id {
    type: string
    sql: ${TABLE}.rate_capability_id ;;
  }
  dimension: rc_sr_max_v {
    type: number
    sql: ${TABLE}.rc_sr_max_V ;;
  }
  dimension: rc_sr_min_v {
    type: number
    sql: ${TABLE}.rc_sr_min_V ;;
  }
  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	protocol_id,
	users.firstname,
	users.user_id,
	users.middlename,
	users.lastname,
	cell_test.count
	]
  }

}
