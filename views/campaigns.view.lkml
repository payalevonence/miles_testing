view: campaigns {
  sql_table_name: `natrion-operational-data.operational_data.campaigns` ;;
  drill_fields: [campaign_id]

  dimension: campaign_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.campaign_id ;;
  }
  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
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
	campaign_id,
	users.firstname,
	users.user_id,
	users.middlename,
	users.lastname,
	experiments.count
	]
  }

}
